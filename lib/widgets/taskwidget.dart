import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  final String text;
  final Color color;
  const TaskWidget({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.sizeOf(context).height/14,
      decoration: BoxDecoration(
        color: Color(0xFFeff0f8),
        borderRadius: BorderRadius.circular(0),

      ),
      child:Center (
        child: Text(text,style:TextStyle(color: color,fontSize: 20,
        
        )),
      ),
    );
  }
}