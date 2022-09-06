
import 'package:movie_project/Domain/Entities/Entity.dart';

class ReviewerDetailEntity extends Entity {
  String? name;
  String? username;
  String? avatarPath;
  double? rating;

  ReviewerDetailEntity({
    this.name,
    this.username,
    this.avatarPath,
    this.rating,
  });

}

class ReviewEntity extends Entity {
  String? author;
  ReviewerDetailEntity? reviewerDetail;
  String? content;
  String? createdAt;
  String? id;
  String? updatedAt;
  String? url;
  ReviewEntity({
    this.author,
    this.reviewerDetail,
    this.content,
    this.createdAt,
    this.id,
    this.updatedAt,
    this.url,
  });
}