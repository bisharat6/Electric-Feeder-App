import 'package:electric_feeder/components/custom_top.dart';
import 'package:electric_feeder/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Feeder1Screen1 extends StatefulWidget {
  const Feeder1Screen1({super.key});

  @override
  State<Feeder1Screen1> createState() => _Feeder1Screen1State();
}

class _Feeder1Screen1State extends State<Feeder1Screen1> {
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedTime = TimeOfDay.now();
    _showTimePicker();
  }

  Future<void> _showTimePicker() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
      print('Time selected: ${pickedTime.format(context)}');
    }
  }

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomBar(back: (){Get.to(HomeScreen());}, not:(){Get.to(HomeScreen());}),
          SizedBox(height: Get.height*0.01,),
          Center(child: Text("Schedule Feeder 001",style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w700
            ),)),
         
            
        ],
      ),
    );
  }
  
}