
import 'package:flutter/material.dart';
import 'package:movie_project/Domain/Entities/CastEntity.dart';
import 'package:movie_project/Presentation/detail_screen/actor_detail_screen.dart';

class ActorCard extends StatelessWidget {
  final CastEntity castEntity;
  const ActorCard({Key? key, required this.castEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ActorDetail(castEntity: castEntity))),
      child: Container(
        width: 154,
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500/${castEntity.profilePath}',
                height: 100,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Image.network(
                      'https://cdn.tgdd.vn/hoi-dap/580732/loi-404-not-found-la-gi-9-cach-khac-phuc-loi-404-not-3-800x534.jpg',
                      height: 100,
                      width: 100,

                    );
                  }
              ),
            ),
            SizedBox(height: 20,),
            Text('${castEntity.name}')
          ],
        ),
      ),
    );
  }
}
