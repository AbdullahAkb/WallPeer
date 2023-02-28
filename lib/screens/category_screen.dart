import 'dart:ui';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpeer/screens/all_wallpapers_screen.dart';
import 'package:wallpeer/widgets/category_box.dart';

class CategoriesScreens extends StatefulWidget {
  const CategoriesScreens({super.key});

  @override
  State<CategoriesScreens> createState() => _CategoriesScreensState();
}

class _CategoriesScreensState extends State<CategoriesScreens>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Create a new animation controller with a duration of 1 second
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    // Forward the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 238, 238, 238),
        body: SingleChildScrollView(
          child: AnimationLimiter(
            child: Column(
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 1000),
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: 50.0,
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: [
                  SizedBox(height: height * 0.018),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CategoryBox(
                        title: "Flowers",
                        url:
                            'https://images.unsplash.com/photo-1618588507085-c79565432917?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YmVhdXRpZnVsJTIwbmF0dXJlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60',
                        onpressed: () {
                          Get.to(AllWallpapersScreen(title: "Flowers"),
                              transition: Transition.cupertino);
                        },
                      ),
                      CategoryBox(
                        title: "Cars",
                        url:
                            'https://images.wallpaperscraft.com/image/single/bmw_headlights_lights_137326_300x188.jpg',
                        onpressed: () {
                          Get.to(AllWallpapersScreen(title: "Cars"),
                              transition: Transition.cupertino);
                        },
                      )
                    ],
                  ),
                  SizedBox(height: height * 0.018),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CategoryBox(
                        title: "Pastel",
                        url:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBldfzAkDR8GDjIwt5PD2YCXgqQQSc9M1I9w&usqp=CAU',
                        onpressed: () {
                          Get.to(AllWallpapersScreen(title: "Pastel"),
                              transition: Transition.cupertino);
                        },
                      ),
                      CategoryBox(
                        title: "Sports",
                        url:
                            'https://c4.wallpaperflare.com/wallpaper/245/947/817/5bd47243d9c6b-wallpaper-preview.jpg',
                        onpressed: () {
                          Get.to(AllWallpapersScreen(title: "Sports"),
                              transition: Transition.cupertino);
                        },
                      )
                    ],
                  ),
                  SizedBox(height: height * 0.018),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CategoryBox(
                        title: "Lines",
                        url:
                            "https://img.freepik.com/free-vector/background-line-gradient-luxury-style_483537-3335.jpg",
                        onpressed: () {
                          Get.to(AllWallpapersScreen(title: "Lines"),
                              transition: Transition.cupertino);
                        },
                      ),
                      CategoryBox(
                        title: "Photography",
                        url:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTd-2aywBJbkP9H0I2ohyQhhqjTIPiC-pLh5A&usqp=CAU',
                        onpressed: () {
                          Get.to(AllWallpapersScreen(title: "Photography"),
                              transition: Transition.cupertino);
                        },
                      )
                    ],
                  ),
                  SizedBox(height: height * 0.018),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CategoryBox(
                        title: "Minimilistic",
                        url:
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_dTozjYTM6pg-E6B2lpleaj0Klz-oxlLeGQ&usqp=CAU",
                        onpressed: () {
                          Get.to(AllWallpapersScreen(title: "Minimilistic"),
                              transition: Transition.cupertino);
                        },
                      ),
                      CategoryBox(
                        title: "Technology",
                        url:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScdl1UO8ZVqDMOyIqefEALFfQLbCtiw3ggBg&usqp=CAU',
                        onpressed: () {
                          Get.to(AllWallpapersScreen(title: "Technology"),
                              transition: Transition.cupertino);
                        },
                      )
                    ],
                  ),
                  SizedBox(height: height * 0.018),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CategoryBox(
                        title: "Texture",
                        url:
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnFYAC_PCmDkd0UOSF1E02xghUIjx7KyN_Ww&usqp=CAU",
                        onpressed: () {
                          Get.to(AllWallpapersScreen(title: "Texture"),
                              transition: Transition.cupertino);
                        },
                      ),
                      CategoryBox(
                        title: "Logos",
                        url:
                            'https://mobimg.b-cdn.net/v3/fetch/c8/c8912b6b9c5cdd6d401ac7fab9b82d5f.jpeg',
                        onpressed: () {
                          Get.to(AllWallpapersScreen(title: "Logos"),
                              transition: Transition.cupertino);
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
