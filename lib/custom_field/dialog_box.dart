import 'package:flutter/material.dart';
import 'package:workshop/custom_field/my_button.dart';
import 'package:workshop/pages/homePage.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final onSave;

  const DialogBox({super.key , required this.controller , required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromRGBO(222, 249, 196, 2),
      content: Container(height : 120 , 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        TextField(
          controller : controller,
          decoration: InputDecoration(border: OutlineInputBorder(),
          hintText: 'Enter your name'),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          MyButton(text: "Save", onPressed: onSave ),
          SizedBox(width : 4),
          MyButton(text: "Cancel", onPressed: (){
            Navigator.pop(context);
            controller.clear();
          }),

        ],)
      ],),),
    );
  }
}