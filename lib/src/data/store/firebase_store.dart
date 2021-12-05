import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:to_do/src/domain/repository/todo_repository.dart';
import 'package:to_do/src/presentation/screens/add_task_page.dart';
import 'package:to_do/src/presentation/widget/detail_page_widgets.dart';
import 'package:to_do/src/presentation/widget/home_page_widgets.dart';

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

  void updateTodoLabel(String targetIndex, newLabel) {
    log('target label  $targetIndex');
    _firestore.collection('todos').doc(targetIndex).update({'label': newLabel});
  }

  void updateTodoImg(targetIndex, String imgUrl) {
    log('target id   $targetIndex');
    log('target img   $imgUrl');
    _firestore.collection('todos').doc(targetIndex).update({'imgUrl': imgUrl});
  }

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
      log("Delete successful!");
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

  inputNewImgUrlDialog(BuildContext context, targetIndex, imgUrl) {
    return showDialog(
      context: context,
      barrierDismissible:
          true, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        TextEditingController inputNewUrl = TextEditingController();
        log(inputNewUrl.toString());
        return AlertDialog(
          title: const Text(
            'Image change',
            textAlign: TextAlign.center,
          ),
          content: Row(
            children: <Widget>[
              Expanded(
                  child: TextField(
                controller: inputNewUrl,
                autofocus: true,
                decoration: InputDecoration(
                    labelText: 'Paste url of new image', hintText: '$imgUrl'),
              ))
            ],
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: const Text('CANCEL'),
                  onPressed: () {
                    inputNewUrl.clear();
                    Navigator.of(context).pop();
                  },
                ),
                const Spacer(),
                TextButton(
                  child: const Text('ACCEPT'),
                  onPressed: () {
                    if (inputNewUrl.text == '') {
                      inputNewUrl.text = imgUrl;
                      log('Empty value, use this img');
                    } else {
                      Provider.of<TodoRepository>(context, listen: false)
                          .updateTodoImg(targetIndex.id, inputNewUrl.text);
                    }
                    inputNewUrl.clear();
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ],
        );
      },
    );
  }

  //Zooom
  callZoomSmallAvatar(context, imgUrl, targetIndex) {
    return showDialog(
      context: context,
      barrierDismissible:
          true, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return Center(
          child: SizedBox(
              width: 400, height: 450, child: BigImage(imgUrl, targetIndex)),
        );
      },
    );
  }
}
