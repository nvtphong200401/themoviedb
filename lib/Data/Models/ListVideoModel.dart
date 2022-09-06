
import 'package:movie_project/Data/Models/InterfaceModel.dart';
import 'package:movie_project/Data/Models/ListModel.dart';
import 'package:movie_project/Data/Models/VideoModel.dart';
import 'package:movie_project/Domain/Entities/ListEntity.dart';

class ListVideoModel extends ListModel {
  // ListVideoModel.fromJson(dynamic json){
  //   items = <VideoModel>[];
  //   final List listJson = json['items'] ?? json['results'];
  //   for(dynamic object in listJson){
  //     items?.add(VideoModel.fromJson(object));
  //   }
  // }
  ListVideoModel.getInstance(){
    items = <Model>[];
  }
  ListVideoModel(ListVideoModel reviews){
    items = reviews.items;
  }
  @override
  ListModel fromJson(dynamic json){
    items = <Model>[];
    final List listJson = json['items'] ?? json['results'];
    for(dynamic object in listJson){
      items?.add(VideoModel.fromJson(object));
    }
    return ListVideoModel(this);
  }
  Map<String, dynamic> toJson() => {
    'results' : items?.map((e) => (e as VideoModel).toJson()).toList()
  };
}