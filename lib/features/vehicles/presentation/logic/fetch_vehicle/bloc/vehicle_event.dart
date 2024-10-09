part of 'vehicle_bloc.dart';

@immutable
abstract class VehicleEvent {}

class GetAllVehicle extends VehicleEvent {}

class CheckVehicle extends VehicleEvent {}
