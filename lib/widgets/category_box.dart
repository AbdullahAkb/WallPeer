import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryBox extends StatefulWidget {
  const CategoryBox(
      {Key? key,
      required this.title,
      required this.url,
      required this.onpressed})
      : super(key: key);

  final VoidCallback onpressed;
  final String title;
  final String url;

  @override
  State<CategoryBox> createState() => _CategoryBoxState();
}

class _CategoryBoxState extends State<CategoryBox> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        widget.onpressed();
      },
      child: Container(
          height: height * 0.14,
          width: width * 0.45,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 208, 208, 208),
                    offset: Offset(0, 3),
                    spreadRadius: 2,
                    blurRadius: 3)
              ],
              image: DecorationImage(
                image: CachedNetworkImageProvider(widget.url),
                fit: BoxFit.cover,
              ),
              // color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Text(
            widget.title,
            style: TextStyle(
                color: Colors.white, fontSize: 23, fontFamily: "Branch"),
          )),
    );
  }
}
