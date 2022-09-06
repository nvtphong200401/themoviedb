
import 'package:movie_project/Domain/Entities/RequestTokenEntity.dart';

import 'InterfaceModel.dart';

class RequestTokenModel extends RequestTokenEntity implements Model {
  RequestTokenModel.getInstance();
  RequestTokenModel.fromJson(Map<String, dynamic> json){
    success = json["success"];
    expiresAt = json["expires_at"];
    requestToken = json["request_token"];
  }

  @override
  Model fromJson(json) {
    return RequestTokenModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => {
    "success": success.toString(),
    "expires_at": expiresAt,
    "request_token": requestToken,
  };
  
}