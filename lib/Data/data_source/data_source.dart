import 'package:movie_project/Data/Models/CastModel.dart';
import 'package:movie_project/Data/Models/InterfaceModel.dart';
import 'package:movie_project/Data/Models/ListModel.dart';

import '../Models/ListCastModel.dart';

abstract class DataSource {
  Future<CreditModel> getCasts(String apiLink);
  Future<CastModel> getCareer(CastModel castModel);
  Future<ListModel> getDataList(ListModel listModel, String apiLink);
  Future<Model> getData(Model model, String apiLink);
}


