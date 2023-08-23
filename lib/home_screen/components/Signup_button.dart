import 'package:flutter/material.dart';

class SignupButton extends StatefulWidget {
  const SignupButton({super.key});

  @override
  State<SignupButton> createState() => _SignupButtonState();
}

class _SignupButtonState extends State<SignupButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(5),
          topRight: Radius.circular(5)),
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        height: 45,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.orange[600],
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(5),
              topRight: Radius.circular(5)),
        ),
        child: const Text(
          "Sign Up",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
