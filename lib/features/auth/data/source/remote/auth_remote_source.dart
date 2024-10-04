import 'dart:convert';

import 'package:guliva/core/constants/app_strings.dart';
import 'package:guliva/core/error/failures.dart';
import 'package:guliva/features/auth/data/models/response_model.dart';
import 'package:guliva/features/auth/data/models/user_model.dart';
import 'package:guliva/features/auth/domain/usecase/sign_in_usecase.dart';
import 'package:guliva/features/auth/domain/usecase/sign_up_usecase.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteSource {
  Future<UserModel> signIn(SignInParams params);
  Future<UserModel> signUp(SignUpParams params);
}

class AuthRemoteSourceImpl implements AuthRemoteSource {
  final http.Client client;

  AuthRemoteSourceImpl({
    required this.client,
  });

  @override
  Future<UserModel> signIn(SignInParams params) async {
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
      final jsonResponse = jsonDecode(response.body);
      return UserModel.fromJson(jsonResponse['data']);
    } else if (response.statusCode == 400 || response.statusCode == 401) {
      print('Credential Failure ${response.statusCode}');
      throw CredentialFailure();
    } else {
      print('Here');
      throw ServerFailure();
    }
  }

  @override
  Future<UserModel> signUp(SignUpParams params) async {
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
      final jsonResponse = jsonDecode(response.body);
      return UserModel.fromJson(jsonResponse['data']);
    } else if (response.statusCode == 400 || response.statusCode == 401) {
      throw CredentialFailure();
    } else {
      throw ServerFailure();
    }
  }
}
