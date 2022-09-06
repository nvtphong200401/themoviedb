import 'package:movie_project/Data/Models/InterfaceModel.dart';
import 'package:movie_project/Data/Models/ListModel.dart';
import 'package:movie_project/Domain/Entities/CastEntity.dart';

import '../Entities/Entity.dart';
import '../Entities/ListEntity.dart';


abstract class RepositoryInterface {
  Future<ListEntity> getCasts(String apiLink);
  Future<Entity> getCareer(CastEntity castEntity);
  Future<ListEntity> getDataList(ListModel listModel, String apiLink);
  Future<Entity> getData(Model model, String apiLink);
  Future<Model> postData(Model model, String apiLink, dynamic body);
}