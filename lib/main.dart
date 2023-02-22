import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wallpeer/screens/trending_screen.dart';
import 'package:wallpeer/screens/main_screen.dart';
import 'package:wallpeer/screens/all_wallpapers_screen.dart';
import 'package:wallpeer/widgets/category_box.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarIconBrightness: Brightness.light,
    //   statusBarColor: Color(0xFF237A57), // status bar color
    // ));
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}
