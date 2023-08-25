


import 'dart:async';

import 'package:ap_calling/views/Home.dart';
import 'package:ap_calling/views/introscreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

 SharedPreferences preferences = await SharedPreferences.getInstance();
 bool isvisited = preferences.getBool("isIntroVisited") ?? false;
 runApp( MaterialApp(
   initialRoute: (isvisited)? 'splash' : '/' ,
    routes: {
      '/': (context) => intro_page(),
      'splash':(context)=> Splash(),
      'home': (context) => home(),
    },
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true),
  ));
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 5),
      () {
        Navigator.pushReplacementNamed(context, 'home');
      },
    );
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1,
              width: double.infinity,
              child: Image.network(
                'https://cdn.pixabay.com/animation/2023/03/26/01/15/01-15-42-612_512.gif',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
