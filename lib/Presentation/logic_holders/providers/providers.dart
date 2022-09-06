
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_project/Data/Models/AccountModel.dart';
import 'package:movie_project/Data/Models/ListMovieModel.dart';
import 'package:movie_project/Data/Models/ListReviewModel.dart';
import 'package:movie_project/Data/Models/ListVideoModel.dart';
import 'package:movie_project/Presentation/logic_holders/providers/service_provider.dart';


final castProvider = FutureProvider.family((ref, apiLink) {
  final service = ref.watch(serviceProvider);
  return service.callCasts(apiLink);
});

final careerProvider = FutureProvider.family((ref, castEntity) {
  final service = ref.watch(serviceProvider);
  return service.callCareer(castEntity);
});

final movieProvider = FutureProvider.family((ref, apiLink){
  final service = ref.watch(serviceProvider);
  return service.callDataList(ListMovieModel.getInstance(), apiLink);
});

final reviewProvider = FutureProvider.family((ref, apiLink){
  final service = ref.watch(serviceProvider);
  return service.callDataList(ListReviewModel.getInstance(),apiLink);
});

final videoProvider = FutureProvider.family((ref, apiLink){
  final service = ref.watch(serviceProvider);
  return service.callDataList(ListVideoModel.getInstance(), apiLink);
});

final accountProvider = FutureProvider.family((ref, apiLink) {
  final service = ref.watch(serviceProvider);
  return service.callData(AccountModel.getInstance(), apiLink);
});