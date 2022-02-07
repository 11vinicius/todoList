import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/models/todo.dart';

class TodoListItem extends StatefulWidget {
  final Todo todo;
  final Function(Todo) onDelete;

  const TodoListItem({Key? key, required this.todo, required this.onDelete})
      : super(key: key);

  @override
  _TodoListItemState createState() => _TodoListItemState();
}

class _TodoListItemState extends State<TodoListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Slidable(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.grey[200],
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  DateFormat('dd/mm/yyyy').format(widget.todo.datetime),
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  widget.todo.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        ),
        actionExtentRatio: 0.25,
        actionPane: SlidableDrawerActionPane(),
        secondaryActions: [
          IconSlideAction(
            color: Colors.red,
            icon: Icons.delete,
            caption: 'Delete',
            onTap: () {
              widget.onDelete(widget.todo);
            },
          )
        ],
      ),
    );
  }
}
