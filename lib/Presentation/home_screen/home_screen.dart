import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_project/Core/constant.dart';
import 'package:movie_project/Domain/Entities/MovieEntity.dart';
import 'package:movie_project/Presentation/account_screen/account_screen.dart';
import 'package:movie_project/Presentation/detail_screen/detail_screen.dart';
import 'package:movie_project/Presentation/home_screen/MovieSearch.dart';
import 'package:movie_project/Presentation/logic_holders/providers/utils_provider.dart';
import 'package:movie_project/Presentation/reuse_component/botom_nav.dart';
import 'package:movie_project/Presentation/reuse_component/custom_search_delegate.dart';

import 'movie_list.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const route = '/home';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          bottomNavigationBar: CustomBottomNavigation(),
          body: TabBarView(
            children: [
              MovieList(),
              MovieList(),
              AccountScreen()
            ],
          )),
    );
  }
}
