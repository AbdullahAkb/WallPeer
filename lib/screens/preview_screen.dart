import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PreviewScreen extends StatefulWidget {
  final String title;
  final String original;
  const PreviewScreen({Key? key, required this.title, required this.original})
      : super(key: key);

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.original);
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
              widget.title,
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
                    },
                    icon: Icon(
                      CupertinoIcons.cloud_download,
                      color: Colors.orange,
                      size: 20,
                    )),
                SizedBox(
                  width: width * 0.01,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
