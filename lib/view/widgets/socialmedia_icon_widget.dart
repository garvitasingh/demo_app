import 'package:flutter/material.dart';

class SocialMediaIconWidget extends StatelessWidget {
  final IconData icon;
  final Color color;

  SocialMediaIconWidget({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
        child: Icon(
          icon,
          color: color,
          size: 45,
      ),
    );
  }
}