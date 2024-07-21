import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomTodo extends StatelessWidget {
  final String taskName;
  final bool completed;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  CustomTodo({super.key , required this.taskName , required this.completed , required this.onChanged , required this.deleteFunction });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(13.0),
    child: Slidable(
      endActionPane: ActionPane(motion : StretchMotion(),
      children: [
        SlidableAction(onPressed: deleteFunction,
        icon:  Icons.delete,
        backgroundColor: Colors.white24,
        borderRadius: BorderRadius.circular(12),)
      ],),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
      
          children: [
            Checkbox(value: completed, onChanged: onChanged , activeColor: Color.fromRGBO(80, 180, 152, 2), hoverColor: Colors.white,),
            
            Text(taskName
            
            ),
      
          ],
        ),
        decoration: BoxDecoration(
          color: Color.fromRGBO(222, 249, 196, 2),
          borderRadius: BorderRadius.circular(12),
          border: Border(
            top: BorderSide(color: Colors.black, width: 1.0),
            bottom: BorderSide(color: Colors.black, width: 1.0),
            left: BorderSide(color: Colors.black, width: 1.0),
            right: BorderSide(color: Colors.black, width: 1.0),
          )
        ),
      ),
    ),
    );
  }
}