import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_project/Domain/Entities/MovieEntity.dart';
import 'package:movie_project/Presentation/account_screen/account_screen.dart';
import 'package:movie_project/Presentation/detail_screen/detail_screen.dart';
import 'package:movie_project/Presentation/home_screen/home_screen.dart';
import 'package:movie_project/Presentation/logic_holders/providers/utils_provider.dart';
import 'package:movie_project/Presentation/reuse_component/custom_search_delegate.dart';

class CustomBottomNavigation extends ConsumerWidget {
  const CustomBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedIndex = ref.watch(bottomNavProvider);
    return Container(
      color: Theme.of(context).primaryColor,
      child: TabBar(
        tabs: [
          Tab(
            icon: Icon(Icons.home),
            text: 'Home',
          ),
          SizedBox(
            height: 50,
            child: InkWell(
              onTap: () {
                ref.watch(allMovieProvider).whenData((value) async {
                  MovieEntity movie = await showSearch(
                      context: context,
                      delegate: CustomSearchDelegate(items: value));
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailScreen(movieEntity: movie)));
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search),
                  SizedBox(height: 7,),
                  Text('Search')
                ],
              ),
            ),
          ),

          Tab(
            icon: Icon(Icons.person_sharp),
            text: 'Account',
          )
        ],
      ),
    );
  }

  void navigateNewScreen(int index, BuildContext context, WidgetRef ref) {
    if (index == 1) {
      ref.watch(allMovieProvider).whenData((value) async {
        MovieEntity movie = await showSearch(
            context: context, delegate: CustomSearchDelegate(items: value));
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => DetailScreen(movieEntity: movie)),
            (Route<dynamic> route) => false);
      });
    } else if (index == 0) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(HomeScreen.route, (route) => false);
    } else if (index == 2) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AccountScreen.route, (route) => false);
    }
  }
}
