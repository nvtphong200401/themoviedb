
import 'package:movie_project/Domain/Entities/Entity.dart';

class AccountEntity extends Entity {
  Avatar? avatar;
  int? id;
  String? iso6391;
  String? iso31661;
  String? name;
  bool? includeAdult;
  String? username;

  AccountEntity({
    this.avatar,
    this.id,
    this.iso6391,
    this.iso31661,
    this.name,
    this.includeAdult,
    this.username,
  });
}

class Avatar {
  Avatar({
    this.gravatar,
    this.tmdb,
  });

  Gravatar? gravatar;
  Tmdb? tmdb;

  Avatar copyWith({
    Gravatar? gravatar,
    Tmdb? tmdb,
  }) =>
      Avatar(
        gravatar: gravatar ?? this.gravatar,
        tmdb: tmdb ?? this.tmdb,
      );

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
    gravatar: Gravatar.fromJson(json["gravatar"]),
    tmdb: Tmdb.fromJson(json["tmdb"]),
  );

  Map<String, dynamic> toJson() => {
    "gravatar": gravatar?.toJson(),
    "tmdb": tmdb?.toJson(),
  };
}

class Gravatar {
  Gravatar({
    this.hash,
  });

  String? hash;

  Gravatar copyWith({
    String? hash,
  }) =>
      Gravatar(
        hash: hash ?? this.hash,
      );

  factory Gravatar.fromJson(Map<String, dynamic> json) => Gravatar(
    hash: json["hash"],
  );

  Map<String, dynamic> toJson() => {
    "hash": hash,
  };
}

class Tmdb {
  Tmdb({
    this.avatarPath,
  });

  dynamic avatarPath;

  Tmdb copyWith({
    dynamic avatarPath,
  }) =>
      Tmdb(
        avatarPath: avatarPath ?? this.avatarPath,
      );

  factory Tmdb.fromJson(Map<String, dynamic> json) => Tmdb(
    avatarPath: json["avatar_path"],
  );

  Map<String, dynamic> toJson() => {
    "avatar_path": avatarPath,
  };
}
