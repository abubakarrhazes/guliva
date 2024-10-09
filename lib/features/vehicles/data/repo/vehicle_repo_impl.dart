import 'package:dartz/dartz.dart';
import 'package:guliva/core/error/failures.dart';
import 'package:guliva/core/network/network_info.dart';
import 'package:guliva/features/auth/data/source/local/auth_local_source.dart';
import 'package:guliva/features/vehicles/data/source/local/vehicle_local_source.dart';
import 'package:guliva/features/vehicles/data/source/remote/vehicle_remote_source.dart';
import 'package:guliva/features/vehicles/domain/entities/vehicle_entity.dart';
import 'package:guliva/features/vehicles/domain/repo/vehicle_repo.dart';
import 'package:guliva/features/vehicles/domain/usecase/create_vehicle_usecase.dart';

class VehicleRepoImpl implements VehicleRepo {
  final VehicleRemoteSource vehicleRemoteSource;
  final VehicleLocalSource vehicleLocalSource;
  final AuthLocalSource authLocalSource;
  final NetworkInfo networkInfo;

  VehicleRepoImpl(
      {required this.vehicleRemoteSource,
      required this.vehicleLocalSource,
      required this.authLocalSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, VehicleEntity>> createVehicle(VehicleParams params) {
    // TODO: implement createVehicle
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<VehicleEntity>>> getAllVehicle() async {
    if (await networkInfo.isConnected) {
      if (await authLocalSource.isTokenAvailable()) {
        try {
          final String token = await authLocalSource.getToken();
          print(token);
          final remoteProduct = await vehicleRemoteSource.getAllVehicles(
            token,
          );
          return Right(remoteProduct);
        } on Failure catch (failure) {
          return Left(failure);
        }
      } else {
        return Left(AuthenticationFailure(message: 'Auth Error'));
      }
    } else {
      return Left(NetworkFailure(message: 'Network Failure'));
    }
  }

  @override
  Future<Either<Failure, VehicleEntity>> getAllVehicleById() {
    // TODO: implement getAllVehicleById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<VehicleEntity>>> getCachedVehicle() {
    // TODO: implement getCachedVehicle
    throw UnimplementedError();
  }
}
