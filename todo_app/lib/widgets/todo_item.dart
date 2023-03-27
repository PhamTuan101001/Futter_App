import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/todo.dart';
import '../constants/colors.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;
  final changedColor;
  final onEditTodo;

  const ToDoItem({
    Key? key,
    required this.todo,
    required this.changedColor,
    required this.onToDoChanged,
    required this.onDeleteItem,
    required this.onEditTodo,
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
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        title: Text(
          '${todo.todoText}\n${todo.deadline}',
          style: TextStyle(
            fontSize: 16,
            color: todo.checkTime ? tdRed : tdBlack,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              IconButton(
                color: tdBlack,
                padding: const EdgeInsets.all(0),
                iconSize: 18,
                icon: const Icon(Icons.edit),
                onPressed: () {
                  onEditTodo(todo.id);
                },
              ),
              IconButton(
                color: tdBlack,
                padding: const EdgeInsets.all(0),
                iconSize: 18,
                icon: const Icon(Icons.delete),
                onPressed: () {
                  // print('Clicked on delete icon');
                  onDeleteItem(todo.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
