
import 'package:movie_project/Data/Models/InterfaceModel.dart';
import 'package:movie_project/Data/Models/ReviewerDetailModel.dart';
import 'package:movie_project/Domain/Entities/ReviewerEntity.dart';

class ReviewModel extends ReviewEntity implements Model {
  ReviewModel.fromJson(Map<String, dynamic> json) {
    author = json["author"];
    reviewerDetail = ReviewerDetailModel.fromJson(json["author_details"]);
    content = json["content"];
    createdAt = json["created_at"].toString();
    id = json["id"];
    updatedAt = json["updated_at"].toString();
    url = json["url"];
    }

  Map<String, dynamic> toJson() => {
    "author": author,
    "author_details": (reviewerDetail as ReviewerDetailModel).toJson(),
    "content": content,
    "created_at": createdAt,
    "id": id,
    "updated_at": updatedAt,
    "url": url,
  };

  @override
  Model fromJson(json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
}