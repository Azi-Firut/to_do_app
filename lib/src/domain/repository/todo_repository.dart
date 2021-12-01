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
  // void updateTodo(String id, bool isChecked) {
  //   firebaseStore.updateTodo(id, isChecked);
  // }
}
