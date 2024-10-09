import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:guliva/core/error/failures.dart';
import 'package:guliva/core/usecases/usecase.dart';
import 'package:guliva/features/vehicles/domain/entities/vehicle_entity.dart';
import 'package:guliva/features/vehicles/domain/usecase/get_all_vehicles_usecase.dart';
import 'package:guliva/features/vehicles/domain/usecase/get_cached_vehicle_usecase.dart';

part 'vehicle_event.dart';
part 'vehicle_state.dart';

class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  final GetAllVehiclesUsecase _getAllVehiclesUsecase;
  final GetCachedVehicleUsecase _getCachedVehicleUsecase;

  VehicleBloc(this._getAllVehiclesUsecase, this._getCachedVehicleUsecase)
      : super(VehicleInitial()) {
    on<GetAllVehicle>(_onGetAllVehicle);
    on<CheckVehicle>(_onCheckVehicle);
  }

  void _onGetAllVehicle(GetAllVehicle event, Emitter<VehicleState> emit) async {
    try {
      emit(VehicleLoading());
      final result = await _getAllVehiclesUsecase(NoParams());
      result.fold(
        (failure) => emit(VehicleFetchFail(failure)),
        (vehicle) => emit(
          VehicleSuccess(vehicle),
        ),
      );
    } catch (e) {
      emit(
        VehicleFetchFail(
          ExceptionFailure(message: 'Exception Failure'),
        ),
      );
    }
  }

  void _onCheckVehicle(CheckVehicle event, Emitter<VehicleState> emit) async {
    try {
      emit(VehicleLoading());
      final result = await _getCachedVehicleUsecase(NoParams());
      result.fold(
          (failure) => emit(VehicleFetchFail(failure)),
          (vehicle) => emit(
                VehicleSuccess(vehicle),
              ));
    } catch (e) {
      emit(
        VehicleFetchFail(
          ExceptionFailure(message: 'Exception Failure'),
        ),
      );
    }
  }
}
