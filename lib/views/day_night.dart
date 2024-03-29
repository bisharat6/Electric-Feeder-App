import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:electric_feeder/components/appColors.dart';
import 'package:electric_feeder/components/custom_top.dart';
import 'package:electric_feeder/views/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Time _time = Time(hour: 11, minute: 30, second: 20);
  bool iosStyle = true;
  late DateTime _selectedValue=DateTime.now();
  String _selectedOption = '30 sec';

  void onTimeChanged(Time newTime) {
    setState(() {
      _time = newTime;
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
            CustomBar(back: (){Get.to(HomeScreen());}, not:(){Get.to(HomeScreen());}),
        SizedBox(height: Get.height*0.01,),
        Center(child: Text("Schedule Feeder 001",style: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.w700
          ),)),
          SizedBox(height: Get.height*0.01,),
            SizedBox(height: Get.height*0.115,
              child: Padding(
                padding: const EdgeInsets.only(left: 5,right: 5),
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
              height: Get.height*0.425,
              
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
              okText:"save time",
              okStyle: TextStyle(color: AppColors.primaryclr)
            
            ),
            Center(
              child: SizedBox(
                height: Get.height*0.035,
                width: Get.width*0.65,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Duration",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                    DropdownButton<String>(
                        value: _selectedOption,
                        onChanged: (String? newValue) {
                          setState(() {
                _selectedOption = newValue!;
                          });
                        },
                        items: <String>['30 sec', '60 sec',"1 min"].map((String value) {
                          return DropdownMenuItem<String>(
                value: value,
                child: Center(child: Text(value,style: TextStyle(color: AppColors.primaryclr,fontWeight: FontWeight.w600,fontSize: 22),)),
                          );
                        }).toList(),
                      ),
                      
                ],),
              ),
            ),
            Center(
              child: SizedBox(
                 height: Get.height*0.035,
                width: Get.width*0.65,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      // _selectedValue != null ? 
                          'Selected Date:',
                          //  ${_selectedValue.day}/${_selectedValue.month}/${_selectedValue.year}'
                          // : 'Select a date',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700)
                    ),
                    Text("${_selectedValue.day}/${_selectedValue.month}/${_selectedValue.year}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: AppColors.primaryclr),)
                  ],
                ),
              ),
            ),
            SizedBox(
                height: Get.height*0.035,
                width: Get.width*0.65,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Selected Time: ",
                   
                    textAlign: TextAlign.center,
                    
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700)
                  ),
                  Text("${_time.hour}:${_time.minute} ${_time.period.name}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: AppColors.primaryclr),)
                ],
              ),
            ),
            SizedBox(height: Get.height*0.03,),
            InkWell(
                onTap: null,
                child: Container(
                  height: Get.height*0.05,
                  width: Get.width*0.38,
                  decoration: BoxDecoration(
                    color: AppColors.primaryclr,
                    borderRadius: BorderRadius.circular(10)
                    
                  ),
                  child: Center(child: Text("Save",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 1.1),)),
               
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