
import 'package:movie_project/Data/Models/CastModel.dart';
import 'package:movie_project/Data/Models/ListModel.dart';

import '../../Domain/Entities/CreditEntity.dart';

class CreditModel extends CreditEntity {
  CreditModel.fromJson(Map<String, dynamic> json){
    id = json["id"];
    cast = List<CastModel>.from(json["cast"].map((x) => CastModel.fromJson(x)));
    crew = List<CastModel>.from(json["crew"].map((x) => CastModel.fromJson(x)));
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "cast": List<dynamic>.from(cast!.map((x) => (x as CastModel).toJson())),
    "crew": List<dynamic>.from(crew!.map((x) => (x as CastModel).toJson())),
  };
}