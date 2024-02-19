import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todoflutterandgo/colors/app_colors.dart';
import 'package:todoflutterandgo/widgets/buttons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left:20,right: 20),
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(
                    text: "Hello",
                    style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                    children: [TextSpan(
                      text: "\nStart your beautiful day",
                      style: TextStyle(
                        color: AppColors.smallTextColor,
                        fontSize: 14,
                        

                      ),
                      )
                    
                    
                    
                    ]
                    ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/2.5,),
          ButtonWIdget(backgroundcolor: AppColors.mainColor, text:"Add Task", textColor: Colors.white),
          SizedBox(height: 20),
           ButtonWIdget(backgroundcolor: Colors.white, text:"View All", textColor: AppColors.smallTextColor),
         
         // 
         ],
        ),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/welcome.jpg"))),
      ),
    );
  }
}
