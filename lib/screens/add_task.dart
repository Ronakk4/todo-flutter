import 'package:flutter/material.dart';
import 'package:todoflutterandgo/colors/app_colors.dart';
import 'package:todoflutterandgo/widgets/TextFieldWidget.dart';
import 'package:todoflutterandgo/widgets/buttons.dart';

class Addtask extends StatelessWidget {
  const Addtask({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController=TextEditingController();
    TextEditingController detailController=TextEditingController();
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: EdgeInsets.only(left: 10,top: 20,right:10),

        decoration: const BoxDecoration(
          image: DecorationImage(
            fit:BoxFit.cover,
             image:AssetImage("assets/addtask1.jpg"))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          children: [
          Column(
            children: [
              SizedBox(height: 16,),
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back),color: AppColors.secondaryColor,)

            ],
          ),
          Column(
            children: [
             TextFieldWidget(textFieldController: nameController, hintText:"Task name", borderRadius: 30,maxlines: 1,),
             SizedBox(height: 20,),
              TextFieldWidget(textFieldController: detailController, hintText:"Task details", borderRadius: 15,maxlines: 3),
              SizedBox(height: 20,),
            ButtonWIdget(backgroundcolor: AppColors.mainColor, text: "Add", textColor: Colors.white)
            ],
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height/6,),
        ],),




      ),



    );
  }
}