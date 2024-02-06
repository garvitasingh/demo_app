import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;

  const CustomButtonWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Colors.blue, Colors.green],
        ),
      ),
      child: TextButton(
        onPressed: () {
          // Handle button press
        },
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
