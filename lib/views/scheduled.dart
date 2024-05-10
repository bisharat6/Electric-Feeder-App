import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:electric_feeder/components/appColors.dart';
import 'package:electric_feeder/components/custom_top.dart';
import 'package:electric_feeder/views/home_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/firebase_database.dart';

class ScheduledFeederScreen extends StatefulWidget {
  const ScheduledFeederScreen({Key? key}) : super(key: key);

  @override
  State<ScheduledFeederScreen> createState() => _ScheduledFeederScreenState();
}

class _ScheduledFeederScreenState extends State<ScheduledFeederScreen> {
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.reference();

  List<Map<String, dynamic>> _dataList = [];
  int lengthOfDataList = 0;
  List<bool> _toggleValues = List.generate(100, (index) => false);

  @override
  void initState() {
    super.initState();
    _retrieveDataFromFirebase();
  }

  // void updateFirebaseData(bool newValue) {
  //   DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
  //   // Define the path to the data you want to update
  //   String path = '/Feeder1';
  //   // Update the data based on the switch state
  //   databaseReference.child(path).child(newValue ? 'on' : 'off');
  // }
  var feeder_name = '';

  void updateFirebaseData(bool newValue) {
    DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
    String path = '/$feeder_name';

    // Define the data to update based on the switch state
    Map<String, dynamic> updateData = {
      'relay': newValue ? 'on' : 'off',
      'response': newValue ? 'active' : 'deactive'
    };

    // Update the data in Firebase
    databaseReference.child(path).update(updateData);
  }

  // void _deleteItem(String key) {
  //   _databaseReference.child('/feeder/$key').remove();
  // }

  // void _retrieveDataFromFirebase() {
  //   _databaseReference.child('/feeder').once().then((DatabaseEvent event) {
  //     if (event.snapshot.value != null) {
  //       Map<dynamic, dynamic>? data =
  //           event.snapshot.value as Map<dynamic, dynamic>?;
  //       if (data != null) {
  //         List<Map<String, dynamic>> dataList = [];
  //         data.forEach((key, value) {
  //           dataList.add(Map<String, dynamic>.from(value));
  //         });
  //         setState(() {
  //           _dataList = dataList;
  //         });
  //       }
  //     }
  //   });
  // }
  void _retrieveDataFromFirebase() {
    _databaseReference.child('/feeder').once().then((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        Map<dynamic, dynamic>? data =
            event.snapshot.value as Map<dynamic, dynamic>?;
        if (data != null) {
          List<Map<String, dynamic>> dataList = [];
          data.forEach((key, value) {
            Map<String, dynamic> item = Map<String, dynamic>.from(value);
            item['key'] = key; // Include the key in the item data
            dataList.add(item);
          });
          setState(() {
            _dataList = dataList;
          });
        }
      }
    });
  }

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
          ),
          SizedBox(height: Get.height * 0.01),
          Center(
            child: Text(
              "Feeder Remaining",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: Get.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  // Add onTap functionality
                },
                child: Container(
                  height: Get.height * 0.05,
                  width: Get.width * 0.38,
                  decoration: BoxDecoration(
                    color: AppColors.primaryclr,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Schedule",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // Add onTap functionality
                },
                child: Container(
                  height: Get.height * 0.05,
                  width: Get.width * 0.38,
                  decoration: BoxDecoration(
                    color: AppColors.primaryclr,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Now",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _dataList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
                  child: Container(
                    height: Get.height * 0.085,
                    width: Get.width * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          _dataList[index]['feeder_name'] ?? 'N/A',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: _dataList[index]['isActive'] == true
                                ? AppColors.primaryclr
                                : Colors.grey,
                          ),
                        ),
                        Text(
                          _dataList[index]['time'] ?? 'N/A',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: _dataList[index]['isActive'] == true
                                ? AppColors.primaryclr
                                : Colors.grey,
                          ),
                        ),
                        Text(
                          _dataList[index]['durations'] ?? 'N/A',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: _dataList[index]['status'] == true
                                ? AppColors.primaryclr
                                : Colors.grey,
                          ),
                        ),
                        // Text(
                        //   _dataList[index]['date'] ?? 'N/A',
                        //   style: TextStyle(
                        //     fontSize: 20,
                        //     fontWeight: FontWeight.w500,
                        //     color: _dataList[index]['status'] == true
                        //         ? AppColors.primaryclr
                        //         : Colors.grey,
                        //   ),
                        // ),
                        //                       Transform.scale(
                        //                         scale: 0.7,
                        //                         child: Switch(
                        //                           activeColor: AppColors.primaryclr,
                        //                           value: _toggleValues[index],
                        //                           // onChanged: (value) {
                        //                           //   setState(() {
                        //                           //     // _toggleValues[index] = value;
                        //                           //     // _deleteItem('$index');
                        //                           //     // print('how key $index');

                        //                           //     _toggleValues[index] = value;
                        //                           //     if (value) {
                        //                           //       _deleteItem(_dataList[1][
                        //                           //           value]); // Assuming 'key' is the field containing the Firebase key
                        //                           //     }
                        //                           //   });
                        //                           // },

                        // onChanged: (newValue) {
                        //   setState(() {
                        //    _toggleValues = newValue;
                        //   });
                        //   // Update Firebase database based on newValue
                        //   updateFirebaseData(newValue);
                        // },
                        //                           // onChanged: (value) {
                        //                           //   setState(() {
                        //                           //     _toggleValues[index] = value;
                        //                           //     if (value) {
                        //                           //       String? itemKey = _dataList[index]['key'];
                        //                           //       if (itemKey != null) {
                        //                           //         _deleteItem(itemKey);
                        //                           //       } else {
                        //                           //         print('Error: Item key is null.');
                        //                           //       }
                        //                           //     }
                        //                           //   });
                        //                           // },
                        //                         ),
                        //                       ),

                        Transform.scale(
                          scale: 0.7,
                          child: Switch(
                            activeColor: AppColors.primaryclr,
                            value: _toggleValues[index],
                            onChanged: (value) {
                              setState(() {
                                _toggleValues[index] = value;
                                feeder_name = _dataList[index]['feeder_name'];
                              });

                              showDialog(
                                context: context,
                                barrierDismissible:
                                    false, // Prevent user from dismissing
                                builder: (BuildContext context) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              );

                              Future.delayed(Duration(seconds: 7), () {
                                // Update Firebase data
                                updateFirebaseData(value);

                                // Hide loader after update process completes
                                Navigator.of(context).pop(); // Close the dialog
                              });

                              // Pass the index and the new value
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
