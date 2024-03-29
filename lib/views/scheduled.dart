import 'package:electric_feeder/components/appColors.dart';
import 'package:electric_feeder/components/custom_top.dart';
import 'package:electric_feeder/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ScheduledFeederScreen extends StatefulWidget {
  const ScheduledFeederScreen({super.key});

  @override
  State<ScheduledFeederScreen> createState() => _ScheduledFeederScreenState();
}

class _ScheduledFeederScreenState extends State<ScheduledFeederScreen> {
  bool _toggleValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xffC9C9C9),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           CustomBar(back:(){Get.to(HomeScreen());}, not:(){Get.to(ScheduledFeederScreen());}),
            SizedBox(height: Get.height*0.01,),
          Center(child: Text("Feeder Remaining",style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w700
            ),)),
             SizedBox(height: Get.height*0.02,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 InkWell(
                  onTap: null,
                  child: Container(
                    height: Get.height*0.05,
                    width: Get.width*0.38,
                    decoration: BoxDecoration(
                      color: AppColors.primaryclr,
                      borderRadius: BorderRadius.circular(10)
                      
                    ),
                    child: Center(child: Text("Schedule",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 1.1),)),
                 
                  ),
                 ),
                 InkWell(
                  onTap: null,
                  child: Container(
                    height: Get.height*0.05,
                    width: Get.width*0.38,
                    decoration: BoxDecoration(
                      color: AppColors.primaryclr,
                      borderRadius: BorderRadius.circular(10)
                      
                    ),
                    child: Center(child: Text("Now",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 1.1),)),
                 
                  ),
                 ),
               ],
             ),
             SizedBox(height: Get.height*0.04,),
             Container(
              height: Get.height*0.085,
              width: Get.width*0.9,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Text("7:15",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: AppColors.primaryclr),),
                Text("10 sec",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: AppColors.primaryclr),),
                Text("mon",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: AppColors.primaryclr),),
                 Transform.scale(
                  scale: 0.7,
                  child: Switch(
                  
                    
                    
                    activeColor: AppColors.primaryclr,
                                value: _toggleValue,
                                onChanged: (value) {
                  setState(() {
                    _toggleValue = value;
                  });
                                },
                              ),
                ),
                
                 
                  
              
                ],
              ),
            ),
              SizedBox(height: Get.height*0.02,),
             Container(
              height: Get.height*0.085,
              width: Get.width*0.9,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Text("7:15",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: AppColors.primaryclr),),
                Text("10 sec",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: AppColors.primaryclr),),
                Text("mon",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: AppColors.primaryclr),),
              Transform.scale(
                  scale: 0.7,
                  child: Switch(
                  
                    
                    
                    activeColor: AppColors.primaryclr,
                                value: _toggleValue,
                                onChanged: (value) {
                  setState(() {
                    _toggleValue = value;
                  });
                                },
                              ),
                ),
                
                 
                  
              
                ],
              ),
            ),
             SizedBox(height: Get.height*0.02,),
 Container(
              height: Get.height*0.085,
              width: Get.width*0.9,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Text("7:15",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.grey),),
                Text("10 sec",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.grey),),
                Text("mon",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color:Colors.grey),),
                Transform.scale(
                  scale: 0.7,
                  child: Switch(
                  
                    
                    
                    activeColor: AppColors.primaryclr,
                                value: _toggleValue,
                                onChanged: (value) {
                  setState(() {
                    _toggleValue = value;
                  });
                                },
                              ),
                ),
                //  Icon(Icons.toggle_off,size: 45,color:Colors.grey),
                
                 
                  
              
                ],
              ),
            ),



        ],
      ),
    );
  }
}