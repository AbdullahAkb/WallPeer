import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({super.key});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(25),
        topLeft: Radius.circular(5),
        bottomLeft: Radius.circular(5),
      ),
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        height: 45,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(5),
            bottomLeft: Radius.circular(5),
          ),
        ),
        child: const Text(
          "Log In",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
