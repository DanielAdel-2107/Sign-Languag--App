import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:test/dash_board/screens/dash_board_screen.dart';
import 'package:test/utils.dart' as utils;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sanket',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: utils.color),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimatedSplashScreen(
        splash: 'assets/logo/logo_icon.png',
        splashIconSize: 700,
        duration: 1000,
        nextScreen: DashBoardScreen(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: utils.color,
        pageTransitionType: PageTransitionType.fade,
      ),
    );
  }
}
