import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:wallpeer/models/photo_model.dart';
import 'package:http/http.dart' as http;
import 'package:wallpeer/screens/main_screen.dart';
import 'package:wallpeer/screens/preview_screen.dart';

class AllWallpapersScreen extends StatefulWidget {
  final String title;
  const AllWallpapersScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<AllWallpapersScreen> createState() => _AllWallpapersScreenState();
}

class _AllWallpapersScreenState extends State<AllWallpapersScreen> {
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  String apiKey = "zMK7BWyZmjj8O3fNg2AtgCIxZAPQRtM0sR4RtIxH6zZJzSetWjvO1LCu";
  List<PhotoModel> photoList = [];
  String nextpage = "";
  int page = 1;
  bool isSearching = false;

  Stream<List<PhotoModel>> getWallpapers() async* {
    Uri apiUrl = Uri.parse(
        "https://api.pexels.com/v1/search?query=${widget.title}&per_page=95&page=$page");
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

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarColor: Color(0xFF237A57),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.orange,
              size: 20,
            ),
          ),
          toolbarHeight: height * 0.11,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Color(0xFF237A57), Color(0xFF093028)]),
            ),
          ),
          centerTitle: true,
          title: GradientText(
            widget.title,
            style: TextStyle(fontFamily: "Amithen", fontSize: 45),
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 255, 255),
              // Color.fromARGB(255, 235, 230, 229),
              Color.fromARGB(255, 255, 255, 255),
            ],
          ),
        ),
        backgroundColor: Color.fromARGB(255, 238, 238, 238),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    StreamBuilder(
                      stream: getWallpapers(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                          return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 100,
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    // mainAxisSpacing: 10,
                                    mainAxisExtent: 300),
                            controller: scrollController,
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.to(PreviewScreen(
                                          title: snapshot
                                              .data![index].src.portrait,
                                          original: snapshot
                                              .data![index].src.original,
                                        ));
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
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(22))),
                                        width: width,
                                        // height: height * 0.,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(7)),
                                          child: Image.network(
                                            fit: BoxFit.cover,
                                            snapshot.data![index].src.portrait,
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
                              );
                            },
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
                                child: CupertinoActivityIndicator(
                                    animating: true)),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
