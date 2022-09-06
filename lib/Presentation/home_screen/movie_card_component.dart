
import 'package:flutter/material.dart';
import 'package:movie_project/Domain/Entities/MovieEntity.dart';
import 'package:movie_project/Presentation/detail_screen/detail_screen.dart';

class MovieCard extends StatelessWidget {
  final MovieEntity movieEntity;
  const MovieCard({Key? key, required this.movieEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailScreen(movieEntity: movieEntity))),
      child: Container(
        width: 154,
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
              ),
              child: Image.network('https://image.tmdb.org/t/p/w500/${movieEntity.posterPath}',height: 100,),
            ),
            SizedBox(height: 20,),
            Text('${movieEntity.title}')
          ],
        ),
      ),
    );
  }
}
