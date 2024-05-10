import 'package:chat_app/colors.dart';
import 'package:flutter/material.dart';

class CustomButoon extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButoon({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: tabColor,
          minimumSize: Size(double.infinity, 50)
        ),
        child: Text(
          text,
          style: TextStyle(
            color: blackColor,
          ),
        )
    );
  }
}
