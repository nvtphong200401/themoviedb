import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movie_project/Presentation/account_screen/account_screen.dart';

import 'package:movie_project/Presentation/home_screen/home_screen.dart';
import 'package:movie_project/Presentation/splash_screen/splash_screen.dart';
import 'package:riverpod/riverpod.dart';
import 'package:movie_project/Presentation/auth_screen/login_screen.dart';

import 'Presentation/logic_holders/providers/utils_provider.dart';

void main() async {
  await GetStorage.init();
  runApp(
    ProviderScope(child: MyApp())
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return MaterialApp(
      routes: {
        HomeScreen.route : (context) => HomeScreen(),
        LoginScreen.route : (context) => LoginScreen(),
        AccountScreen.route : (context) => const AccountScreen()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: LoginScreen()
      )
    );
  }
}