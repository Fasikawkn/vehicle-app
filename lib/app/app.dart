import 'package:flutter/material.dart';
import 'package:vehicle_app/app/pages/screens/homepage.dart';
import 'package:vehicle_app/app/utils/helpers.dart';

class VehicleApp extends StatelessWidget {
  const VehicleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: getMaterialColor(
          const Color(0xff312D43),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
    );
  }
}
