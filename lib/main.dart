import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wallpeer/home_screen/home_screen.dart';
import 'package:wallpeer/screens/trending_screen.dart';
import 'package:wallpeer/screens/main_screen.dart';
import 'package:wallpeer/screens/all_wallpapers_screen.dart';
import 'package:wallpeer/utils/images.dart';
import 'package:wallpeer/widgets/category_box.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Colors.white, // status bar color
    ));
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
          splashTransition: SplashTransition.fadeTransition,
          splashIconSize: 350,
          animationDuration: const Duration(seconds: 2),
          nextScreen: const HomeScreen(),
          splash: Container(
            height: height * 0.04,
            width: width,
            child: Image.asset(
              Images.logo,
              // fit: BoxFit.fill,
            ),
          )),
    );
  }
}
