import 'package:flutter/material.dart';

import 'package:cc206_moodit/components/features/todo.dart';
import 'package:cc206_moodit/components/features/colors.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

  const ToDoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          // print('Clicked on Todo Item.');
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        //leading: Icon(
        //  todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
        //  color: tdBlack,
        //),
        title: Text(
          todo.todoText!,
          style: TextStyle(
            fontSize: 16,
            color: tdBlack,
            //decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 30,
          decoration: BoxDecoration(
            color: tdBlack,
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            padding: EdgeInsets.only(bottom: 1.0),
            color: Colors.white,
            iconSize: 15, 
            icon: Icon(Icons.delete),
            onPressed: () {
              //print('Clicked on delete icon');
              onDeleteItem(todo.id);
            },
          ),
        ),
      ),
    );
  }
}
