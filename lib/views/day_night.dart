import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:electric_feeder/components/appColors.dart';
import 'package:electric_feeder/components/custom_top.dart';
import 'package:electric_feeder/views/home_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _textController = TextEditingController();

  final DatabaseReference _database = FirebaseDatabase.instance.reference();
  String _data = 'Loading...';
  String _inputData = '';

  String durations = '';
  String date_sel = '';
  String time_sel = '';
  final feeder_name = Get.arguments;
  Time _time = Time(hour: 11, minute: 30, second: 20);
  bool iosStyle = true;

  late DateTime _selectedValue = DateTime.now();

  late String formattedDatenew = DateFormat('yy/MM/dd').format(_selectedValue);

  String _selectedOption = '30 sec';

  void onTimeChanged(Time newTime) {
    setState(() {
      var formattedTime =
          newTime.format(context); // Assuming you have access to the context
      print('Selected time: $formattedTime');
      time_sel = formattedTime; // Assign the formatted time string
      _time = newTime;
    });
  }

  // void onTimeChanged(Time newTime) {
  //   setState(() {
  //     _time = newTime;
  //   });
  // }

// void onTimeChanged(String formattedTime) {
//   setState(() {
//     // Split the formatted time string to obtain hour and minute parts
//     List<String> timeParts = formattedTime.split(':');
//     int hour = int.parse(timeParts[0]);
//     int minute = int.parse(timeParts[1]);

//     // Set the _time variable with the new Time object
//     _time = Time(hour, minute);
//   });
// }

// void time_sel() {
//   // Create a DateTime object representing a specific time
//   DateTime now = DateTime.now();

//   // Create a DateFormat object with a specific time pattern
//   DateFormat formatter = DateFormat('HH:mm');

//   // Format the DateTime object using the DateFormat
//   String formattedTime = formatter.format(now);

//   // Print the formatted time
//   print(formattedTime); // Output: e.g., 15:30
// }

  @override
  void initState() {
    super.initState();
    _database.child('message').onValue.listen((event) {
      // Handle data changes here
      if (event.snapshot.value != null) {
        setState(() {
          _data = event.snapshot.value.toString();
        });
      }
    });

    // // Set up listener for changes to the data
    // _database.child('message').onValue.listen((Event event) {
    //   if (event.snapshot.value != null) {
    //     setState(() {
    //       _data = event.snapshot.value.toString();
    //     });
    //   }
    // });
  }

  void updateDataInDatabase() {
    print('time now ' + time_sel);
    Map<String, dynamic> dataToUpdate = {
      'date': '$formattedDatenew',
      'time': '$time_sel',
      'feeder_name': '$feeder_name',
      'durations': '$_inputData',
      'status': ''
    };

    //   _database.child('feeder').set(dataToUpdate).then((_) {
    //     print('Data updated successfully!');
    //   }).catchError((error) {
    //     print('Failed to update data: $error');
    //   });
    // }

    _database.child('feeder').push().set(dataToUpdate).then((_) {
      print('Data updated successfully!');
    }).catchError((error) {
      print('Failed to update data: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffC9C9C9),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CustomBar(back: () {
              Get.to(HomeScreen());
            }, not: () {
              Get.to(HomeScreen());
            }),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Center(
                child: Text(
              "Schedule $feeder_name",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            )),
            SizedBox(
              height: Get.height * 0.01,
            ),
            SizedBox(
              height: Get.height * 0.115,
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: DatePicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: AppColors.primaryclr,
                  selectedTextColor: Colors.white,
                  onDateChange: (date) {
                    // New date selected
                    setState(() {
                      _selectedValue = date;
                    });
                  },
                ),
              ),
            ),

            // Render inline widget
            showPicker(
                isInlinePicker: true,
                height: Get.height * 0.425,
                accentColor: AppColors.primaryclr,
                elevation: 1,
                value: _time,
                onChange: onTimeChanged,
                minuteInterval: TimePickerInterval.FIVE,
                // iosStylePicker: iosStyle,
                minHour: 00,
                maxHour: 23,
                is24HrFormat: true,
                cancelText: " ",
                okText: "save time",
                okStyle: TextStyle(color: AppColors.primaryclr)),
            Center(
              child: SizedBox(
                height: Get.height * 0.035,
                width: Get.width * 0.65,
                // child: Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       "Duration",
                //       style:
                //           TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                //     ),
                //     TextField(
                //       decoration: InputDecoration(
                //         hintText: 'Enter your text here',
                //       ),
                //     ),
                //   ],
                // ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Duration",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: TextField(
                          controller: _textController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _inputData = value + 'Sec';
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: Get.height * 0.035,
                width: Get.width * 0.65,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        // _selectedValue != null ?
                        'Selected Date:',
                        //  ${_selectedValue.day}/${_selectedValue.month}/${_selectedValue.year}'
                        // : 'Select a date',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700)),
                    Text(
                      "${_selectedValue.day}/${_selectedValue.month}/${_selectedValue.year}",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryclr),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.035,
              width: Get.width * 0.65,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Selected Time: ",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                  Text(
                    "${_time.hour}:${_time.minute} ${_time.period.name}",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryclr),
                  )
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('$feeder_name'),
                      content: Text('Date = $formattedDatenew' +
                          '\nTime = $time_sel' +
                          '\nDurations = $_inputData'),
                      actions: <Widget>[
                        InkWell(
                          onTap: () {
                            // Perform your custom logic here
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Text('Cancel'),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            onTimeChanged(_time);
                            updateDataInDatabase();

                            Navigator.of(context).pop(); // Close the

                            final snackBar = SnackBar(
                              backgroundColor: Colors.blue,
                              content: Text('Feeder Added Sucessfully'),
                              duration: Duration(seconds: 5),

                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.only(
                                bottom: MediaQuery.of(context).size.height - 80,
                              ),
                              // Optional, set the duration
                              // action: SnackBarAction(
                              //   label: 'Undo',
                              //   onPressed: () {
                              //     // Perform some action here
                              //   },
                              // ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          child: Text('Sumitted'),
                        ),
                      ],
                    );
                  },
                );

                // onTimeChanged(_time);
                // updateDataInDatabase();
                // Call function to update data
              },
              child: Container(
                height: Get.height * 0.05,
                width: Get.width * 0.38,
                decoration: BoxDecoration(
                    color: AppColors.primaryclr,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  "Save",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.1),
                )),
              ),
            ),
            // Text(
            //   "IOS Style",
            //   style: Theme.of(context).textTheme.bodyLarge,
            // ),
            // Switch(
            //   value: iosStyle,
            //   onChanged: (newVal) {
            //     setState(() {
            //       iosStyle = newVal;
            //     });
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
