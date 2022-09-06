import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Core/constant.dart';
import '../../Domain/Entities/MovieEntity.dart';
import '../logic_holders/providers/providers.dart';
import '../splash_screen/splash_screen.dart';
import 'movie_card_component.dart';

final typeProvider = StateProvider((ref) => 0);

class MovieList extends ConsumerWidget {
  MovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var curr = ref.watch(typeProvider.state).state;
    return Column(
      children: [
        AppBar(
          elevation: 0,
          title: Center(child: Text('${type_list[curr]} Movies')),
        ),
        Expanded(
            child: ref.watch(movieProvider(apiLink[type_list[curr]])).when(
                data: (data) => Dismissible(
                  key: ValueKey(type_list[curr]),
                  onDismissed: (DismissDirection direction) {
                    if (direction == DismissDirection.endToStart) {
                      if (curr == type_list.length - 1) {
                        ref.read(typeProvider.notifier).state = 0;
                      } else {
                        ref.read(typeProvider.notifier).state++;
                      }
                    }
                    if (direction == DismissDirection.startToEnd) {
                      if (curr == 0) {
                        ref.read(typeProvider.notifier).state =
                            type_list.length - 1;
                      } else {
                        ref.read(typeProvider.notifier).state--;
                      }
                    }
                  },
                  child: Container(
                    child: GridView.builder(
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: data.items?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return MovieCard(
                              movieEntity: (data.items![index] as MovieEntity));
                        }),
                  ),
                ),
                error: (error, trace) {
                  return Center(child: Text(error.toString()));
                },
                loading: () => const SplashScreen()),
        ),
      ],
    );
  }
}
