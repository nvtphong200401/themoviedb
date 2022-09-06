
import 'package:movie_project/Data/Models/InterfaceModel.dart';
import 'package:movie_project/Domain/Entities/ReviewerEntity.dart';

class ReviewerDetailModel extends ReviewerDetailEntity{
  ReviewerDetailModel.fromJson(Map<String, dynamic> json){
    name= json["name"];
    username= json["username"];
    avatarPath= json["avatar_path"] == null ? null : json["avatar_path"];
    rating= json["rating"] == null ? null : json["rating"];
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "username": username,
    "avatar_path": avatarPath,
    "rating": rating,
  };
}