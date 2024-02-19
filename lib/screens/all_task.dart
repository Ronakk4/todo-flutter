import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todoflutterandgo/colors/app_colors.dart';
import 'package:todoflutterandgo/widgets/taskwidget.dart';

class AllTask extends StatelessWidget {
  const AllTask({super.key});

  @override
  Widget build(BuildContext context) {
    List myData=[
      "try harder",
      "try harder",
    ];
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [

          Container(
            padding: const EdgeInsets.only(top :60,left: 20),
            alignment: Alignment.topLeft,
            child: Icon(Icons.arrow_back),
            width: double.maxFinite,
            height:MediaQuery.of(context).size.height/3.2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/header1.jpg"),
              ),
            ),

          ),
          Container(
            padding: EdgeInsets.only(left :20,right: 20),
            child: Row(
              children: [
                Icon(Icons.home,color: AppColors.secondaryColor,),
                SizedBox(width:20),
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.5),
                    color: Colors.black54,

                  ),
                  child: Icon(Icons.add,color: Colors.white,),
                ),
                 
                  Expanded(child: Container()),
                 Icon(Icons.calendar_month_sharp,color: AppColors.secondaryColor,),
                SizedBox(width:10),
                Text("2",style: TextStyle(
                  fontSize: 20,
                  color: AppColors.secondaryColor
                ),)

              ],
            ),
          ),
        Flexible(
          child: ListView.builder(
          itemCount:myData.length,
            
            itemBuilder: (context,index)
                 {
          return Dismissible(
            key: ObjectKey(index),
            onDismissed: (DismissDirection direction) =>{

            } ,
            confirmDismiss: (DismissDirection direction) async{
              return false;
            },
            child: Container(
              margin: const EdgeInsets.only(left:20,top:10,right: 20),
              child: TaskWidget(text:myData[index] ,color:Colors.blueGrey ,),
            
            ),
          );
                 } 
            
          ),
        ),
        
        
        
        
        
        ],
      ),
    );
  }
}
