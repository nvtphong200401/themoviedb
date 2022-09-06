
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_project/Domain/Services/movie_service.dart';
import 'package:movie_project/Presentation/logic_holders/providers/repo_provider.dart';

final serviceProvider = Provider((ref){
  final movieRepo = ref.watch(repoProvider);
  return MovieService(movieRepo);
});