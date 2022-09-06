import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_project/Domain/Entities/ReviewerEntity.dart';
import 'package:movie_project/Presentation/logic_holders/providers/providers.dart';

import '../splash_screen/splash_screen.dart';

class ReviewScreen extends ConsumerWidget {
  final int movieId;
  const ReviewScreen({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews'),
      ),
      body: ref.watch(reviewProvider('/movie/$movieId/reviews')).when(
          data: (data) => Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: data.items.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 2,
                            child: ListTile(
                              leading: Avatar(data, index),
                              title: NameAndRating(data, index),
                              subtitle: Comment(data, index),
                            ),
                          );
                        }),
                  ),
                ],
              ),
          error: (error, trace) {
            print(error);
            return Center(child: Text(error.toString()));
          },
          loading: () => SplashScreen()),
    );
  }

  Image Avatar(data, int index) {
    return Image.network(data.items[index].reviewerDetail!.avatarPath,
        height: 100, errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
      return Image.network(
        'https://cdn.tgdd.vn/hoi-dap/580732/loi-404-not-found-la-gi-9-cach-khac-phuc-loi-404-not-3-800x534.jpg',
        height: 100,
        width: 100,
      );
    });
  }

  Text Comment(data, int index) {
    return Text(
      data.items[index].content!,
      style: const TextStyle(fontSize: 15, color: Colors.black),
    );
  }

  Column NameAndRating(data, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data.items[index].author!,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        RatingBarIndicator(
          rating: data.items[index].reviewerDetail.rating,
          itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          itemSize: 15.0,
        )
      ],
    );
  }
}
