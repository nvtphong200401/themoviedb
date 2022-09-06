
import 'package:movie_project/Data/Models/InterfaceModel.dart';
import 'package:movie_project/Domain/Entities/MovieEntity.dart';

class MovieModel extends MovieEntity implements Model {
  MovieModel.fromJson(dynamic json){
    try{
      adult = json["adult"] ?? false;
      backdropPath = json["backdrop_path"] ?? '';
      genreIds = List<int>.from(json["genre_ids"].map((x) => x));
      id = json["id"] ?? '';
      originalLanguage = json["original_language"] ?? '';
      originalTitle = json["original_title"] ?? '';
      overview = json["overview"] ?? '';
      posterPath = json["poster_path"] ?? '';
      releaseDate = json["release_date"].toString();
      title = json["title"] ?? '';
      video = json["video"] ?? false;
      voteAverage = json["vote_average"].toDouble() ?? 0;
      voteCount = json["vote_count"] ?? 0;
      popularity = json["popularity"].toDouble() ?? 0;
    }
    catch(err){
    }
  }
  Map<String, dynamic> toJson() => {
    "adult": adult,
    "backdrop_path": backdropPath,
    "genre_ids": List<dynamic>.from(genreIds!.map((x) => x)),
    "id": id,
    "original_language": originalLanguage,
    "original_title": originalTitle,
    "overview": overview,
    "poster_path": posterPath,
    "release_date": releaseDate,
    "title": title,
    "video": video,
    "vote_average": voteAverage,
    "vote_count": voteCount,
    "popularity": popularity
  };

  @override
  Model fromJson(json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
}