
import 'package:movie_project/Domain/Entities/SessionEntity.dart';

import 'InterfaceModel.dart';

class SessionModel extends SessionEntity implements Model {
  SessionModel._internal();
  static final SessionModel _singleton = SessionModel._internal();
  factory SessionModel.getInstance() => _singleton;
  SessionModel.fromJson(Map<String, dynamic> json){
    success = json["success"];
    sessionId = json["session_id"];
  }

  @override
  Model fromJson(json) {
    success = json["success"];
    sessionId = json["session_id"];
    return this;
  }

  @override
  Map<String, dynamic> toJson() => {
    "success": success,
    "session_id": sessionId,
  };

}