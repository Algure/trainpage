import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  MyButton({required this.buttonColor, required this.text, required this.textColor,
    required this.onPressed,
    this.enabled = true, this.fontSize=12, this.fontSpacing = 0,  this.hasCorners = true});

  Color buttonColor;
  String text;
  Function()? onPressed;
  Color textColor;
  bool enabled;
  bool hasCorners;
  double fontSize;
  double fontSpacing;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: hasCorners==false? null: BorderRadius.circular(7)
      ),
      child: MaterialButton(onPressed:(){
        if(onPressed != null && enabled) onPressed!.call();
      },
        child: Text(text,
          style: TextStyle(color: textColor,
              fontSize: fontSize, letterSpacing: fontSpacing),),
        splashColor: Colors.white,),
    );
  }
}