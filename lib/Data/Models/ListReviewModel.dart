

import 'package:movie_project/Data/Models/ReviewerModel.dart';

import 'InterfaceModel.dart';
import 'ListModel.dart';

class ListReviewModel extends ListModel {
  ListReviewModel.getInstance(){
    items = <Model>[];
  }
  ListReviewModel(ListReviewModel reviews){
    items = reviews.items;
  }
  @override
  ListModel fromJson(dynamic json){
    items = <Model>[];
    final List listJson = json['items'] ?? json['results'];
    for(dynamic object in listJson){
      items?.add(ReviewModel.fromJson(object));
    }
    return ListReviewModel(this);
  }
  @override
  Map<String, dynamic> toJson() => {
    'results' : items?.map((e) => (e as ReviewModel).toJson()).toList()
  };
}