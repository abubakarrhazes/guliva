import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String? sex;
  final DateTime createdAt;
  final DateTime dob;
  final double walletBalance;
  final double pendingPayment;
  final String? location;
  final String? image;
  final bool hasActiveTrip;
  final String phoneNo;
  final String token;
  final String? accountPin;
  final String? facebookUserId;
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

  const User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.sex,
    required this.createdAt,
    required this.dob,
    required this.walletBalance,
    required this.pendingPayment,
    this.location,
    this.image,
    required this.hasActiveTrip,
    required this.phoneNo,
    required this.token,
    this.accountPin,
    this.facebookUserId,
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
  });

  @override
  // TODO: implement props
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
        location,
        image,
        hasActiveTrip,
        phoneNo,
        token,
        accountPin,
        facebookUserId,
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
      ];
}
