
import 'package:movie_project/Data/Models/InterfaceModel.dart';
import 'package:movie_project/Data/Models/MovieModel.dart';

import 'ListModel.dart';

class ListMovieModel extends ListModel {
  ListMovieModel.getInstance(){
    items = <Model>[];
  }
  ListMovieModel(ListMovieModel reviews){
    items = reviews.items;
  }

  ListMovieModel.fromJson(dynamic json){
    items = <MovieModel>[];
    final List listJson = json['items'] ?? json['results'];
    for(dynamic object in listJson){
      items?.add(MovieModel.fromJson(object));
    }
  }
  Map<String, dynamic> toJson() => {
    'results' : items?.map((e) => (e as MovieModel).toJson()).toList()
  };

  @override
  ListModel fromJson(dynamic json){
    items = <Model>[];
    final List listJson = json['items'] ?? json['results'];
    for(dynamic object in listJson){
      items?.add(MovieModel.fromJson(object));
    }
    return ListMovieModel(this);
  }
}