
import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
    CustomButtom({required this.onTap, required this.text});
  String text;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 29, 206, 226), borderRadius: BorderRadius.circular(8)),
          width: double.infinity,
          height: 60,
          child: Center(
              child: Text(text,
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 4, 64, 68)
            ),
          )),
        ),
      ),
    );
  }
}
