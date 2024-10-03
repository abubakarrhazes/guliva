import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final controller;
  final String title;
  final bool isObscure;
  final IconButton? suffixIcon;
  const CustomTextField({super.key, this.controller, required this.title, required this.isObscure, required this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.grey
          ),
        ),
        const SizedBox(height: 5,),
        TextFormField(
          controller: controller,
          obscureText: isObscure,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey,width: 0.5)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black,width: 0.5)
            ),
            contentPadding: const EdgeInsets.all(1),
            suffixIcon: suffixIcon
          ),
        ),
      ],
    );
  }
}
