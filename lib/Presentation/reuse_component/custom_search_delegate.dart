
import 'package:flutter/material.dart';
import 'package:movie_project/Domain/Entities/MovieEntity.dart';

class CustomSearchDelegate extends SearchDelegate{
  late final items;
  CustomSearchDelegate({required this.items});
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(onPressed: (){query = '';}, icon: const Icon(Icons.clear))
    ];
  }
  @override
  Widget? buildLeading(BuildContext context) {
    print(items.length);
    // TODO: implement buildLeading
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    List<MovieEntity> matchQuery = [];
    for(MovieEntity p in items){
      if(p.title!.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(p);
      }
    }
    return Scrollbar(
      child: ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            leading: Image.network("https://image.tmdb.org/t/p/w500${matchQuery[index].posterPath}"),
            title: Text(matchQuery[index].title!),
            subtitle: Text(matchQuery[index].originalLanguage!),
            onTap: (){
              Navigator.pop(context, matchQuery[index]);
              //_navigateEdit(context, matchQuery[index]);
            },
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<MovieEntity> matchQuery = [];
    for(var p in items){
      if(p.title!.toLowerCase().toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(p);
      }
    }
    return Scrollbar(
      child: ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            leading: Image.network("https://image.tmdb.org/t/p/w500${matchQuery[index].posterPath}"),
            title: Text(matchQuery[index].title!),
            subtitle: Text(matchQuery[index].originalLanguage!),
            onTap: (){
              Navigator.pop(context, matchQuery[index]);
              //_navigateEdit(context, matchQuery[index]);
            },
          );
        },
      ),
    );
  }

}