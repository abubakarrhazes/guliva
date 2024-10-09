import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final controller;
  final String title;
  final bool isObscure;
  final IconButton? suffixIcon;
  final TextInputType? keyboardType;
  final String? hint;
  final String? Function(String?)? validator;
  const CustomTextField(
      {super.key,
      this.controller,
      required this.title,
      required this.isObscure,
      this.hint,
      this.validator,
      this.keyboardType,
      required this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 13, fontWeight: FontWeight.w500, color: Colors.grey),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          obscureText: isObscure,
          keyboardType: keyboardType,
          decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide
                    .none, // No border side to match the background color
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              filled: true,
              suffixIcon: suffixIcon),
        ),
      ],
    );
  }
}
