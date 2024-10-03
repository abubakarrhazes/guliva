import 'package:flutter/material.dart';
import 'package:guliva/core/shared_components/custom_button.dart';
import 'package:guliva/core/shared_components/custom_text_field.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final dobController = TextEditingController();
  final passwordController = TextEditingController();
  bool isChecked = false;
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Image.asset(
          AppIcons.appLogo,
          scale: 1.5,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const Text(
                "SIGN UP WITH EMAIL",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                title: "First Name",
                isObscure: false,
                suffixIcon: null,
                controller: firstNameController,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                title: "Last Name",
                isObscure: false,
                suffixIcon: null,
                controller: lastNameController,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                title: "Phone Number",
                isObscure: false,
                suffixIcon: null,
                controller: phoneNumberController,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                title: "Email",
                isObscure: false,
                suffixIcon: null,
                controller: emailController,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                title: "Date of Birth",
                isObscure: false,
                suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.calendar_month_rounded, color: Colors.grey,)),
                controller: dobController,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                title: "Password",
                isObscure: isObscure ? true : false,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: Icon(
                      isObscure ? Icons.remove_red_eye : Icons.remove_red_eye_outlined,
                      color: Colors.grey,
                    )),
                controller: passwordController,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                          color: isChecked
                              ? const Color(AppColors.primaryColor)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(width: 1, color: Colors.black)),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  RichText(
                    text: const TextSpan(
                        style: TextStyle(fontSize: 13),
                        children: [
                          TextSpan(
                              text: "i agree to the ",
                              style: TextStyle(
                                  color: Color(AppColors.primaryColor))),
                          TextSpan(
                              text: "Terms & Condition",
                              style: TextStyle(color: Colors.red)),
                          TextSpan(
                              text: " and ",
                              style: TextStyle(
                                  color: Color(AppColors.primaryColor))),
                          TextSpan(
                              text: " Privacy Policy",
                              style: TextStyle(color: Colors.red)),
                        ]),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              CustomButton(title: "SIGN UP", onClick: () {})
            ],
          ),
        ),
      ),
    );
  }
}
