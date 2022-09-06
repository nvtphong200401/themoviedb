

import 'package:movie_project/Domain/Entities/Entity.dart';

class RequestTokenEntity extends Entity {
  bool? success;
  String? expiresAt;
  String? requestToken;
  RequestTokenEntity({
    this.success,
    this.expiresAt,
    this.requestToken,
  });
}