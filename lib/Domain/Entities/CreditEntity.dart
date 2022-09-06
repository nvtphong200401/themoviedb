
import 'package:movie_project/Domain/Entities/CastEntity.dart';
import 'package:movie_project/Domain/Entities/ListEntity.dart';

class CreditEntity extends ListEntity {
  CreditEntity({
    this.id,
    this.cast,
    this.crew,
  });

  int? id;
  List<CastEntity>? cast;
  List<CastEntity>? crew;
}