import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:guliva/core/usecases/usecase.dart';
import 'package:guliva/features/auth/domain/usecase/get_cached_user_usecase.dart';
import 'package:guliva/features/vehicles/domain/entities/vehicle_entity.dart';
import 'package:guliva/features/vehicles/domain/usecase/get_all_vehicles_usecase.dart';
import 'package:guliva/features/vehicles/domain/usecase/get_cached_vehicle_usecase.dart';

part 'fetch_vehicle_state.dart';

class FetchVehicleCubit extends Cubit<FetchVehicleState> {
  final GetAllVehiclesUsecase _getAllVehiclesUsecase;
  final GetCachedVehicleUsecase _getCachedVehicleUsecase;
  FetchVehicleCubit(this._getAllVehiclesUsecase, this._getCachedVehicleUsecase)
      : super(const VehicleFecthInitial([]));

  void getVehicles() async {
    try {
      emit(VehicleFetchLoading(state.vehicles));
      final cachedResult = await _getCachedVehicleUsecase(NoParams());
      cachedResult.fold(
        (failure) => (),
        (vehicles) => emit(VehicleFetchSuccess(vehicles)),
      );
      final remoteResult = await _getAllVehiclesUsecase(NoParams());
      remoteResult.fold(
        (failure) => emit(VehicleFetchFail(state.vehicles)),
        (vehicles) => emit(VehicleFetchSuccess(vehicles)),
      );
    } catch (e) {
      emit(VehicleFetchFail(state.vehicles));
    }
  }
}
