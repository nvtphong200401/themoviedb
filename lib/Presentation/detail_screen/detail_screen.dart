import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_project/Domain/Entities/MovieEntity.dart';
import 'package:movie_project/Presentation/detail_screen/actor_card_component.dart';
import 'package:movie_project/Presentation/detail_screen/image_screen.dart';
import 'package:movie_project/Presentation/detail_screen/reviews_screen.dart';
import 'package:movie_project/Presentation/logic_holders/providers/providers.dart';
import 'package:movie_project/Presentation/reuse_component/botom_nav.dart';
import 'package:movie_project/Presentation/trailer_screen/trailer_screen.dart';

import '../splash_screen/splash_screen.dart';

class DetailScreen extends ConsumerWidget {
  final MovieEntity movieEntity;
  const DetailScreen({Key? key, required this.movieEntity}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                elevation: 0.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    "https://image.tmdb.org/t/p/w500${movieEntity.backdropPath}",
                    fit: BoxFit.cover,

                  ),
                ),
                title: Text(movieEntity.title!),
              ),
            ];
          },
          body: Padding(
            padding: EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildDetail(context),
                  SizedBox(
                    height: 20,
                  ),
                  Text(movieEntity.overview!),
                  SizedBox(
                    height: 10,
                  ),
                  // Expanded(
                  //     child:
                  // )
                  ref
                      .watch(castProvider('/movie/${movieEntity.id}/credits'))
                      .when(
                          data: (data) => buildCastAndCrew(context, data),
                          error: (error, trace) {
                            print(error);
                            return Center(child: Text(error.toString()));
                          },
                          loading: () => SplashScreen()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column buildCastAndCrew(BuildContext context, data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Casting',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.cast.length,
            itemBuilder: (context, index) {
              return ActorCard(castEntity: data.cast[index]);
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Crews',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.crew.length,
            itemBuilder: (context, index) {
              return ActorCard(castEntity: data.crew[index]);
            },
          ),
        )
      ],
    );
  }

  Row buildDetail(BuildContext context) {
    String url = "https://image.tmdb.org/t/p/w500${movieEntity.posterPath}";
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ImageScreen(url: url)));
          },
          child: Hero(
            tag: url,
            child: Image.network(
              url,
              height: 100,
              width: 100,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 200,
              child: Text(
                movieEntity.title!,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(movieEntity.voteAverage.toString()),
                TextButton(
                  onPressed: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewScreen(movieId: movieEntity.id!)))
                  },
                  child: Text('Read reviews'),
                ),

              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Icon(
                  Icons.remove_red_eye_rounded,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(movieEntity.popularity.toString()),
                TextButton(
                    onPressed: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TrailerScreen(movieId: movieEntity.id!,)))
                    },
                    child: Text('Watch trailers')
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
