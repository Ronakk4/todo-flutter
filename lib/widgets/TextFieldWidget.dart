import 'package:flutter/material.dart';
import 'package:todoflutterandgo/colors/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textFieldController;
  final String hintText;
  final double borderRadius;
  final int? maxlines;

  const TextFieldWidget({super.key, required this.textFieldController, required this.hintText, required this.borderRadius, this.maxlines=1});

  @override
  Widget build(BuildContext context) {
    return  TextField(maxLines: maxlines,
              controller: textFieldController,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.textHolder,
                hintText: hintText,
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 1,

                )
                ),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 1,

                )
                ),
               ),
               );
  }
}