
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_project/Data/Models/AccountModel.dart';
import 'package:movie_project/Data/Models/SessionModel.dart';
import 'package:movie_project/Presentation/logic_holders/providers/service_provider.dart';

import '../../../Data/Models/RequestTokenModel.dart';

final requestTokenProvider = FutureProvider((ref) {
  final service = ref.watch(serviceProvider);
  return service.callData(RequestTokenModel.getInstance(), '/authentication/token/new');
});

final accountProvider = FutureProvider.family((ref, body) async {
  final service =  ref.watch(serviceProvider);
  final tokenWithLogin = await service.postData(RequestTokenModel.getInstance(), '/authentication/token/validate_with_login', body);
  final data = await service.postData(SessionModel.getInstance(), '/authentication/session/new', tokenWithLogin.toJson());
  final account = await service.callData(AccountModel.getInstance(), '/account');
  return account;
});

