

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:workshop/custom_field/customTodo.dart';
import 'package:workshop/custom_field/dialog_box.dart';
import 'package:workshop/datastore/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final _myBox= Hive.box('mybox');
  final _controller = TextEditingController();
  todoDataBase db= todoDataBase();

  void initState(){
    if (_myBox.get("TODO LIST") == null){
      db.createIntialData();
    }
    else{
      db.loadData();
    }
    super.initState();
  }
  

  void checkBoxChanged(bool?  value , int index) {

    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
     
    });

    db.updateData();
  }
  
  void newSave(){
    setState(() {
      db.todoList.add([_controller.text , false]);
      _controller.clear();
      Navigator.pop(context);
      db.updateData();
      

    });
  }

  void newTask(){
    showDialog(context: context, builder: (context) {
      return DialogBox(
        controller: _controller,
        onSave : newSave,
      );
  }
  );
  }

  void deleteTask(int index){
    setState(() {
      db.todoList.removeAt(index);
    }
    );
    db.updateData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(156, 219, 166, 2),
      appBar: AppBar( title: const Text("TODO" , style: TextStyle() ),
      elevation: 0,
      backgroundColor: Color.fromRGBO(80, 180, 152, 2),
      ),
      floatingActionButton: FloatingActionButton(onPressed:newTask, 
      child: Icon(Icons.add)),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return CustomTodo(
            taskName: db.todoList[index][0],
            completed : db.todoList[index][1],
            onChanged : (value) => checkBoxChanged(value , index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
      
    );
  }
}