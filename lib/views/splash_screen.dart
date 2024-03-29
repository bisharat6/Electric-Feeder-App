import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:electric_feeder/components/appassets.dart';
import 'package:electric_feeder/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Get.offAll(HomeScreen());
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height:Get.height*1,
        width: Get.width*1,
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(image: AssetImage(appAssets.splashimg),fit: BoxFit.cover)

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: Get.height*0.09,
              width: Get.width*0.75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                border: Border.all(
                  color: Colors.white,
                  width: 2
                )
              ),
              child: Center(child: Text("The Timer Plus",style: TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2
              ),)),
            ),
            SizedBox(height: Get.height*0.02),
            Container(
              height: Get.height*0.1,
              width: Get.width*0.8,
           
              child: SpinKitWave(
          color: Colors.white, // Set the color of the wave
          size: 50.0, // Set the size of the wave
        ),
              
            )

          ],
        ),

      ),
    );
  }
}
