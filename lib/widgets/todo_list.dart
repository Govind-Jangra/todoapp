import 'package:flutter/material.dart';

import '../model/todo.dart';


class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final void Function(ToDo) onToDoChanged;
  final void Function(String) onDeleteItem;

  const ToDoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
         
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor:const Color.fromARGB(226, 255, 255, 255),
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color:const Color(0xFF5F52EE),
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
            fontSize: 16,
            color:const Color(0xFF3A3A3A),
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color:const Color(0xFFDA4040),
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color:const Color.fromARGB(243, 255, 255, 255),
            iconSize: 18,
            icon: const Icon(Icons.delete),
            onPressed: () {
             
              onDeleteItem(todo.id!);
            },
          ),
        ),
      ),
    );
  }
}
