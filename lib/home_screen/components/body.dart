import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpeer/home_screen/components/Signup_button.dart';
import 'package:wallpeer/home_screen/components/login_button.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

enum AvatarSelection { none, avatar1, avatar2, avatar3, avatar4 }

class _BodyState extends State<Body> {
  AvatarSelection selectedAvatar = AvatarSelection.none;
  List<String> categoryList = [
    "Assets/images/shoes.png",
    "Assets/images/shirts.png",
    "Assets/images/electro.png",
    "Assets/images/more.png"
  ];
  List<String> categoryNameList = ["Shoes", "Shirts", "Games", "More"];
  List<String> productPersonalisedList = [
    "All",
    "Trending",
    "Wished",
    "Best Value",
    "Popular",
    "Time Limited",
    "Today Special"
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 15),
                    height: 150,
                    width: 100,
                    child: const Text(
                      "Explore the World of Fashion",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: 100,
                    width: 140,
                    child: SvgPicture.asset(
                      "Assets/images/home_screen_svg.svg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            const IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LoginButton(),
                  VerticalDivider(
                    color: Colors.grey,
                    thickness: 0.5,
                    indent: 5,
                    endIndent: 5,
                  ),
                  SignupButton(),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  AvatarSelection avatar = AvatarSelection.values[index + 1];
                  bool isSelected = selectedAvatar == avatar;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedAvatar = avatar;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 11.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                              backgroundColor: isSelected
                                  ? Colors.deepOrange[100]
                                  : Colors.white,
                              radius: 31,
                              child: SizedBox(
                                  height: 30,
                                  child: Image.asset(categoryList[index]))),
                          const SizedBox(height: 8),
                          Text(
                            categoryNameList[index],
                            style: TextStyle(
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 35,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productPersonalisedList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        child: Text(
                          productPersonalisedList[index],
                          style: const TextStyle(),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 350,
              child: GridView.builder(
                itemCount: 5,
                shrinkWrap: true,
                padding: const EdgeInsets.all(2),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.65,
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 1,
                              spreadRadius: 0.5,
                              color: Colors.grey),
                        ],
                        image: DecorationImage(
                            opacity: 0.2,
                            image: AssetImage(
                              "Assets/images/sneakers.jpg",
                            ))),
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Product Name",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "\$23",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text("10%"),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
