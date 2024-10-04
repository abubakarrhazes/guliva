// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:guliva/features/auth/data/models/user_model.dart';
import 'user_model.dart';

class ResponseModel {
  final bool success;
  final String message;
  final UserModel data;

  ResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      success: json['success'],
      message: json['message'],
      data: UserModel.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.toJson(),
    };
  }
}
