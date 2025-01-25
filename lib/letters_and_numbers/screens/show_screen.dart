import 'package:flutter/material.dart';
import 'package:test/utils.dart' as utils;

class ShowScreen extends StatelessWidget {
  const ShowScreen({
    super.key,
    required this.image,
    required this.title,
  });
  final String image, title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        foregroundColor: Colors.white,
        backgroundColor: utils.color,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 30,
        children: [
          Image.asset(image),
          Text(
            title,
            style: TextStyle(
              fontSize: 54,
              fontWeight: FontWeight.bold,
              color: utils.color,
            ),
          ),
        ],
      ),
    );
  }
}
