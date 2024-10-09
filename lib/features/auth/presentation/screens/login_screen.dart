// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:guliva/core/constants/app_fonts.dart';
import 'package:guliva/core/constants/app_helpers.dart';
import 'package:guliva/core/constants/app_image_constant.dart';
import 'package:guliva/core/error/failures.dart';
import 'package:guliva/core/router/app_router.dart';
import 'package:guliva/features/auth/domain/usecase/sign_in_usecase.dart';
import 'package:guliva/features/auth/presentation/bloc/user_bloc.dart';
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
  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset(AppImageConstant.appLogo)),
                const Text(
                  "Log In",
                  style: TextStyle(
                    color: Color(AppColors.primaryColor),
                    fontSize: 16,
                    fontFamily: AppFonts.poppins,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "LOG IN WITH...",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          fontFamily: AppFonts.poppins,
                          color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: LoginOptionCard(
                                icon: AppImageConstant.googleLogo,
                                title: "GOOGLE",
                                onClick: () {})),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: LoginOptionCard(
                                icon: AppImageConstant.facebookLogo,
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
                          fontFamily: AppFonts.poppins,
                          color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                              title: "Email address",
                              isObscure: false,
                              suffixIcon: null,
                              controller: emailController,
                              validator: (value) {
                                RegExp emailRegExp = RegExp(
                                    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

                                if (value == null || value.isEmpty) {
                                  return 'Email can\'t be empty';
                                } else if (!emailRegExp.hasMatch(value)) {
                                  return 'Enter a correct email';
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextField(
                            title: "Password",
                            isObscure: isObscure ? true : false,
                            validator: (String? val) {
                              if (val == null || val.isEmpty) {
                                return 'This field can\'t be empty';
                              }
                              return null;
                            },
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isObscure = !isObscure;
                                  });
                                },
                                icon: Icon(
                                  isObscure
                                      ? Icons.remove_red_eye
                                      : Icons.remove_red_eye_outlined,
                                  color: Colors.grey,
                                )),
                            controller: passwordController,
                          ),
                          SizedBox(height: 8),
                          Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          //login button
                          BlocConsumer<UserBloc, UserState>(
                            listener: (context, state) {
                              // TODO: implement listener
                              if (state is UserLogged) {
                                successWidget(message: 'Login Successfully');
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                  AppRouter.home,
                                  ModalRoute.withName(''),
                                );
                              } else if (state is UserLoggedFail) {
                                if (state.failure is CredentialFailure) {
                                  errorWidget(
                                      message: state.failure.message);
                                } else {
                                  errorWidget(message: state.failure.message);
                                }
                              }
                            },
                            builder: (context, state) {
                              return state is UserLoading
                                  ? CircularProgressIndicator()
                                  : CustomButton(
                                      title: "LOG IN",
                                      onClick: () {
                                        if (_formKey.currentState!.validate()) {
                                          context.read<UserBloc>().add(
                                                SignInUser(
                                                  SignInParams(
                                                    email: emailController.text,
                                                    password:
                                                        passwordController.text,
                                                  ),
                                                ),
                                              );
                                        }
                                      },
                                    );
                            },
                          ),
                        ],
                      ),
                    ),
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
                              AppImageConstant.fingerPrintIcon,
                              color: const Color(AppColors.primaryColor),
                            )),
                        const Text(
                          "Touch/Face ID",
                          style: TextStyle(
                              fontFamily: AppFonts.poppins,
                              color: Color(
                                AppColors.primaryColor,
                              )),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    //sign up linker
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                      },
                      child: RichText(
                        text: const TextSpan(children: [
                          TextSpan(
                              text: "Don't have an account?",
                              style: TextStyle(
                                  fontFamily: AppFonts.poppins,
                                  color: Color(AppColors.primaryColor))),
                          TextSpan(
                              text: " Sign Up",
                              style: TextStyle(
                                  fontFamily: AppFonts.poppins,
                                  color: Colors.red)),
                        ]),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
