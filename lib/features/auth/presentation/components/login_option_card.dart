import 'package:flutter/material.dart';
import 'package:guliva/core/constants/app_colors.dart';

class LoginOptionCard extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onClick;
  const LoginOptionCard({super.key, required this.icon, required this.title, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width/2,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(width: 0.8, color: const Color(AppColors.primaryColor)),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 25,
              width: 25,
              child: Image.asset(icon, color: const Color(AppColors.primaryColor),)),
          const SizedBox(width: 10,),
          Text(
            title,
            style: const TextStyle(
              color: Color(AppColors.primaryColor)
            ),
          )
        ],
      ),
    );
  }
}
