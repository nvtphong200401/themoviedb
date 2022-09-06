
import 'package:movie_project/Domain/Entities/CastEntity.dart';
import 'package:movie_project/Domain/Entities/MovieEntity.dart';

import 'MovieModel.dart';
final departmentValues = EnumValues({
  "Acting": Department.ACTING,
  "Art": Department.ART,
  "Camera": Department.CAMERA,
  "Costume & Make-Up": Department.COSTUME_MAKE_UP,
  "Crew": Department.CREW,
  "Directing": Department.DIRECTING,
  "Editing": Department.EDITING,
  "Lighting": Department.LIGHTING,
  "Production": Department.PRODUCTION,
  "Sound": Department.SOUND,
  "Visual Effects": Department.VISUAL_EFFECTS,
  "Writing": Department.WRITING
});
class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

class CastModel extends CastEntity {
  CastModel.fromJson(Map<String, dynamic> json){
      adult = json["adult"] ?? adult;
      gender = json["gender"] ?? gender;
      id = json["id"] ?? id;
      knownForDepartment = departmentValues.map[json["known_for_department"]] ?? knownForDepartment;
      name = json["name"] ?? name;
      originalName = json["original_name"] ?? originalName;
      popularity = json["popularity"].toDouble() ?? popularity;
      profilePath = json["profile_path"] ?? profilePath;
      castId = json["cast_id"] ?? castId;
      character = json["character"] ?? character;
      creditId = json["credit_id"] ?? creditId;
      order = json["order"] ?? order;
      department = json["department"] != null ? departmentValues.map[json["department"]] : department;
      job = json["job"] ?? job;
      //knowFor = json['person']['known_for'] != null ? List<MovieEntity>.from(json['person']['known_for'].map((x) => MovieModel.fromJson(x))) : knowFor;
  }

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "gender": gender,
    "id": id,
    "known_for_department": departmentValues.reverse[knownForDepartment],
    "name": name,
    "original_name": originalName,
    "popularity": popularity,
    "profile_path": profilePath,
    "cast_id": castId,
    "character": character,
    "credit_id": creditId,
    "order": order,
    "department": department == null ? null : departmentValues.reverse[department],
    "job": job,
  };

  void addCareer(dynamic json) {
    knowFor = json['person']['known_for'] != null ? List<MovieEntity>.from(json['person']['known_for'].map((x) => MovieModel.fromJson(x))) : knowFor;
  }
}