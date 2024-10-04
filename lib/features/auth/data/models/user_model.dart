import 'dart:convert';

import 'package:guliva/features/auth/domain/entities/user.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends User {
  const UserModel(
      {required super.id,
      required super.email,
      required super.firstName,
      required super.lastName,
      required super.createdAt,
      required super.dob,
      required super.walletBalance,
      required super.pendingPayment,
      required super.hasActiveTrip,
      required super.phoneNo,
      required super.token,
      required super.distanceCovered,
      required super.isValidated,
      required super.isActive,
      required super.withEmail,
      required super.withGoogle,
      required super.withFacebook,
      super.sex,
      super.location,
      super.image,
      super.accountPin,
      super.facebookUserId,
      super.nokFirstName,
      super.nokLastName,
      super.nokPhoneNumber,
      super.nokRelationship});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      sex: json['sex'],
      createdAt: DateTime.parse(json['createdAt']),
      dob: DateTime.parse(json['dob']),
      walletBalance: (json['walletBalance'] as num).toDouble(),
      pendingPayment: (json['pendingPayment'] as num).toDouble(),
      location: json['location'],
      image: json['image'],
      hasActiveTrip: json['hasActiveTrip'],
      phoneNo: json['phoneNo'],
      token: json['token'],
      accountPin: json['accountPin'],
      facebookUserId: json['facebookUserId'],
      nokFirstName: json['nok_First_Name'],
      nokLastName: json['nok_Last_Name'],
      nokPhoneNumber: json['nok_Phone_number'],
      nokRelationship: json['nok_Relationship'],
      distanceCovered: (json['distanceCovered'] as num).toDouble(),
      isValidated: json['isValidated'],
      isActive: json['isActive'],
      withEmail: json['withEmail'],
      withGoogle: json['withGoogle'],
      withFacebook: json['withFacebook'],
    );
  }

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
      'location': location,
      'image': image,
      'hasActiveTrip': hasActiveTrip,
      'phoneNo': phoneNo,
      'token': token,
      'accountPin': accountPin,
      'facebookUserId': facebookUserId,
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
    };
  }
}
