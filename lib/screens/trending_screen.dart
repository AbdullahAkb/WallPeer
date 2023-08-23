import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wallpeer/models/photo_model.dart';
import 'package:wallpeer/screens/preview_screen.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({Key? key}) : super(key: key);

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen>
    with TickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  late AnimationController _controller;
  String apiKey = "zMK7BWyZmjj8O3fNg2AtgCIxZAPQRtM0sR4RtIxH6zZJzSetWjvO1LCu";
  List<PhotoModel> photoList = [];
  String nextpage = "";
  int page = 1;

  Stream<List<PhotoModel>> getWallpapers() async* {
    scrollController.addListener(() {
      getMoreData();
    });
    Uri apiUrl = Uri.parse(
        "https://api.pexels.com/v1/search?query=trending&per_page=95&page=$page");
    http.Response response =
        await http.get(apiUrl, headers: {"Authorization": apiKey});

    var data = jsonDecode(response.body);
    // print(data["photos"][0]);

    List<dynamic> listOfPhotos = data["photos"];

    nextpage = data["next_page"];

    photoList =
        listOfPhotos.map((photo) => PhotoModel.fromJson(photo)).toList();
    yield photoList;
  }

  Future<List<PhotoModel>> getMoreData() async {
    Uri apiUrl = Uri.parse(
        "https://api.pexels.com/v1/search?query=anime&per_page=15&page=1");
    http.Response response =
        await http.get(apiUrl, headers: {"Authorization": apiKey});

    var data1 = jsonDecode(response.body);
    String nextPage = data1["next_page"];
    print(nextPage);
    Uri nextPageUrl = Uri.parse(nextPage);
    http.Response response2 =
        await http.get(nextPageUrl, headers: {"Authorization": apiKey});
    var data2 = jsonDecode(response2.body);
    List<dynamic> listOfPhotos = data2["photos"];

    photoList =
        listOfPhotos.map((photo) => PhotoModel.fromJson(photo)).toList();
    return photoList;
  }

  @override
  void initState() {
    // TODO: implement initState
    // Create a new animation controller with a duration of 1 second
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    // Forward the animation
    _controller.forward();
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        getMoreData();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 238, 238, 238),
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  StreamBuilder(
                    stream: getWallpapers(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: height * 0.36,
                            ),
                            Center(
                                child: CupertinoActivityIndicator(
                              animating: true,
                              color: Color(0xFF237A57),
                            )),
                          ],
                        );
                      } else if (snapshot.hasData) {
                        return AnimationLimiter(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 100,
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    // mainAxisSpacing: 10,
                                    mainAxisExtent: 320),
                            controller: scrollController,
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return AnimationConfiguration.staggeredGrid(
                                position: index,
                                duration: const Duration(milliseconds: 500),
                                columnCount: 2,
                                child: SlideAnimation(
                                  child: FadeInAnimation(
                                    child: Container(
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Get.to(PreviewScreen(
                                                  details:
                                                      snapshot.data![index]));
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Color.fromARGB(
                                                            255, 208, 208, 208),
                                                        offset: Offset(0, 3),
                                                        spreadRadius: 2,
                                                        blurRadius: 3)
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(22))),
                                              width: width,
                                              // height: height * 0.,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(7)),
                                                child: Image.network(
                                                  fit: BoxFit.cover,
                                                  snapshot.data![index].src
                                                      .portrait,
                                                  // fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            color: Color(0xFF237A57),
                                            indent: 20,
                                            endIndent: 20,
                                          ),
                                          Container(
                                            width: width * 0.4,
                                            alignment: Alignment.center,
                                            child: Text(
                                              style: TextStyle(
                                                  fontFamily: "Josefin Sans"),
                                              snapshot.data![index].alt,
                                              softWrap: false,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height * 0.36,
                          ),
                          Center(
                              child:
                                  CupertinoActivityIndicator(animating: true)),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
