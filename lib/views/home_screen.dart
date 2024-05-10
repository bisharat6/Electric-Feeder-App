import 'package:electric_feeder/components/appColors.dart';
import 'package:electric_feeder/components/appassets.dart';
import 'package:electric_feeder/components/custom_top.dart';
import 'package:electric_feeder/views/day_night.dart';
import 'package:electric_feeder/views/feeder1_screen.dart';
import 'package:electric_feeder/views/scheduled.dart';
import 'package:electric_feeder/views/time_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool power = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffC9C9C9),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomBar(
            back: () {
              Get.to(HomeScreen());
            },
            not: () {
              Get.to(ScheduledFeederScreen());
            },
            show: true,
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Center(
              child: Text(
            "Feeder Details",
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.w700),
          )),
          SizedBox(
            height: Get.height * 0.04,
          ),
          // Container(
          //   height: Get.height * 0.11,
          //   width: Get.width * 0.9,
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(10),
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.grey.withOpacity(0.5), // Shadow color
          //         spreadRadius: 5, // Spread radius
          //         blurRadius: 7, // Blur radius
          //         offset: Offset(0, 3), // Offset from the top-left corner
          //       ),
          //     ],
          //   ),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       SizedBox(
          //         height: Get.height * 0.01,
          //       ),
          //       Center(
          //           child: Text(
          //         "Feeder 001",
          //         style: TextStyle(
          //             color: Colors.black,
          //             fontSize: 20,
          //             fontWeight: FontWeight.w700),
          //       )),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceAround,
          //         children: [
          //           Icon(
          //             Icons.wifi,
          //             size: 45,
          //             color: AppColors.primaryclr,
          //           ),
          //           Transform.rotate(
          //               angle: 1.55,
          //               child: Icon(Icons.battery_full_outlined,
          //                   size: 50, color: AppColors.primaryclr)),
          //           Icon(Icons.calendar_month,
          //               size: 45, color: AppColors.primaryclr),
          //           Icon(Icons.arrow_forward_ios,
          //               size: 35, color: AppColors.primaryclr)
          //         ],
          //       )
          //     ],
          //   ),
          // ),
          // SizedBox(
          //   height: Get.height * 0.02,
          // ),
          GestureDetector(
            onTap: () {
              Get.to(Home(), arguments: 'Feeder1');
            },
            child: Container(
              height: Get.height * 0.11,
              width: Get.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 5, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: Offset(0, 3), // Offset from the top-left corner
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Center(
                      child: Text(
                    "Feeder 001",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.wifi,
                        size: 45,
                        color: AppColors.primaryclr,
                      ),
                      Transform.rotate(
                          angle: 1.55,
                          child: Icon(Icons.battery_full_outlined,
                              size: 50, color: AppColors.primaryclr)),
                      Icon(Icons.calendar_month,
                          size: 45, color: AppColors.primaryclr),
                      Icon(Icons.arrow_forward_ios,
                          size: 35, color: AppColors.primaryclr)
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          GestureDetector(
            onTap: () {
              Get.to(Home(), arguments: 'Feeder2');
            },
            child: Container(
              height: Get.height * 0.11,
              width: Get.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 5, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: Offset(0, 3), // Offset from the top-left corner
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Center(
                      child: Text(
                    "Feeder 002",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.wifi,
                        size: 45,
                        color: AppColors.primaryclr,
                      ),
                      Transform.rotate(
                          angle: 1.55,
                          child: Icon(Icons.battery_full_outlined,
                              size: 50, color: AppColors.primaryclr)),
                      Icon(Icons.calendar_month,
                          size: 45, color: AppColors.primaryclr),
                      Icon(Icons.arrow_forward_ios,
                          size: 35, color: AppColors.primaryclr)
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          GestureDetector(
            onTap: () {
              Get.to(Home(), arguments: 'Feeder3');
            },
            child: Container(
              height: Get.height * 0.11,
              width: Get.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 5, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: Offset(0, 3), // Offset from the top-left corner
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Center(
                      child: Text(
                    "Feeder 003",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.wifi,
                        size: 45,
                        color: AppColors.primaryclr,
                      ),
                      Transform.rotate(
                          angle: 1.55,
                          child: Icon(Icons.battery_full_outlined,
                              size: 50, color: AppColors.primaryclr)),
                      Icon(Icons.calendar_month,
                          size: 45, color: AppColors.primaryclr),
                      Icon(Icons.arrow_forward_ios,
                          size: 35, color: AppColors.primaryclr)
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),

          GestureDetector(
            onTap: () {
              Get.to(Home(), arguments: 'Feeder4');
            },
            child: Container(
              height: Get.height * 0.11,
              width: Get.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 5, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: Offset(0, 3), // Offset from the top-left corner
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Center(
                      child: Text(
                    "Feeder 004",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.wifi,
                        size: 45,
                        color: AppColors.primaryclr,
                      ),
                      Transform.rotate(
                          angle: 1.55,
                          child: Icon(Icons.battery_full_outlined,
                              size: 50, color: AppColors.primaryclr)),
                      Icon(Icons.calendar_month,
                          size: 45, color: AppColors.primaryclr),
                      Icon(Icons.arrow_forward_ios,
                          size: 35, color: AppColors.primaryclr)
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          // Container(
          //   height: Get.height * 0.11,
          //   width: Get.width * 0.9,
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(10),
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.grey.withOpacity(0.5), // Shadow color
          //         spreadRadius: 5, // Spread radius
          //         blurRadius: 7, // Blur radius
          //         offset: Offset(0, 3), // Offset from the top-left corner
          //       ),
          //     ],
          //   ),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       SizedBox(
          //         height: Get.height * 0.01,
          //       ),
          //       Center(
          //           child: Text(
          //         "Feeder 004",
          //         style: TextStyle(
          //             color: Colors.black,
          //             fontSize: 20,
          //             fontWeight: FontWeight.w700),
          //       )),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceAround,
          //         children: [
          //           Icon(
          //             Icons.wifi,
          //             size: 45,
          //             color: AppColors.primaryclr,
          //           ),
          //           Transform.rotate(
          //               angle: 1.55,
          //               child: Icon(Icons.battery_full_outlined,
          //                   size: 50, color: AppColors.primaryclr)),
          //           Icon(Icons.calendar_month,
          //               size: 45, color: AppColors.primaryclr),
          //           Icon(Icons.arrow_forward_ios,
          //               size: 35, color: AppColors.primaryclr)
          //         ],
          //       )
          //     ],
          //   ),
          // ),
          // SizedBox(
          //   height: Get.height * 0.05,
          // ),
          power
              ? GestureDetector(
                  onTap: () {
                    Get.to(Home());
                    setState(() {
                      power = false;
                    });
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(appAssets.power),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      power = true;
                    });
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(appAssets.poweroff),
                  ),
                )
        ],
      ),
    );
  }
}
