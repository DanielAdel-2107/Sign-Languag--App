import 'package:flutter/material.dart';
import 'package:test/letters_and_numbers/screens/show_screen.dart';
import 'package:test/utils.dart' as utils;

class LettersScreen extends StatelessWidget {
  const LettersScreen({super.key});

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
          itemCount: 26,
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
                      title: letters[index],
                    );
                  },
                ),
              );
            },
            child: Card(
              color: utils.color,
              child: Center(
                child: Text(
                  letters[index],
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

List<String> letters = [
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];
List<String> images = [
  "assets/letters/a.png",
  "assets/letters/b.png",
  "assets/letters/c.png",
  "assets/letters/d.png",
  "assets/letters/e.png",
  "assets/letters/f.png",
  "assets/letters/g.png",
  "assets/letters/h.png",
  "assets/letters/i.png",
  "assets/letters/j.png",
  "assets/letters/k.png",
  "assets/letters/l.png",
  "assets/letters/m.png",
  "assets/letters/n.png",
  "assets/letters/o.png",
  "assets/letters/p.png",
  "assets/letters/q.png",
  "assets/letters/r.png",
  "assets/letters/s.png",
  "assets/letters/t.png",
  "assets/letters/u.png",
  "assets/letters/v.png",
  "assets/letters/w.png",
  "assets/letters/x.png",
  "assets/letters/y.png",
  "assets/letters/z.png",
];
