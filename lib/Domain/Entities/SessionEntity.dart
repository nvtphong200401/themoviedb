
import 'package:movie_project/Domain/Entities/Entity.dart';

class SessionEntity extends Entity {
  bool? success;
  String? sessionId;
  SessionEntity({
    this.success,
    this.sessionId,
  });
}