
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movie_project/Core/connection_info.dart';

final connectionProvider = Provider((ref) => ConnectionInfoImpl(InternetConnectionChecker()));