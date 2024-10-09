import 'package:dartz/dartz.dart';
import 'package:guliva/core/error/failures.dart';
import 'package:guliva/core/usecases/usecase.dart';
import 'package:guliva/features/vehicles/domain/entities/vehicle_entity.dart';
import 'package:guliva/features/vehicles/domain/repo/vehicle_repo.dart';

class CreateVehicleUsecase implements UseCase<VehicleEntity, VehicleParams> {
  final VehicleRepo vehicleRepo;

  CreateVehicleUsecase({required this.vehicleRepo});

  @override
  Future<Either<Failure, VehicleEntity>> call(VehicleParams params) async {
    return await vehicleRepo.createVehicle(params);
  }
}

class VehicleParams {
  final int id; // Required field
  final String typeOfVehicle;
  final bool setAsDefaultCar; // Changed from String to bool
  final String engineNumber;
  final String chassisNumber;
  final int value;
  final bool isPassenger; // Changed from String to bool
  final String vehicleName; // Renamed from name to vehicleName
  final String model;
  final String color;
  final String registrationNumber;
  final String year;
  final int? drivingYears; // Nullable
  final String? ownership; // Nullable
  final String? aidRequired; // Nullable
  final String? otherAid; // Nullable
  final String? parking; // Nullable
  final String? involvedInAccident; // Nullable
  final String? securityForVehicle; // Nullable
  final String? bookedForTrafficOffense; // Nullable
  final String? usage; // Nullable
  final String? modeOfInsurance; // Nullable
  final String sideView; // File path or URL
  final String topView; // File path or URL
  final String driversLicense; // File path or URL
  final String thirdPartyInsurance; // File path or URL
  final String frontView; // File path or URL
  final String backView; // File path or URL

  VehicleParams({
    required this.id,
    required this.typeOfVehicle,
    required this.setAsDefaultCar,
    required this.engineNumber,
    required this.chassisNumber,
    required this.value,
    required this.isPassenger,
    required this.vehicleName,
    required this.model,
    required this.color,
    required this.registrationNumber,
    required this.year,
    this.drivingYears,
    this.ownership,
    this.aidRequired,
    this.otherAid,
    this.parking,
    this.involvedInAccident,
    this.securityForVehicle,
    this.bookedForTrafficOffense,
    this.usage,
    this.modeOfInsurance,
    required this.sideView,
    required this.topView,
    required this.driversLicense,
    required this.thirdPartyInsurance,
    required this.frontView,
    required this.backView,
  });
}
