import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:to_do/src/data/store/firebase_store.dart';

class TodoRepository extends ChangeNotifier {
  final FirebaseStore firebaseStore;

  TodoRepository({required this.firebaseStore});

  getTodosStream() => firebaseStore.getTodosStream();

  void addNewLabelToList() {
    firebaseStore.addNewLabelToList();
  }

  void delMessage(label) {
    firebaseStore.delMessage(label);
  }

  void delLabelItem(context, targetIndex) {
    firebaseStore.delLabelItem(context, targetIndex);
  }

  void changeIsChecked(indexId, isChecked) {
    firebaseStore.changeIsChecked(indexId, isChecked);
  }

  void updateTodoLabel(String targetIndex, String newLabel) {
    firebaseStore.updateTodoLabel(targetIndex, newLabel);
    log('repository new Label $targetIndex , $newLabel');
  }

  void updateTodoImg(String targetIndex, String imgUrl) {
    log('repository new img $imgUrl');
    firebaseStore.updateTodoImg(targetIndex, imgUrl);
  }

  void inputNewImgUrlDialog(context, targetIndex, imgUrl) {
    log('repository new img $imgUrl');
    firebaseStore.inputNewImgUrlDialog(context, targetIndex, imgUrl);
  }
}
