import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_app/app/models/page_state.dart';
import 'package:vehicle_app/app/pages/widgets/vehicle_card.dart';
import 'package:vehicle_app/app/provider/vehicle_provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vehicles'),
      ),
      body: Consumer<VehicleProvider>(
        builder: ((context, value, _) {
          final pageState = value.pageState;
          if (pageState == PageState.initial ||
              pageState == PageState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (pageState == PageState.success) {
            final vehicles = value.vehicles;
            if (vehicles.isEmpty) {
              return const Center(
                child: Text('No vehicle added yet!'),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
              itemCount: vehicles.length,
              itemBuilder: (context, index) => VehicleCard(
                vehcle: vehicles[index],
              ),
            );
          }
          return const Center(
            child: Text('Something went wrong!'),
          );
        }),
      ),
    );
  }
}
