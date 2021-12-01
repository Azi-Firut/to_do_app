import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do/src/presentation/screens/add_task_page.dart';

class FirebaseStore {
  var _firestore = FirebaseFirestore.instance;

  Stream getTodosStream() => _firestore.collection("todos").snapshots();

  void addNewLabelToList() {
    var dateNow = DateTime.now().toString().substring(0, 16);
    if (inputController.text.isNotEmpty) {
      _firestore.collection('todos').add({
        'label': inputController.text,
        'isChecked': false,
        'imgUrl':
            'https://pre-party.com.ua/uploads/2017/Tanya_January/Zhdun_mem/001-Zhdun_mem.jpg',
        'dateNow': dateNow
      });
      inputController.clear();
    }
  }

  // void updateTodo(String id, bool isChecked) {
  //   _firestore.collection('todos').doc(id).update({"isChecked": isChecked});
  // }

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
    _firestore.collection('todos').doc(targetIndex.id).delete().then((_) {
      print("Delete successful!");
    });
  }

  // sortByChecked(data) {
  //   SplayTreeMap.from(
  //       data, (keyTrue, keyFalse) => data[keyTrue].compareTo(data[keyFalse]));
  //   return data;
  // }

  void changeIsChecked(indexId, isChecked) {
    var path = _firestore.collection('todos').doc(indexId);
    if (isChecked == false) {
      path.update({
        'isChecked': isChecked, //false
      });
    } else {
      path.update({
        'isChecked': isChecked, //true
      });
    }
  }
}
