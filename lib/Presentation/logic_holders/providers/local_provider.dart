
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_project/Presentation/logic_holders/providers/storage_provider.dart';
import '../../../Data/data_source/local_data_source.dart';

final localProvider = Provider((ref){
  final storage = ref.watch(storageProvider);
  return LocalDataSource(localStorage: storage);
});

// final popularMovieLocalProvider = Provider((ref){
//   final storage = ref.watch(storageProvider);
//   return MovieLocalDataSource(localStorage: storage);
// });
//
// final upcomingMovieLocalProvider = Provider((ref){
//   final storage = ref.watch(storageProvider);
//   return MovieLocalDataSource(localStorage: storage, type_list: 'upcoming_movies');
// });
//
// final topRateMovieLocalProvider = Provider((ref){
//   final storage = ref.watch(storageProvider);
//   return MovieLocalDataSource(localStorage: storage, type_list: 'topRate_movies');
// });