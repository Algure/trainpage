import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyBorderedInputField extends StatelessWidget {
  Function(String) onUpdateText;
  Function()? onEditingComplete;
  TextEditingController? inputTextController;
  TextInputFormatter? inputFormatter ;

  String hintText ;

  String labelText;

  Widget? leadingWidget;
  Widget? trailngWidget;

  bool shouldObsucureText;
  bool enabled;

  int lines ;

  double? fontSize;

  double? labelSize;

  double width;

  TextAlign? textAlign;


  MyBorderedInputField({required this.hintText, required this.labelText, this.width = 200,
    required this.inputTextController, required this.onUpdateText, this.inputFormatter,
     this.leadingWidget, this.trailngWidget,this.shouldObsucureText= false, this.enabled = true,
    this.lines = 1, super.key,  this.onEditingComplete, this.fontSize, this.textAlign});


  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      elevation: 1,
      color: Colors.transparent,
      child: Container(
        constraints: BoxConstraints(
            maxWidth: 500,
            minHeight: 50
        ),
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            // border: Border.all(width: 0.5, color: Colors.grey)
        ),
        alignment: Alignment.bottomCenter,
        child: TextField(
            controller: inputTextController,
            style: TextStyle(color: Colors.black, fontSize: fontSize),//kInputTextStyle,
            textAlign: textAlign??TextAlign.left,
            autofocus: false,
            enabled:enabled,
            maxLines: lines,
            onChanged: onUpdateText,
            textAlignVertical: TextAlignVertical.bottom,
            textInputAction: TextInputAction.next,
            inputFormatters: inputFormatter==null? []: [inputFormatter!],
            obscureText: shouldObsucureText,
            onEditingComplete: onEditingComplete,
            onTapOutside: (_)=>(onEditingComplete!=null)?onEditingComplete!():null,
            decoration: InputDecoration(
                filled: true,
                isDense: true,
                fillColor: Colors.transparent,
                labelText: labelText,
                hintText: hintText,
                labelStyle: TextStyle(color:Colors.grey, fontSize: labelSize),
                prefixIcon: leadingWidget??Container(height: 1,width: 1,),
                suffixIcon: trailngWidget??Container(height: 1,width: 1,),
                prefixIconConstraints: BoxConstraints(maxWidth: 50, maxHeight: 50),
                suffixIconConstraints: BoxConstraints(maxWidth: 50, maxHeight: 50),
                border: InputBorder.none,
                // focusedBorder: BORDER_NO_BORDER,
                // enabledBorder: BORDER_NO_BORDER,
                // disabledBorder: BORDER_NO_BORDER
            )
        ),
      ),
    );
  }
}
