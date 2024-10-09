import 'dart:convert';

import 'package:guliva/core/error/failures.dart';
import 'package:guliva/features/vehicles/data/models/vehicle_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class VehicleLocalSource {
  Future<List<VehicleModel>> getOrders();
 
  Future<void> clearOrder();
}

const cachedOrders = 'CACHED_ORDERS';

class VehicleLocalSourceImpl implements VehicleLocalSource {
  final SharedPreferences sharedPreferences;

  VehicleLocalSourceImpl({required this.sharedPreferences});
  @override
  Future<void> clearOrder() {
    // TODO: implement clearOrder
    throw UnimplementedError();
  }

  @override
  Future<List<VehicleModel>> getOrders() {
    final jsonString = sharedPreferences.getString(cachedOrders);

    if (jsonString != null) {
      return Future.value(vehicleModelListFromJson(jsonString));
    } else {
      throw CacheFailure(message: 'Cache Failure');
    }
  }

  
}
