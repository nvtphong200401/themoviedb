import 'package:movie_project/Domain/Entities/ListEntity.dart';

import 'Entity.dart';
import 'MovieEntity.dart';

class CastEntity implements Entity {
  CastEntity({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
    this.department,
    this.job,
    this.knowFor
  });

  bool? adult;
  int? gender;
  int? id;
  Department? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  int? castId;
  String? character;
  String? creditId;
  int? order;
  Department? department;
  String? job;
  List<MovieEntity>? knowFor;
}
enum Department { ACTING, SOUND, CREW, EDITING, PRODUCTION, ART, WRITING, DIRECTING, CAMERA, COSTUME_MAKE_UP, VISUAL_EFFECTS, LIGHTING }