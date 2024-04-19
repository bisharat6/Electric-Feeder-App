import 'package:electric_feeder/components/appassets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CustomBar extends StatelessWidget {
  final bool show;
   final Function() back;
   final Function() not;

  
  const CustomBar({super.key,this.show=false,required this.back,required this.not});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height*0.13,
      width: Get.width*1,
      decoration: BoxDecoration(
        
        image: DecorationImage(image: AssetImage(appAssets.appbar),fit: BoxFit.cover)
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 17),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            show?SizedBox(width: Get.width*0.1,):GestureDetector(
              onTap: back,
              child: Container(
                height: Get.height*0.04,
                width: Get.width*0.1,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(appAssets.back),fit: BoxFit.cover)
                        
                ),
              
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                    height: Get.height*0.05,
                    width: Get.width*0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.white,
                        width: 2
                      )
                    ),
                    child: Center(child: Text("The Timer Plus",style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    
                    ),)),
                  ),
            ),
                GestureDetector(
                  onTap: not,
                  child: Icon(Icons.menu_rounded,color: Colors.white,size: 35,))

          
          
            ],
          ),
        ),
      ),

      
    );
  }
}