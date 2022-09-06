
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_project/Domain/Entities/MovieEntity.dart';

import '../../../Core/constant.dart';
import 'providers.dart';

final allMovieProvider = FutureProvider((ref){
  List app = [];
  apiLink.forEach((key, value) {
    ref.watch(movieProvider(value)).whenData((value) => app += value.items!);
  });
  return app;
});

final bottomNavProvider = StateProvider((ref) => 0);
