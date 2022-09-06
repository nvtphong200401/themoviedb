
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_project/Presentation/logic_holders/providers/providers.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../splash_screen/splash_screen.dart';

class TrailerScreen extends ConsumerWidget {
  final movieId;
  const TrailerScreen({Key? key, this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(videoProvider('/movie/$movieId/videos')).when(
        data: (data) {

          return DefaultTabController(
              length: data.items.length,
              child: Scaffold(
                appBar: AppBar(
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(30.0),
                    child: TabBar(
                      isScrollable: true,
                      unselectedLabelColor: Colors.white.withOpacity(0.3),
                      indicatorColor: Colors.white,
                      tabs: [
                        ...genListTab(data)
                      ],
                    ),
                  ),
                ),
                body: TabBarView(
                  children: [
                    ...genListYoutube(data)
                  ],
                ),
              )
          );
        },
        error: (error, trace) {
          print(error);
          return Center(child: Text(error.toString()));
        },
        loading: () => SplashScreen(),);
  }

  List<Tab> genListTab(data){
    final tabs = <Tab>[];
    for(var item in data.items){
      tabs.add(Tab(icon: Text(item.name),));
    }
    return tabs;
  }
  List<Widget> genListYoutube(data){

    final widgets = <Widget>[];
    for(var item in data.items){
      YoutubePlayerController _controller = YoutubePlayerController(
        initialVideoId: item.key,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          forceHD: false,
        )
      );

      widgets.add(
        YoutubePlayer(controller: _controller, )
      );
    }
    return widgets;
  }
}
