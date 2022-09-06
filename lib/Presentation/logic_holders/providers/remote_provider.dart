
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_project/Presentation/logic_holders/providers/api_provider.dart';
import '../../../Data/data_source/remote_data_source.dart';

//final movieRemoteProvider = Provider((ref) => throw UnimplementedError());

final remoteProvider = Provider((ref){
  final api = ref.watch(apiProvider);
  return RemoteDataSource(apiProvider: api);
});

// final popularMovieRemoteProvider = Provider((ref){
//   final api = ref.watch(apiProvider);
//   return MovieRemoteDataSource(apiProvider: api, apiLink: '/movie/popular');
// });
//
// final upcomingMovieRemoteProvider = Provider((ref){
//   final api = ref.watch(apiProvider);
//   return MovieRemoteDataSource(apiProvider: api, apiLink: '/movie/upcoming');
// });
//
// final nowPlayingMovieRemoteProvider = Provider((ref){
//   final api = ref.watch(apiProvider);
//   return MovieRemoteDataSource(apiProvider: api, apiLink: '/movie/now_playing');
// });
//
// final topRateMovieRemoteProvider = Provider((ref){
//   final api = ref.watch(apiProvider);
//   return MovieRemoteDataSource(apiProvider: api, apiLink: '/movie/top_rated');
// });