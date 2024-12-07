
import 'package:flutter/material.dart';

import '../../../../core/themes/app_colors.dart';

Widget reusableButton ({
  required VoidCallback func,
  required  String text ,
  required Color color,
  required Color gradientColor1,
  required Color gradientColor2
}){
  return Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
            colors: [
              gradientColor1,
              gradientColor2,
            ])
    ),
    child: ElevatedButton(
      onPressed: func,
      style: ElevatedButton.styleFrom(
          shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: const Size(390, 50),
          backgroundColor: AppColors.transparent,
          shadowColor: AppColors.transparent
      ),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 20,
            color: color,
            fontWeight: FontWeight.bold
        ),
      ),
    ),
  );
}

Widget text ({String? boldText,FontWeight? fontWeight, double? fontSize,}){
  return Text(
    boldText!,
    style: TextStyle(
      color: AppColors.white,
      fontWeight: fontWeight,
      fontSize: fontSize,
    ),
  );
}


Widget authField (TextEditingController controller,String title){
  return TextFormField(
    style: TextStyle(
        color: AppColors.white,
        fontSize: 15
    ),
    controller:controller ,
    decoration:  InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: AppColors.white
            )
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: AppColors.white
          ),
        ),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: AppColors.transparent
            )
        ),
        errorBorder:  OutlineInputBorder(
            borderSide:  BorderSide(
                color: AppColors.red
            )
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color:AppColors.red
            )
        )

    ),
    validator: (value){
      if (value! .isEmpty){
        return "$title is missing!";
      }
      return null;
    },
    // ),
  );
}

