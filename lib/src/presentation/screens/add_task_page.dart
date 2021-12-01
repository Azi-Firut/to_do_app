// Show small bottom screen when pressed add_new (text text_input add_button)
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/src/presentation/widget/add_task_widgets.dart';

final TextEditingController inputController = TextEditingController();

showBottomDocketScreen(BuildContext context) {
  showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ShowTexUnderField(),
              const AddTextField(''),
              AddTaskButton(inputController),
            ]);
      });
}

// AddTextField (input)
class AddTextField extends StatelessWidget {
  const AddTextField(String this.s, {Key, key}) : super(key: key);
  final s;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InputTextField(inputController),
    );
  }
}
