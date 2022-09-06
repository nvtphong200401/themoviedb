
import 'package:movie_project/Data/Models/InterfaceModel.dart';
import 'package:movie_project/Data/Models/ListCastModel.dart';
import 'package:movie_project/Data/Models/SessionModel.dart';

import '../../Core/api_provider.dart';
import '../../Core/constant.dart';
import '../Models/CastModel.dart';
import '../Models/ListModel.dart';
import 'data_source.dart';

class RemoteDataSource implements DataSource {
  final ApiProvider apiProvider;

  RemoteDataSource({required this.apiProvider});

  @override
  Future<CreditModel> getCasts(String apiLink) async {
    final Map<String, dynamic> jsonResponse =
    await apiProvider.get('$apiLink?api_key=${apiKey}');

    CreditModel data = CreditModel.fromJson(jsonResponse);
    return data;
  }
  @override
  Future<CastModel> getCareer(CastModel cast) async {
    final Map<String, dynamic> jsonResponse = await apiProvider.get(
        '/credit/${cast.creditId}?api_key=${apiKey}');
    cast.addCareer(jsonResponse);
    return cast;
  }

  @override
  Future<ListModel> getDataList(ListModel listModel, String apiLink) async {
    final sessionId = SessionModel.getInstance().sessionId;
    print(sessionId);
    final Map<String, dynamic> jsonResponse =
        await apiProvider.get('$apiLink?api_key=${apiKey}&session_id=$sessionId');
    ListModel data = listModel.fromJson(jsonResponse);
    return data;
  }

  @override
  Future<Model> getData(Model model, String apiLink) async {
    final sessionId = SessionModel.getInstance().sessionId;

    final Map<String, dynamic> jsonResponse =
        await apiProvider.get('$apiLink?api_key=$apiKey&session_id=$sessionId');
    Model data = model.fromJson(jsonResponse);
    return data;
  }
  Future<Model> postData(Model model, String apiLink, dynamic body) async {
    final Map<String, dynamic> jsonResponse =
    await apiProvider.post('$apiLink?api_key=${apiKey}', body);
    Model data = model.fromJson(jsonResponse);
    return data;
  }
}