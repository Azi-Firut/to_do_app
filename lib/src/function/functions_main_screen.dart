import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/src/data/list_items.dart';

// Create new Item fun
final TextEditingController inputController = TextEditingController();
Items createNewItem(date, inputController, {isChecked = false}) {
  var label = inputController;
  var dateShort = date.substring(5, 16);

  bool check = isChecked;
  return Items(
    label,
    dateShort,
    check,
  );
}
