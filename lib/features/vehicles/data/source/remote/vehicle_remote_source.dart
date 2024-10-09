import 'dart:convert';

import 'package:guliva/core/constants/app_strings.dart';
import 'package:guliva/core/error/failures.dart';
import 'package:guliva/features/vehicles/data/models/vehicle_model.dart';
import 'package:guliva/features/vehicles/domain/usecase/create_vehicle_usecase.dart';
import 'package:http/http.dart' as http;

abstract class VehicleRemoteSource {
  Future<VehicleModel> createVehicle(
      VehicleParams params, String token, String id);
  Future<List<VehicleModel>> getAllVehicles(String token);
}

class VehicleRemoteImpl implements VehicleRemoteSource {
  final http.Client client;

  VehicleRemoteImpl({required this.client});
  @override
  Future<VehicleModel> createVehicle(
      VehicleParams params, String token, String id) {
    // TODO: implement createVehicle
    throw UnimplementedError();
  }

  @override
  Future<List<VehicleModel>> getAllVehicles(String token) async {
    final response = await client.get(
      Uri.parse('${AppStrings.baseUrl}/vehicle/all/id/2'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      final List<dynamic> vehicleList = jsonResponse['data'];
      print(vehicleList);
      return vehicleList
          .map((vehicle) => VehicleModel.fromJson(vehicle))
          .toList();
    } else {
      throw ServerFailure(message: 'SERVER FAILURE TRY AGAIN');
    }
  }
}
