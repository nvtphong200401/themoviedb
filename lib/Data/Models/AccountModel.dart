
import 'package:movie_project/Data/Models/InterfaceModel.dart';
import 'package:movie_project/Domain/Entities/AccountEntity.dart';

class AccountModel extends AccountEntity implements Model {
  AccountModel._internal();
  static final AccountModel _singleton = AccountModel._internal();
  factory AccountModel.getInstance() => _singleton;
  AccountModel.fromJson(Map<String, dynamic> json){
    avatar = Avatar.fromJson(json["avatar"]);
    id = json["id"];
    iso6391 = json["iso_639_1"];
    iso31661 = json["iso_3166_1"];
    name = json["name"];
    includeAdult = json["include_adult"];
    username = json["username"];
  }
  
  @override
  Model fromJson(json) {
    avatar = Avatar.fromJson(json["avatar"]);
    id = json["id"];
    iso6391 = json["iso_639_1"];
    iso31661 = json["iso_3166_1"];
    name = json["name"];
    includeAdult = json["include_adult"];
    username = json["username"];

    return this;
  }

  @override
  Map<String, dynamic> toJson() => {
    "avatar": avatar?.toJson(),
    "id": id,
    "iso_639_1": iso6391,
    "iso_3166_1": iso31661,
    "name": name,
    "include_adult": includeAdult,
    "username": username,
  };
  
}