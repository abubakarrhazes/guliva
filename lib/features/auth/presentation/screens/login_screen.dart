import 'package:flutter/material.dart';
import 'package:guliva/features/auth/presentation/components/login_option_card.dart';
import 'package:guliva/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:guliva/features/vehicles/presentation/screens/vehicles_and_passengers_screen.dart';
import 'package:guliva/core/constants/app_colors.dart';
import 'package:guliva/core/constants/app_icons.dart';
import 'package:guliva/core/shared_components/custom_button.dart';
import 'package:guliva/core/shared_components/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Log In",
                style: TextStyle(color: Color(AppColors.primaryColor), fontSize: 16),
              ),
              const SizedBox(height: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "LOG IN WITH...",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: LoginOptionCard(
                              icon: AppIcons.googleIcon,
                              title: "GOOGLE",
                              onClick: () {})),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: LoginOptionCard(
                              icon: AppIcons.faceBookIcon,
                              title: "FACEBOOK",
                              onClick: () {})),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "LOG IN WITH EMAIL",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    title: "Email address",
                    isObscure: false,
                    suffixIcon: null,
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 20,
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
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //login button
                  CustomButton(title: "LOG IN", onClick: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const VehiclesAndPassengersScreen()));
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  //finger pint sensor
                  Column(
                    children: [
                      SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.asset(
                            AppIcons.fingerPrintIcon,
                            color: const Color(AppColors.primaryColor),
                          )),
                      const Text(
                        "Touch/Face ID",
                        style: TextStyle(color: Color(AppColors.primaryColor)),
                      )
                    ],
                  ),
                  const SizedBox(height: 25,),
                  //sign up linker
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUpScreen()));
                    },
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Don't have an account?",
                            style: TextStyle(
                              color: Color(AppColors.primaryColor)
                            )
                          ),
                          TextSpan(
                            text: " Sign Up",
                            style: TextStyle(
                              color: Colors.red
                            )
                          ),
                        ]
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
