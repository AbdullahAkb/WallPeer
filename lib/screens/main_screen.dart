import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wallpeer/screens/all_wallpapers_screen.dart';
import 'package:wallpeer/screens/category_screen.dart';
import 'package:wallpeer/screens/trending_screen.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  String greetingFun() {
    int hour = TimeOfDay.now().hour;
    if (hour <= 12) {
      return "Good Morning";
    } else if (hour <= 17) {
      return "Good Afternoon";
    }
    return "Good Evening";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    greetingFun();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
    isSearching = false;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Color(0xFF237A57), // status bar color
    ));
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[Color(0xFF237A57), Color(0xFF093028)]),
              ),
            ),
            // backgroundColor: Color.fromARGB(255, 255, 204, 188),
            // centerTitle: true,
            title: isSearching
                ? Container(
                    height: height * 0.06,
                    child: TextFormField(
                      controller: searchController,
                      textInputAction: TextInputAction.search,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Josefin Sans",
                          fontSize: 20),
                      autofocus: true,
                      onFieldSubmitted: (value) {
                        Get.to(
                            AllWallpapersScreen(title: searchController.text),
                            transition: Transition.cupertino);
                        // setState(() {
                        //   isSearching = !isSearching;
                        // });
                      },
                      cursorColor: Color.fromARGB(255, 255, 255, 255),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            bottom: height * 0.01, left: width * 0.04),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255),
                              style: BorderStyle.solid,
                              width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255),
                              style: BorderStyle.solid,
                              width: 1),
                        ),
                      ),
                    ),
                  )
                : GradientText(
                    greetingFun(),
                    style: TextStyle(fontFamily: "Rolest", fontSize: 40),
                    colors: [
                      Color.fromARGB(255, 255, 255, 255),
                      Color.fromARGB(255, 255, 255, 255),
                      // Color.fromARGB(255, 235, 230, 229),
                      Color.fromARGB(255, 255, 255, 255),
                    ],
                  ),
            bottom: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Color(0xFFFF9800),
                splashBorderRadius: BorderRadius.circular(40),
                splashFactory: NoSplash.splashFactory,
                tabs: [
                  Tab(
                    child: Text(
                      "Trending",
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontFamily: "Branch"),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Categories",
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontFamily: "Branch"),
                    ),
                  ),
                ]),

            actions: [
              isSearching
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isSearching = !isSearching;
                          searchController.clear();
                        });
                      },
                      icon: Icon(
                        CupertinoIcons.clear,
                        color: Color(0xFFFF9800),
                      ))
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          isSearching = !isSearching;
                        });
                      },
                      icon: Icon(
                        CupertinoIcons.search,
                        color: Colors.orange,
                      )),
            ],
          ),
          body: TabBarView(children: [TrendingScreen(), CategoriesScreens()]),
        ),
      ),
    );
  }
}
