import 'package:flutter/material.dart';
import 'package:todoflutterandgo/Controllers/data_controler.dart';
import 'package:todoflutterandgo/screens/add_task.dart';
import 'package:todoflutterandgo/screens/all_task.dart';
import 'package:todoflutterandgo/screens/homeScreen.dart';
import 'package:get/get.dart';
void main () {
   Get.lazyPut(()=>DataControler());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  loadData() async{
    print("Hi");
     await Get.find<DataControler>().getData();

  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
   
    return GetMaterialApp(  
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
      ),
      home:const HomeScreen(),
    );
  }
}

