
import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  final String url;
  const ImageScreen({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Hero(
              tag: url,
              child: Image.network(
                url,
                fit: BoxFit.fitHeight
              ),
            ),
            Positioned(
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {},
                    tooltip: 'Share',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
