import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('ExecutionLab'),
          SizedBox(height: 30,),
          CircularProgressIndicator(),
          SizedBox(height: 30,),
          Text('Teq'),
          Text('Copyright 2018')
        ],
      ),
    );
  }
}
