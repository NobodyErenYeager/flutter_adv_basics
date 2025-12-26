import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.text, required this.onTap});

  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: const Color.fromARGB(255, 0, 217, 255),
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadiusGeometry.circular(10),
        // ),
      ),
      onPressed: onTap,
      child: Text(text, textAlign: TextAlign.center),
    );
  }
}
