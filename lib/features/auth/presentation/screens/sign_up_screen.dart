// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guliva/core/constants/app_fonts.dart';
import 'package:guliva/core/constants/app_helpers.dart';
import 'package:guliva/core/constants/app_image_constant.dart';
import 'package:guliva/core/error/failures.dart';
import 'package:guliva/core/router/app_router.dart';
import 'package:guliva/core/shared_components/custom_button.dart';
import 'package:guliva/core/shared_components/custom_text_field.dart';
import 'package:guliva/features/auth/domain/usecase/sign_up_usecase.dart';
import 'package:guliva/features/auth/presentation/bloc/user_bloc.dart';

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
  final _formKey = GlobalKey<FormState>();

  bool isChecked = false;
  bool isObscure = true;

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        helpText: 'Select Date Of Birth',
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      dobController.text = selectedDate.toLocal().toString().split(' ')[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Image.asset(
          AppImageConstant.appLogo,
          scale: 1.5,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  "SIGN UP WITH EMAIL",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppFonts.poppins,
                      color: Colors.grey),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  title: "First Name",
                  isObscure: false,
                  suffixIcon: null,
                  keyboardType: TextInputType.text,
                  controller: firstNameController,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return 'This field can\'t be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  title: "Last Name",
                  isObscure: false,
                  suffixIcon: null,
                  controller: lastNameController,
                  keyboardType: TextInputType.text,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return 'This field can\'t be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  title: "Phone Number",
                  isObscure: false,
                  suffixIcon: null,
                  controller: phoneNumberController,
                  keyboardType: TextInputType.number,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return 'This field can\'t be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                    title: "Email",
                    isObscure: false,
                    suffixIcon: null,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
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
                  height: 15,
                ),
                CustomTextField(
                  title: "Date of Birth",
                  isObscure: false,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return 'This field can\'t be empty';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.datetime,
                  suffixIcon: IconButton(
                      onPressed: () {
                        _selectDate(context).toString();
                      },
                      icon: const Icon(
                        Icons.calendar_month_rounded,
                        color: Colors.grey,
                      )),
                  controller: dobController,
                ),
                const SizedBox(
                  height: 15,
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
                                    fontFamily: AppFonts.poppins,
                                    color: Color(AppColors.primaryColor))),
                            TextSpan(
                                text: "Terms & Condition",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontFamily: AppFonts.poppins,
                                )),
                            TextSpan(
                                text: " and ",
                                style: TextStyle(
                                    fontFamily: AppFonts.poppins,
                                    color: Color(
                                      AppColors.primaryColor,
                                    ))),
                            TextSpan(
                                text: " Privacy Policy",
                                style: TextStyle(
                                    fontFamily: AppFonts.poppins,
                                    color: Colors.red)),
                          ]),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                BlocConsumer<UserBloc, UserState>(
                  listener: (context, state) {
                    // TODO: implement listener
                    if (state is UserLogged) {
                      successWidget(message: 'Registered Successfully');
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRouter.home,
                        ModalRoute.withName(''),
                      );
                    } else if (state is UserLoggedFail) {
                      if (state.failure is CredentialFailure) {
                        errorWidget(message: state.failure.message);
                      } else {
                        errorWidget(message: state.failure.message);
                      }
                    }
                  },
                  builder: (context, state) {
                    return state is UserLoading
                        ? CircularProgressIndicator()
                        : CustomButton(
                            title: "SIGN UP",
                            onClick: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<UserBloc>().add(
                                      SignUpUser(
                                        SignUpParams(
                                          firstName: firstNameController.text,
                                          lastName: lastNameController.text,
                                          email: emailController.text,
                                          password: passwordController.text,
                                          phoneNo: phoneNumberController.text,
                                          dob: dobController.text,
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
        ),
      ),
    );
  }
}
