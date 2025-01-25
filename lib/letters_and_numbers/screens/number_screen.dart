import 'package:flutter/material.dart';
import 'package:test/letters_and_numbers/screens/show_screen.dart';
import 'package:test/utils.dart' as utils;

class NumberScreen extends StatelessWidget {
  const NumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Letters",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        foregroundColor: Colors.white,
        backgroundColor: utils.color,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 20),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ShowScreen(
                      image: images[index],
                      title: numbers[index],
                    );
                  },
                ),
              );
            },
            child: Card(
              color: utils.color,
              child: Center(
                child: Text(
                  numbers[index],
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List<String> numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
List<String> images = [
  'assets/letters/0.png',
  'assets/letters/1.png',
  'assets/letters/2.png',
  'assets/letters/3.png',
  'assets/letters/4.png',
  'assets/letters/5.png',
  'assets/letters/6.png',
  'assets/letters/7.png',
  'assets/letters/8.png',
  'assets/letters/9.png'
];
