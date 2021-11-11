import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/src/data/list_items.dart';
import 'package:to_do/src/data/list_items.dart';
import 'package:to_do/src/data/list_items.dart';

// Get new Item fun
final TextEditingController inputController = TextEditingController();
Items createNewItem(date, inputController, imgUrl, {isChecked = false}) {
  var label = inputController;
  var dateShort = date.substring(5, 16);
  bool check = isChecked;

  return Items(
    label,
    dateShort,
    imgUrl,
    check,
  );
}

// var itemCount = Items.listItems.length;
// buildToDoList() => Items.listItems[itemCount];
// iiii(itemCount) {
//   itemCount.sort((a, b) {
//     if (b) {
//       return 1;
//     }
//     return -1;
//   });
// }
