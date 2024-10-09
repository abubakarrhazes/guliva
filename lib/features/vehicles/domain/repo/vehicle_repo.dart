import 'package:dartz/dartz.dart';
import 'package:guliva/core/error/failures.dart';
import 'package:guliva/features/vehicles/domain/entities/vehicle_entity.dart';
import 'package:guliva/features/vehicles/domain/usecase/create_vehicle_usecase.dart';

abstract class VehicleRepo {
  Future<Either<Failure, VehicleEntity>> createVehicle(VehicleParams params);
  Future<Either<Failure, List<VehicleEntity>>> getAllVehicle();
  Future<Either<Failure, List<VehicleEntity>>> getCachedVehicle();
  Future<Either<Failure, VehicleEntity>> getAllVehicleById();
}
