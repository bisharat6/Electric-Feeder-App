import 'package:electric_feeder/views/day_night.dart';
import 'package:electric_feeder/views/splash_screen.dart';
import 'package:electric_feeder/views/time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
Future<void> main() async {

   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
     
      home: SplashScreen(),
    );
  }
}

