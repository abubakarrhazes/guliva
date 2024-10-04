import 'dart:developer';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:guliva/core/constants/app_colors.dart';

void errorWidget({required String message}) {
  if (Platform.isAndroid || Platform.isIOS) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.redColor,
      textColor: AppColors.whiteColor,
      fontSize: 16,
    );
  } else {
    log(message);
  }
}

void successWidget({required String message}) {
  if (Platform.isAndroid || Platform.isIOS) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.greenColor,
      textColor: AppColors.whiteColor,
      fontSize: 16,
    );
  } else {
    log(message);
  }
}