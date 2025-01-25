import 'package:flutter/material.dart';
import 'package:test/dash_board/widgets/custom_button.dart';
import 'package:test/letters_and_numbers/screens/letters_screen.dart';
import 'package:test/letters_and_numbers/screens/number_screen.dart';
import 'package:test/utils.dart' as utils;

class LettersAndNumbersScreen extends StatelessWidget {
  const LettersAndNumbersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: utils.color,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          spacing: 50,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/logo/logo_icon.png"),
            CustomButton(
              title: "Show Letters",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LettersScreen();
                }));
              },
            ),
            CustomButton(
              title: "Show Numbers",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NumberScreen();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}
