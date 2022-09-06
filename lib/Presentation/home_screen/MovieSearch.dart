
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_project/Presentation/detail_screen/detail_screen.dart';
import 'package:movie_project/Presentation/splash_screen/splash_screen.dart';

import '../../Domain/Entities/MovieEntity.dart';
import '../logic_holders/providers/utils_provider.dart';
import '../reuse_component/custom_search_delegate.dart';

class MovieSearch extends ConsumerWidget {
  const MovieSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(allMovieProvider).when(
        data: (data){
          return FutureBuilder(
            future: showSearch(context: context, delegate: CustomSearchDelegate(items: data)
            ),
              builder: (context, snapshot){
              if(snapshot.hasData){
                if(snapshot.data == null) Navigator.pop(context);
                return DetailScreen(movieEntity: snapshot.data as MovieEntity);
              }
              return SplashScreen();
              }
          );
        },
        error: (error, trace) => Center(child: Text(error.toString()),) ,
        loading: () => SplashScreen()
    );
  }
}
