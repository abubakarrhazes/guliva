import 'dart:convert';
import 'package:guliva/features/auth/domain/entities/user_entity.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends UserEntity {
  UserModel({
    required int id,
    required String email,
    required String firstName,
    required String lastName,
    String? sex,
    required DateTime createdAt,
    required DateTime dob,
    required double walletBalance,
    required double pendingPayment,
    String? transactionPin,
    String? location,
    String? image,
    required String phoneNo,
    required String token,
    String? accountPin,
    String? nokFirstName,
    String? nokLastName,
    String? nokPhoneNumber,
    String? nokRelationship,
    required double distanceCovered,
    required bool isValidated,
    required bool isActive,
    required bool withEmail,
    required bool withGoogle,
    required bool withFacebook,
    int? planId,
    required String password,
    String? facebookUserId,
    required bool hasActiveTrip,
  }) : super(
          id: id,
          email: email,
          firstName: firstName,
          lastName: lastName,
          sex: sex,
          createdAt: createdAt,
          dob: dob,
          walletBalance: walletBalance,
          pendingPayment: pendingPayment,
          transactionPin: transactionPin,
          location: location,
          image: image,
          phoneNo: phoneNo,
          token: token,
          accountPin: accountPin,
          nokFirstName: nokFirstName,
          nokLastName: nokLastName,
          nokPhoneNumber: nokPhoneNumber,
          nokRelationship: nokRelationship,
          distanceCovered: distanceCovered,
          isValidated: isValidated,
          isActive: isActive,
          withEmail: withEmail,
          withGoogle: withGoogle,
          withFacebook: withFacebook,
          planId: planId,
          password: password,
          facebookUserId: facebookUserId,
          hasActiveTrip: hasActiveTrip,
        );

  // From JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      sex: json['sex'],
      createdAt: DateTime.parse(json['createdAt']),
      dob: DateTime.parse(json['dob']),
      walletBalance: json['walletBalance'].toDouble(),
      pendingPayment: json['pendingPayment'].toDouble(),
      transactionPin: json['transactionPin'],
      location: json['location'],
      image: json['image'],
      phoneNo: json['phoneNo'],
      token: json['token'],
      accountPin: json['accountPin'],
      nokFirstName: json['nok_First_Name'],
      nokLastName: json['nok_Last_Name'],
      nokPhoneNumber: json['nok_Phone_number'],
      nokRelationship: json['nok_Relationship'],
      distanceCovered: json['distanceCovered'].toDouble(),
      isValidated: json['isValidated'],
      isActive: json['isActive'],
      withEmail: json['withEmail'],
      withGoogle: json['withGoogle'],
      withFacebook: json['withFacebook'],
      planId: json['planId'],
      password: json['password'],
      facebookUserId: json['facebookUserId'],
      hasActiveTrip: json['hasActiveTrip'] == 1,
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'sex': sex,
      'createdAt': createdAt.toIso8601String(),
      'dob': dob.toIso8601String(),
      'walletBalance': walletBalance,
      'pendingPayment': pendingPayment,
      'transactionPin': transactionPin,
      'location': location,
      'image': image,
      'phoneNo': phoneNo,
      'token': token,
      'accountPin': accountPin,
      'nok_First_Name': nokFirstName,
      'nok_Last_Name': nokLastName,
      'nok_Phone_number': nokPhoneNumber,
      'nok_Relationship': nokRelationship,
      'distanceCovered': distanceCovered,
      'isValidated': isValidated,
      'isActive': isActive,
      'withEmail': withEmail,
      'withGoogle': withGoogle,
      'withFacebook': withFacebook,
      'planId': planId,
      'password': password,
      'facebookUserId': facebookUserId,
      'hasActiveTrip': hasActiveTrip ? 1 : 0,
    };
  }
}
