import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:wallpeer/models/photo_model.dart';

class PreviewScreen extends StatefulWidget {
  final PhotoModel details;
  // final String original;
  const PreviewScreen({
    Key? key,
    required this.details,
  }) : super(key: key);

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  @override
  void initState() {
    super.initState();
    FlutterDownloader.initialize();
  }

  Future<void> downloadFile(String url, String filename) async {
    var taskId = await FlutterDownloader.enqueue(
      url: url,
      savedDir: '/sdcard/Download',
      fileName: filename,
      showNotification: true,
      openFileFromNotification: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Color.fromARGB(255, 0, 0, 0), // status bar color
    ));
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'Preview',
      //     style: TextStyle(fontFamily: "Branch"),
      //   ),
      // ),
      body: SafeArea(
        child: Stack(children: [
          Container(
            width: width,
            height: height,
            child: Image.network(
              widget.details.src.portrait,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: height * 0.09,
            // margin: EdgeInsets.only(top: height * 0.03),
            decoration: BoxDecoration(color: Color.fromARGB(50, 158, 158, 158)),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.orange,
                      size: 20,
                    )),
                SizedBox(
                  width: width * 0.1,
                ),
                Text(
                  "Preview",
                  style: TextStyle(
                      fontFamily: "Josefin Sans",
                      color: Colors.white,
                      fontSize: 20),
                ),
                Expanded(child: Container()),
                IconButton(
                    onPressed: () {
                      // Get.back();
                      downloadFile(
                          widget.details.src.original, widget.details.alt);
                    },
                    icon: Icon(
                      CupertinoIcons.cloud_download,
                      color: Colors.orange,
                      size: 20,
                    )),
                SizedBox(
                  width: width * 0.01,
                ),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                elevation: 1,
                                shadowColor: Colors.white,
                                backgroundColor: Color(0x4E9E9E9E),
                                title: Text(
                                  "Details",
                                  style: TextStyle(
                                      fontFamily: "Josefin Sans",
                                      color: Colors.white),
                                ),
                                content: Container(
                                  decoration: BoxDecoration(),
                                  height: height * 0.235,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: height * 0.01,
                                        // color: Colors.orange,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "Photographer :",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontFamily: "Josefin Sans",
                                            ),
                                          ),
                                          Text(
                                            widget.details.photographer,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: "Josefin Sans",
                                            ),
                                            softWrap: false,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        height: height * 0.05,
                                        color: Colors.orange,
                                        thickness: 0.4,
                                        indent: width * 0.1,
                                        endIndent: width * 0.1,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "Height :",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontFamily: "Josefin Sans",
                                            ),
                                          ),
                                          Text(
                                            widget.details.height.toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: "Josefin Sans",
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        height: height * 0.05,
                                        color: Colors.orange,
                                        thickness: 0.4,
                                        indent: width * 0.1,
                                        endIndent: width * 0.1,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "Width :",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontFamily: "Josefin Sans",
                                            ),
                                          ),
                                          Text(
                                            widget.details.width.toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: "Josefin Sans",
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        height: height * 0.05,
                                        color: Colors.orange,
                                        thickness: 0.4,
                                        indent: width * 0.1,
                                        endIndent: width * 0.1,
                                      ),
                                    ],
                                  ),
                                ));
                          });
                    },
                    icon: Icon(
                      CupertinoIcons.info,
                      color: Colors.orange,
                      size: 20,
                    )),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
