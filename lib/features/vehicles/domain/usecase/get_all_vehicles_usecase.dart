import 'package:dartz/dartz.dart';
import 'package:guliva/core/error/failures.dart';
import 'package:guliva/core/usecases/usecase.dart';
import 'package:guliva/features/vehicles/domain/entities/vehicle_entity.dart';
import 'package:guliva/features/vehicles/domain/repo/vehicle_repo.dart';

class GetAllVehiclesUsecase implements UseCase<List<VehicleEntity>, NoParams> {
  final VehicleRepo vehicleRepo;

  GetAllVehiclesUsecase(this.vehicleRepo);

  @override
  Future<Either<Failure, List<VehicleEntity>>> call(NoParams params) async {
    return await vehicleRepo.getAllVehicle();
  }
}
