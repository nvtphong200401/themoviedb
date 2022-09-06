
import 'package:flutter/material.dart';
import '../../Domain/Entities/Entity.dart';

class UserMovieList extends StatelessWidget {
  final List list;
  final String listName;
  const UserMovieList({Key? key, required this.list, required this.listName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(listName),),
      body: Container(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(list[index].title),
              subtitle: Text(list[index].releaseDate),
              leading: Image.network(
                'https://image.tmdb.org/t/p/w500${list[index].posterPath}'
              ),
            );
          },
        )
      ),
    );
  }
}
