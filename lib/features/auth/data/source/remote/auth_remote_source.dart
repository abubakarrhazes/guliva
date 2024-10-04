// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:guliva/core/constants/app_strings.dart';
import 'package:http/http.dart' as http;

import 'package:guliva/core/error/failures.dart';
import 'package:guliva/features/auth/data/models/response_model.dart';
import 'package:guliva/features/auth/domain/entities/user.dart';
import 'package:guliva/features/auth/domain/usecase/sign_in_usecase.dart';
import 'package:guliva/features/auth/domain/usecase/sign_up_usecase.dart';

abstract class AuthRemoteSource {
  Future<ResponseModel> signIn(SignInParams params);
  Future<ResponseModel> signUp(SignUpParams params);
}

class AuthRemoteSourceImpl implements AuthRemoteSource {
  final http.Client client;

  AuthRemoteSourceImpl({
    required this.client,
  });

  @override
  Future<ResponseModel> signIn(SignInParams params) async {
    final response = await client.post(
      Uri.parse('${AppStrings.baseUrl}/user/login'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(
        {
          'email': params.email,
          'password': params.password,
        },
      ),
    );
    if (response.statusCode == 200) {
      return responseModelFromJson(response.body);
    } else if (response.statusCode == 400 || response.statusCode == 401) {
      throw CredentialFailure();
    } else {
      throw ServerFailure();
    }
  }

  @override
  Future<ResponseModel> signUp(SignUpParams params) async {
    final response = await client.post(
      Uri.parse('${AppStrings.baseUrl}/user/register'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(
        {
          'firstName': params.firstName,
          'lastName': params.lastName,
          'phoneNo': params.phoneNo,
          'email': params.email,
          'dob': params.dob,
          'password': params.password,
          'withEmail': params.withEmail,
        },
      ),
    );

    if (response.statusCode == 200) {
      return responseModelFromJson(response.body);
    } else if (response.statusCode == 400 || response.statusCode == 401) {
      throw CredentialFailure();
    } else {
      throw ServerFailure();
    }
  }
}
