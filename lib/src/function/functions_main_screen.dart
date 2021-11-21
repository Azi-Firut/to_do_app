import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final TextEditingController inputController = TextEditingController();

void delMessage(label) {
  Fluttertoast.showToast(
      msg: '$label was deleted',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 4,
      backgroundColor: Colors.red,
      textColor: Colors.black54,
      fontSize: 16.0);
}

void delLabelItem(context, targetIndex) {
  FirebaseFirestore.instance
      .collection('todos')
      .doc(targetIndex.id)
      .delete()
      .then((_) {
    print("Delete successful!");
  });
}
