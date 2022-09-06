import 'package:movie_project/Core/service.dart';
import 'package:movie_project/Domain/Respositoties/repo_interface.dart';

class MovieService extends Service
{
  final RepositoryInterface repositoryInterface;
  MovieService(this.repositoryInterface);

  @override
  Future callCasts(params) async {
    return await repositoryInterface.getCasts(params);
  }

  @override
  Future callCareer(params) async {
    // TODO: implement callCareer
    return await repositoryInterface.getCareer(params);
  }

  @override
  Future callDataList(typeList, params) async {
    return await repositoryInterface.getDataList(typeList, params);
  }

  @override
  Future callData(type, params) async {
    return await repositoryInterface.getData(type, params);
  }

  @override
  Future postData(type, params, body) async {
    final model =  await repositoryInterface.postData(type, params, body);
    return model;
  }

}