
import 'package:movie_project/Domain/Entities/Entity.dart';

abstract class Model extends Entity {
  // for interface purpose
  Model fromJson(dynamic json);
  Map<String, dynamic> toJson();
}