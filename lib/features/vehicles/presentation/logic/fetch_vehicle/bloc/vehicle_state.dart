part of 'vehicle_bloc.dart';

abstract class VehicleState extends Equatable {}

class VehicleInitial extends VehicleState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class VehicleLoading extends VehicleState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class VehicleSuccess extends VehicleState {
  final List<VehicleEntity> vehicle;
  

  VehicleSuccess(this.vehicle);

  @override
  // TODO: implement props
  List<Object?> get props => [vehicle];
}

class VehicleFetchFail extends VehicleState {
  final Failure failure;
  VehicleFetchFail(this.failure);
  @override
  List<Object> get props => [failure];
}
