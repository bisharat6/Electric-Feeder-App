import 'package:electric_feeder/components/custom_top.dart';
import 'package:electric_feeder/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  late TimeOfDay _selectedTime;
  late DateTime _selectedDate;
  String _selectedOption = '30 sec';

  @override
  void initState() {
    super.initState();
    _selectedTime = TimeOfDay.now();
    _selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
           CustomBar(back: (){Get.to(HomeScreen());}, not:(){Get.to(HomeScreen());}),
          SizedBox(height: Get.height*0.01,),
          Center(child: Text("Schedule Feeder 001",style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w700
            ),)),
            DropdownButton<String>(
          value: _selectedOption,
          onChanged: (String? newValue) {
            setState(() {
              _selectedOption = newValue!;
            });
          },
          items: <String>['30 sec', '60 sec'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
          ElevatedButton(
            onPressed: () {
              _showDatePickerOnStartup();
            },
            child: Text('Select Date'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _showTimePickerOnStartup();
            },
            child: Text('Select Time'),
          ),
          SizedBox(height: 20),
          Text(
            'Selected Date: ${_selectedDate.toString()}',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Text(
            'Selected Time: ${_selectedTime.format(context)}',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Future<void> _showDatePickerOnStartup() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _showTimePickerOnStartup() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }
}