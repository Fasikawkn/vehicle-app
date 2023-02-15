import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:vehicle_app/app/data/cars.dart';
import 'package:vehicle_app/app/models/page_state.dart';
import 'package:vehicle_app/app/models/vehicle.dart';

class VehicleProvider extends ChangeNotifier {
  VehicleProvider() {
    getVehicles();
  }
  // Initialize firestore
  FirebaseFirestore vehiclesInstance = FirebaseFirestore.instance;

  // the page state[initial, loading, success, error]
  PageState _pageState = PageState.initial;
  PageState get pageState => _pageState;
  set pageState(PageState value) {
    _pageState = value;
    notifyListeners();
  }

  // Vehicles data
  List<VehicleModel> _vehicles = [];
  List<VehicleModel> get vehicles => _vehicles;
  set vehicles(List<VehicleModel> value) {
    _vehicles = value;
    notifyListeners();
  }

  Future<void> getVehicles() async {
    try {
      pageState = PageState.loading;
      final response =
          await vehiclesInstance.collection('vehicle_col').doc('vehicles').get();
      vehicles = (response.data()!['data'] as List)
          .map((vehicleJson) => VehicleModel.fromJson(vehicleJson))
          .toList();
      pageState = PageState.success;
    } catch (e) {
      debugPrint(e.toString());
      pageState = PageState.error;
    }
  }
}
