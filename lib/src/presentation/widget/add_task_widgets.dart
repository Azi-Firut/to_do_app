import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/src/domain/repository/todo_repository.dart';

// text - add new item
class ShowTexUnderField extends StatelessWidget {
  const ShowTexUnderField({Key, key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        'add new item',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          // fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// Input text field
class InputTextField extends StatelessWidget {
  const InputTextField(TextEditingController this.controller, {Key, key})
      : super(key: key);
  final controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          focusColor: Colors.white,
          fillColor: Colors.black12,
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1),
              borderRadius: BorderRadius.circular(30)),
          hintText: 'type here',
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30)),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
        textInputAction: TextInputAction.next,
        restorationId: 'add new text');
  }
}

// Button add_new_item to list
class AddTaskButton extends StatelessWidget {
  const AddTaskButton(TextEditingController this.controller, {Key, key})
      : super(key: key);
  final controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100.0,
        width: 100.0,
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          elevation: 10,
          onPressed: () {
            Provider.of<TodoRepository>(context, listen: false)
                .addNewLabelToList();
          },
          child: const Icon(
            Icons.add,
            size: 50,
          ),
        ),
      ),
    );
  }
}
