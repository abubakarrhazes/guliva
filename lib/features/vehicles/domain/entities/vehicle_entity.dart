import 'package:equatable/equatable.dart';
import 'package:guliva/features/auth/data/models/user_model.dart';
import 'package:guliva/features/auth/domain/entities/user_entity.dart';

import 'package:equatable/equatable.dart';
import 'package:guliva/features/vehicles/domain/entities/trip_entity.dart';

class VehicleEntity extends Equatable {
  final int id;
  final String createdAt;
  final String typeOfVehicle;
  final int? drivingYears; // Nullable
  final bool isDefault;
  final bool isPassenger;
  final String? ownership; // Nullable
  final String? aidRequired; // Nullable
  final String? otherAid; // Nullable
  final String? parking; // Nullable
  final String? involvedInAccident; // Nullable
  final String? securityForVehicle; // Nullable
  final String? bookedForTrafficOffense; // Nullable
  final String? usage; // Nullable
  final String name;
  final String model;
  final bool isThirdPartyInsurance;
  final String color;
  final String year;
  final int value;
  final String registrationNumber;
  final String engineNumber;
  final String chassisNumber;
  final int distanceCovered;
  final int amountBilled;
  final int minimumPayablePremiumAmount;
  final String? engineCapacity; // Nullable
  final String frontView;
  final String sideView;
  final String backView;
  final String driversLicense;
  final String topView;
  final String? insuranceCertificate; // Nullable
  final String? modeOfInsurance; // Nullable
  final String thirdPartyInsurance;
  final String? proofOfOwnership; // Nullable
  final UserEntity userEntity;
  final List<Trip>? trips;

  const VehicleEntity({
    required this.id,
    required this.createdAt,
    required this.typeOfVehicle,
    this.drivingYears,
    required this.isDefault,
    required this.isPassenger,
    this.ownership,
    this.aidRequired,
    this.otherAid,
    this.parking,
    this.involvedInAccident,
    this.securityForVehicle,
    this.bookedForTrafficOffense,
    this.usage,
    required this.name,
    required this.model,
    required this.isThirdPartyInsurance,
    required this.color,
    required this.year,
    required this.value,
    required this.registrationNumber,
    required this.engineNumber,
    required this.chassisNumber,
    required this.distanceCovered,
    required this.amountBilled,
    required this.minimumPayablePremiumAmount,
    this.engineCapacity,
    required this.frontView,
    required this.sideView,
    required this.backView,
    required this.driversLicense,
    required this.topView,
    this.insuranceCertificate,
    this.modeOfInsurance,
    required this.thirdPartyInsurance,
    this.proofOfOwnership,
    required this.userEntity,
    this.trips,
  });

  @override
  List<Object?> get props => [
        id,
        createdAt,
        typeOfVehicle,
        drivingYears,
        isDefault,
        isPassenger,
        ownership,
        aidRequired,
        otherAid,
        parking,
        involvedInAccident,
        securityForVehicle,
        bookedForTrafficOffense,
        usage,
        name,
        model,
        isThirdPartyInsurance,
        color,
        year,
        value,
        registrationNumber,
        engineNumber,
        chassisNumber,
        distanceCovered,
        amountBilled,
        minimumPayablePremiumAmount,
        engineCapacity,
        frontView,
        sideView,
        backView,
        driversLicense,
        topView,
        insuranceCertificate,
        modeOfInsurance,
        thirdPartyInsurance,
        proofOfOwnership,
        userEntity,
        trips,
      ];
}
