import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_project/Domain/Entities/CastEntity.dart';
import 'package:movie_project/Presentation/detail_screen/career_card.dart';
import 'package:movie_project/Presentation/logic_holders/providers/providers.dart';

import '../reuse_component/botom_nav.dart';
import '../splash_screen/splash_screen.dart';

class ActorDetail extends ConsumerWidget {
  final CastEntity castEntity;
  const ActorDetail({Key? key, required this.castEntity}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(castEntity.name!),
      ),
      bottomNavigationBar: CustomBottomNavigation(),
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
                        'https://image.tmdb.org/t/p/w500/${castEntity.profilePath}',
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
                  castEntity.name!,
                  style: const TextStyle(
                      fontSize: 35, fontWeight: FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildIcon(Icons.favorite, castEntity.popularity,
                        color: Colors.red),
                    buildIcon(Icons.person, castEntity.character)
                  ],
                ),
                CareerCard(
                  castEntity: castEntity,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildIcon(IconData icon, dynamic text, {Color color = Colors.black}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Icon(
            icon,
            size: 40,
            color: color,
          ),
          Container(width: 150, child: Center(child: Text(text.toString())))
        ],
      ),
    );
  }
}
