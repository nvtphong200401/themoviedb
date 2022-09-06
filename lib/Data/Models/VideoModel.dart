
import 'package:movie_project/Data/Models/InterfaceModel.dart';
import 'package:movie_project/Domain/Entities/VideoEntity.dart';

class VideoModel extends VideoEntity implements Model {
  VideoModel.fromJson(dynamic json){
    iso6391= json["iso_639_1"];
    iso31661= json["iso_3166_1"];
    name= json["name"];
    key= json["key"];
    publishedAt= json["published_at"].toString();
    site= json["site"];
    size= json["size"];
    type= json["type"];
    official= json["official"];
    id= json["id"];
  }
  Map<String, dynamic> toJson() => {
    "iso_639_1": iso6391,
    "iso_3166_1": iso31661,
    "name": name,
    "key": key,
    "published_at": publishedAt,
    "site": site,
    "size": size,
    "type": type,
    "official": official,
    "id": id,
  };

  @override
  Model fromJson(json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
}