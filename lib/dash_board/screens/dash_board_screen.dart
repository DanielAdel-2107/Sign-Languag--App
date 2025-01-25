import 'package:flutter/material.dart';
import 'package:test/dash_board/widgets/custom_button.dart';
import 'package:test/letters_and_numbers/screens/letters_and_numbers_screen.dart';
import 'package:test/voice_to_signature/screens/speechToSign.dart';
import 'package:test/text_to_signature/screens/text_to_signatures_screen.dart';
import 'package:test/utils.dart' as utils;

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: utils.color,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          spacing: 30,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/logo/logo_icon.png"),
            CustomButton(
              title: "Text To Sign Language",
              rowWidget: true,
              image: "assets/logo/TextToTranslate.png",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TextToSignaturesScreen();
                }));
              },
            ),
            CustomButton(
              title: "Voice To Sign Language",
              rowWidget: true,
              image: "assets/logo/VoiceToTranslate.png",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SpeechScreen();
                }));
              },
            ),
            CustomButton(
              title: "Show Letters & Numbers",
              rowWidget: true,
              image: "assets/logo/dictionary.png",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LettersAndNumbersScreen();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
