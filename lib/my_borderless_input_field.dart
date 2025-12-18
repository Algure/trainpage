import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class MyBorderlessInputField extends StatelessWidget {
  Function(String) onUpdateText;
  Function()? onEditComplete;

  TextEditingController? inputTextController;
  FilteringTextInputFormatter? inputFormatter ;

  String hintText ;

  String labelText;

  Widget? leadingWidget;
  Widget? trailngWidget;

  bool shouldObsucureText;

  int lines;

  bool isEnabled;

  TextAlign? textAlign;

  TextStyle? textStyle;

  Color? backgroundColor;

  double height;


  MyBorderlessInputField({required this.hintText, required this.labelText,
    required this.inputTextController, required this.onUpdateText, this.inputFormatter,
    this.leadingWidget, this.trailngWidget,this.shouldObsucureText= false, this.lines = 1,
    this.textAlign, this.onEditComplete, this.backgroundColor = Colors.white,
    this.height = 50,
    this.isEnabled=true, this.textStyle = const TextStyle(color: Colors.black)});


  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          maxWidth: 500,
      ),
      height: height,
      decoration: BoxDecoration(
          color: backgroundColor,
      ),
      alignment: Alignment.bottomCenter,
      child: TextField(
          controller: inputTextController,
          style: textStyle,//kInputTextStyle,
          textAlign: textAlign??TextAlign.left,
          autofocus: false,
          maxLines: lines,
          onChanged: onUpdateText,
          textAlignVertical: TextAlignVertical.bottom,
          textInputAction: TextInputAction.next,
          enabled: isEnabled,
          inputFormatters: inputFormatter==null? []: [inputFormatter!],
          obscureText: shouldObsucureText,
          onEditingComplete: onEditComplete,
          onTapOutside: (_)=>  (onEditComplete!=null)?onEditComplete!():null,
          decoration: InputDecoration(
              filled: true,
              isDense: true,
              fillColor: backgroundColor,
              labelText: labelText,
              hintText: hintText,
              labelStyle: TextStyle(
                  color:Colors.grey
              ),
              prefixIcon: leadingWidget??Container(height: 1,width: 1,),
              suffixIcon: trailngWidget??Container(height: 1,width: 1,),
              prefixIconConstraints: BoxConstraints(
                  maxWidth: 50, maxHeight: 50
              ),
              suffixIconConstraints: BoxConstraints(
                  maxWidth: 50, maxHeight: 50
              ),
              border: InputBorder.none,
          )
      ),
    );
  }
}
