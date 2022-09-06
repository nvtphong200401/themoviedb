
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_project/Data/Models/AccountModel.dart';
import 'package:movie_project/Domain/Entities/MovieEntity.dart';
import 'package:movie_project/Presentation/account_screen/user__movie_list.dart';
import 'package:movie_project/Presentation/auth_screen/login_screen.dart';
import 'package:movie_project/Presentation/logic_holders/providers/providers.dart';
import 'package:movie_project/Presentation/reuse_component/botom_nav.dart';
import 'package:movie_project/main.dart';

import '../splash_screen/splash_screen.dart';

class AccountScreen extends ConsumerWidget {
  static const route = '/account';
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = AccountModel.getInstance();
    return Scaffold(
      body: Center(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 200,
                      height: 200,
                      child: ClipOval(
                        child: Image.network(
                            'https://image.tmdb.org/t/p/w500/${account.avatar?.tmdb?.avatarPath}',
                            fit: BoxFit.fitWidth, errorBuilder:
                            (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Image.network(
                              'https://cdn.tgdd.vn/hoi-dap/580732/loi-404-not-found-la-gi-9-cach-khac-phuc-loi-404-not-3-800x534.jpg',
                              fit: BoxFit.fitWidth);
                        }),
                      ),
                    ),
                    Text(
                      account.username!,
                      style: const TextStyle(
                          fontSize: 35, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton.icon(onPressed: ()=>{
                          ref.watch(movieProvider('/account/${account.id}/watchlist/movies')).whenData((value) => Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserMovieList(list: value.items, listName: "Watchlist",))))
                        }, icon: const Icon(Icons.movie, color: Colors.purpleAccent), label: const Text('View watchlist', style: TextStyle(color: Colors.purpleAccent),)),
                        TextButton.icon(onPressed: ()=>{
                          ref.watch(movieProvider('/account/${account.id}/favorite/movies')).whenData((value) => Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserMovieList(list: value.items, listName: "Favorite",))))
                        }, icon: const Icon(Icons.favorite, color: Colors.red), label: const Text('View favorites', style: TextStyle(color: Colors.red),)),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    ElevatedButton(onPressed: (){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MyApp()), (route) => false);
                    }, child: const Text('Log out'))
                  ],
                ),
              ),
            ),
          )
    );
  }
}
