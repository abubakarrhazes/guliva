// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

part of 'fetch_vehicle_cubit.dart';

@immutable
abstract class FetchVehicleState {
  final List<VehicleEntity> vehicles;

  const FetchVehicleState(
    this.vehicles,
  );
}

class VehicleFecthInitial extends FetchVehicleState {
  const VehicleFecthInitial(super.vehicles);
}

class VehicleFetchLoading extends FetchVehicleState {
  const VehicleFetchLoading(super.vehicles);
}

class VehicleFetchSuccess extends FetchVehicleState {
  VehicleFetchSuccess(super.vehicles);
}

class VehicleFetchFail extends FetchVehicleState {
  const VehicleFetchFail(super.vehicles);
}
