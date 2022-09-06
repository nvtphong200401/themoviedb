import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_project/Domain/Entities/CastEntity.dart';
import 'package:movie_project/Domain/Entities/MovieEntity.dart';
import 'package:movie_project/Presentation/logic_holders/providers/providers.dart';
import 'package:http/http.dart' as http;

import '../splash_screen/splash_screen.dart';

class CareerCard extends ConsumerWidget {
  CastEntity castEntity;
  CareerCard({Key? key, required this.castEntity}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(careerProvider(castEntity)).when(
        data: (data) {
          List<MovieEntity> movies = data.knowFor;
          return SingleChildScrollView(
            child: Container(
              height: 280,
              child: ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Image.network(
                          "https://image.tmdb.org/t/p/w500${movies[index].posterPath}",
                          height: 100,
                          width: 100,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return Image.network(
                              'https://cdn.tgdd.vn/hoi-dap/580732/loi-404-not-found-la-gi-9-cach-khac-phuc-loi-404-not-3-800x534.jpg',
                              height: 100,
                              width: 100,
                            );
                          },
                        ),
                        SizedBox(width: 20,),
                        Column(
                          children: [
                            Container(
                              width: 200,
                              child: Text(
                                movies[index].releaseDate != null && movies[index].releaseDate != "null"
                                    ? movies[index].releaseDate.toString()
                                    : 'Unknown',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 200,
                              child: Text(
                                movies[index].title != null
                                    ? movies[index].title!
                                    : 'Unknown',
                                style: const TextStyle(
                                    fontStyle: FontStyle.italic),
                              ),
                            )
                          ],
                        ),
                      ],
                    );
                  }),
            ),
          );
        },
        error: (error, trace) {
          print(error);
          return Center(child: Text(error.toString()));
        },
        loading: () => SplashScreen());
  }

  Future image(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Image.network(
        url,
        height: 100,
        width: 100,
      );
    }
    print(response.statusCode);
    return Image.network(
      'https://cdn.tgdd.vn/hoi-dap/580732/loi-404-not-found-la-gi-9-cach-khac-phuc-loi-404-not-3-800x534.jpg',
      height: 100,
      width: 100,
    );
  }
}
