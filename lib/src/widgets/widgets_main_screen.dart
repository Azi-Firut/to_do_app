import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/src/function/functions_main_screen.dart';

// Check Box widget
class CheckBoxWidget extends StatefulWidget {
  CheckBoxWidget(
    this.targetIndex,
    this.isChecked,
    this.imgUrl, {
    Key? key,
  }) : super(key: key);
  dynamic isChecked;
  String imgUrl;
  dynamic targetIndex;

  @override
  State<StatefulWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  // get targetIndex => targetIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      width: 40.0,
      height: 40.0,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        boxShadow: [
          BoxShadow(
            spreadRadius: -11,
            color: Colors.grey,
            offset: Offset(0.0, 4.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: CustomCheckBox(
        value: widget.isChecked,
        uncheckedIcon: const IconData(10),
        uncheckedFillColor: Colors.grey.shade300,
        shouldShowBorder: true,
        borderColor: Colors.white,
        checkedFillColor: Colors.red,
        borderRadius: 20,
        borderWidth: 3,
        checkBoxSize: 18,
        onChanged: (val) {
          setState(() {
            var indexId = widget.targetIndex.id;

            if (widget.isChecked == true) {
              widget.isChecked = false;
              var checked = widget.isChecked;
              // FirebaseFirestore.instance
              //     .collection('todos')
              //     .doc(widget.targetIndex.id)
              //     .update({
              //   'isChecked': false,
              // });
              changeIsChecked(indexId, checked);
            } else {
              widget.isChecked = true;
              var checked = widget.isChecked;
              // FirebaseFirestore.instance
              //     .collection('todos')
              //     .doc(widget.targetIndex.id)
              //     .update({
              //   'isChecked': true,
              // });
              changeIsChecked(indexId, checked);
            }
          });
        },
      ),
    );
  }

  // void changeIsChecked() {
  //   if ('isChecked' == false) {
  //     FirebaseFirestore.instance.collection('todos').add({
  //       'isChecked': true,
  //     });
  //   } else {
  //     FirebaseFirestore.instance.collection('todos').add({
  //       'isChecked': false,
  //     });
  //   }
  // }
}

// Show Label widget
class ShowLabelWidget extends StatelessWidget {
  ShowLabelWidget(this.label, {Key, key}) : super(key: key);
  var label;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76.0,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0, right: 8.0),
        //GestureDetector!!
        child: Text(
          // GestureDetector
          label,
          textAlign: TextAlign.right,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 18,
            shadows: [
              Shadow(
                blurRadius: 10.0,
                color: Colors.black38,
                offset: Offset(0, 4.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Small Avatar
class ImageSmallWidget extends StatelessWidget {
  ImageSmallWidget(
    this.imgUrl, {
    Key? key,
  }) : super(key: key);
  var imgUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        color: const Color(0xff7c94b6),
        image: DecorationImage(
          image: NetworkImage(imgUrl), // temporarily not used
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(50.0)),
        border: Border.all(
          color: Colors.white,
          width: 4.0,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 4.0),
            blurRadius: 6.0,
          ),
        ],
      ),
    );
  }
}

// Show number of item
class ShowNumberOfItem extends StatelessWidget {
  ShowNumberOfItem(
    this.index, {
    Key? key,
  }) : super(key: key);
  var index;
  @override
  Widget build(BuildContext context) {
    return Text(
      '${++index}',
      style: const TextStyle(
        fontSize: 9,
        shadows: [
          Shadow(
            blurRadius: 10.0,
            color: Colors.black38,
            offset: Offset(0, 4.0),
          ),
        ],
      ),
    );
  }
}

// Show item date
class ShowItemDate extends StatelessWidget {
  ShowItemDate(
    this.date, {
    Key? key,
  }) : super(key: key);
  var date;

  @override
  Widget build(BuildContext context) {
    return Text(
      date,
      style: const TextStyle(
        fontSize: 9,
        shadows: [
          Shadow(
            blurRadius: 10.0,
            color: Colors.black38,
            offset: Offset(0, 4.0),
          ),
        ],
      ),
    );
  }
}

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
          color: Colors.black38,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
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
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 3),
              borderRadius: BorderRadius.circular(30)),
          hintText: 'type here',
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30)),
          //helperText: 'Write slowly',
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
        textInputAction: TextInputAction.next,
        restorationId: 'add new text');
  }
}
