import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String? sex;
  final DateTime createdAt;
  final DateTime dob;
  final double walletBalance;
  final double pendingPayment;
  final String? transactionPin;
  final String? location;
  final String? image;
  final String phoneNo;
  final String token;
  final String? accountPin;
  final String? nokFirstName;
  final String? nokLastName;
  final String? nokPhoneNumber;
  final String? nokRelationship;
  final double distanceCovered;
  final bool isValidated;
  final bool isActive;
  final bool withEmail;
  final bool withGoogle;
  final bool withFacebook;
  final int? planId;
  final String password;
  final String? facebookUserId;
  final bool hasActiveTrip;

  UserEntity({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.sex,
    required this.createdAt,
    required this.dob,
    required this.walletBalance,
    required this.pendingPayment,
    this.transactionPin,
    this.location,
    this.image,
    required this.phoneNo,
    required this.token,
    this.accountPin,
    this.nokFirstName,
    this.nokLastName,
    this.nokPhoneNumber,
    this.nokRelationship,
    required this.distanceCovered,
    required this.isValidated,
    required this.isActive,
    required this.withEmail,
    required this.withGoogle,
    required this.withFacebook,
    this.planId,
    required this.password,
    this.facebookUserId,
    required this.hasActiveTrip,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        firstName,
        lastName,
        sex,
        createdAt,
        dob,
        walletBalance,
        pendingPayment,
        transactionPin,
        location,
        image,
        phoneNo,
        token,
        accountPin,
        nokFirstName,
        nokLastName,
        nokPhoneNumber,
        nokRelationship,
        distanceCovered,
        isValidated,
        isActive,
        withEmail,
        withGoogle,
        withFacebook,
        planId,
        password,
        facebookUserId,
        hasActiveTrip
      ];
}
