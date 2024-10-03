import 'package:flutter/material.dart';
import 'package:guliva/core/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onClick;
  const CustomButton({super.key, required this.title, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: const Color(AppColors.primaryColor),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12
            ),
          ),
        ),
      ),
    );
  }
}
