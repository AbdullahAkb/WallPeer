import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TestScree extends StatefulWidget {
  const TestScree({super.key});

  @override
  State<TestScree> createState() => _TestScreeState();
}

class _TestScreeState extends State<TestScree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Khareed Online'),
      ),
      body: Center(
          child: Lottie.asset(
        "Assets/images/data.json",
        width: 200,
        height: 200,
        fit: BoxFit.fill,
      )),
    );
  }
}
