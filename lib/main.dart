import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_app/app/app.dart';
import 'package:vehicle_app/app/provider/vehicle_provider.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();

  runApp(
    ChangeNotifierProvider(
      create:(_)=> VehicleProvider(),
      child: const VehicleApp()),
  );
}
