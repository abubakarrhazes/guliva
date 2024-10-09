import 'package:equatable/equatable.dart';

class Trip extends Equatable {
  final int id;
  final String createdAt;
  final String startTime;
  final String endTime;
  final String insuranceType;
  final String tripStatus;
  final double insuranceCost;
  final double distanceCovered;
  final String startAddress;
  final String? state; // Nullable
  final String destinaationAddress; // Fixed typo "destinaationAddress"
  final String? frontView; // Nullable
  final String? backView; // Nullable
  final bool isTripStarted;
  final String? polyLineCoordinates; // Nullable
  final String? initialLocationData; // Nullable
  final String? sourceLocationData; // Nullable
  final String? licensePlate; // Nullable
  final bool paid;
  final bool withCard;
  final bool asDriver;
  final bool asPassenger;
  final double amountPayable;
  final double billingRate;

  Trip({
    required this.id,
    required this.createdAt,
    required this.startTime,
    required this.endTime,
    required this.insuranceType,
    required this.tripStatus,
    required this.insuranceCost,
    required this.distanceCovered,
    required this.startAddress,
    this.state,
    required this.destinaationAddress,
    this.frontView,
    this.backView,
    required this.isTripStarted,
    this.polyLineCoordinates,
    this.initialLocationData,
    this.sourceLocationData,
    this.licensePlate,
    required this.paid,
    required this.withCard,
    required this.asDriver,
    required this.asPassenger,
    required this.amountPayable,
    required this.billingRate,
  });

  // Convert the Trip instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt,
      'startTime': startTime,
      'endTime': endTime,
      'insuranceType': insuranceType,
      'tripStatus': tripStatus,
      'insuranceCost': insuranceCost,
      'distanceCovered': distanceCovered,
      'startAddress': startAddress,
      'state': state,
      'destinaationAddress': destinaationAddress,
      'frontView': frontView,
      'backView': backView,
      'isTripStarted': isTripStarted,
      'polyLineCoordinates': polyLineCoordinates,
      'initialLocationData': initialLocationData,
      'sourceLocationData': sourceLocationData,
      'licensePlate': licensePlate,
      'paid': paid,
      'withCard': withCard,
      'asDriver': asDriver,
      'asPassenger': asPassenger,
      'amountPayable': amountPayable,
      'billingRate': billingRate,
    };
  }

  @override
  List<Object?> get props => [
        id,
        createdAt,
        startTime,
        endTime,
        insuranceType,
        tripStatus,
        insuranceCost,
        distanceCovered,
        startAddress,
        state,
        destinaationAddress,
        frontView,
        backView,
        isTripStarted,
        polyLineCoordinates,
        initialLocationData,
        sourceLocationData,
        licensePlate,
        paid,
        withCard,
        asDriver,
        asPassenger,
        amountPayable,
        billingRate,
      ];
}
