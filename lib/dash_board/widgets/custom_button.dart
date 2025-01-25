import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onTap,
    this.rowWidget = false,
    this.image,
  });
  final String title;
  final Function()? onTap;
  final String? image;
  final bool rowWidget;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.teal.shade500, width: 5),
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Colors.white],
          ),
        ),
        child: Center(
            child: rowWidget
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontSize: 20, color: Colors.teal),
                      ),
                      Image.asset(
                        image!,
                        height: 30,
                        width: 30,
                      )
                    ],
                  )
                : Text(
                    title,
                    style: TextStyle(fontSize: 20, color: Colors.teal),
                  )),
      ),
    );
  }
}
