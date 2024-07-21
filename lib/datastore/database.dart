import 'package:hive_flutter/hive_flutter.dart';

class todoDataBase{
  List todoList=[];

  final _myBox= Hive.box('mybox');

  void createIntialData(){
    todoList =[
      ["cooking" , true ],
      ["sleep" , false]
    ];
  }

  void loadData(){
    todoList = _myBox.get('todoList') ?? [];
  }

  void updateData(){
    _myBox.put('todoList', todoList);
  }
}