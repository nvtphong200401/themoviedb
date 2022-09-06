
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:movie_project/Presentation/logic_holders/providers/auth_provider.dart';

import '../home_screen/home_screen.dart';
final messageProvider = StateProvider((ref) => '');

class LoginScreen extends ConsumerWidget {
  static const route = '/login';

  LoginScreen({Key? key}) : super(key: key);
  final nameController = TextEditingController();
  final passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    var _message = ref.watch(messageProvider.state).state;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: const Text(
            'ExecutionLab',
            style: TextStyle(
              fontWeight:FontWeight.bold,
              fontSize: 36,
              color: Color(0xFFFFCCFF)
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          child: TextFormField(
            controller: nameController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              hintText: 'Username', icon: Icon(Icons.verified_user)
            ),
            validator: (text) => text!.isEmpty ? ref.read(messageProvider.state).state = 'Username is required !' : '',
          ),
          padding: EdgeInsets.symmetric(horizontal: 30),
        ),
        Container(
          child: TextFormField(
            controller: passController,
            keyboardType: TextInputType.text,
            obscureText: true,
            autocorrect: false,
            enableSuggestions: false,
            decoration: const InputDecoration(
                hintText: 'Password', icon: Icon(Icons.lock)
            ),
            validator: (text) => text!.isEmpty ? ref.read(messageProvider.state).state = 'Password is required !' : '',
          ),
          padding: EdgeInsets.symmetric(horizontal: 30),
        ),
        Text(_message, style: const TextStyle(
          color: Colors.red,
          fontStyle: FontStyle.italic
        ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0))),
                padding: MaterialStateProperty.all(const EdgeInsets.all(0))
            ),
            child: Container(
              alignment: Alignment.center,
              height: 50.0,
              width: size.width * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80.0),
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 255, 136, 34),
                  Color.fromARGB(255, 255, 177, 41)
                ])
              ),
              padding: const EdgeInsets.all(0),
              child: const Text('Login', textAlign: TextAlign.center, style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
            ),
            onPressed: () async {
              //var token = '';
              final data = await ref.read(requestTokenProvider.future);
              tokenWithUsernameAndPassword(data, ref,context, nameController.text, passController.text);
            }
          ),
        ),
        SizedBox(height: 20,),
        Text('Or', style: TextStyle(
          color: Color(0xFF808080),
          fontWeight: FontWeight.bold
        ),),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
                child: SignInButton(Buttons.Google, text: 'Google', onPressed: () =>{})
            ),
            SizedBox(width: 10,),
            Container(
              width: 150,
                child: SignInButton(Buttons.Facebook, text: 'Facebook', onPressed: () =>{})),
          ],
        )
      ],
    );
  }
  void tokenWithUsernameAndPassword(data, WidgetRef ref, context, String username, String password) async {
    final result = await ref.read(accountProvider({
      "username": username,
      "password" : password,
      "request_token": data.requestToken
    }).future).catchError((onError) {
      return null;
    });
    if(result != null){
      Navigator.pushNamedAndRemoveUntil(context, HomeScreen.route, (route) => false,);
    }
    else {
      ref.read(messageProvider.state).state = 'Incorrect username/password';
    }
  }
}
