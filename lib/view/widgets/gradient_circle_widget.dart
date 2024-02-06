import 'package:demo_app/utils/colors.dart';
import 'package:flutter/material.dart';

class GradientCircleWidget extends StatelessWidget {
  final double height;
  const GradientCircleWidget({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient:AppColors.circleGradient
      ),
    );
  }
}
