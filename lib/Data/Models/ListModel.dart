
import 'package:movie_project/Domain/Entities/ListEntity.dart';

import 'InterfaceModel.dart';

abstract class ListModel extends ListEntity {
  // for interface
  ListModel fromJson(dynamic json);
  Map<String, dynamic> toJson();
}