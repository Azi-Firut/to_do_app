// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:custom_check_box/custom_check_box.dart';
// import 'package:to_do/src/list_items.dart';
//
// // Button add new
// Widget buttonNewDownDocked(BuildContext context) {
//   return Container(
//     decoration: const BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black26,
//             offset: Offset(0.0, -4), //(x,y)
//             blurRadius: 6.0,
//           ),
//         ],
//         color: Colors.deepOrange,
//         borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(15), topRight: Radius.circular(15))),
//     height: 50,
//     alignment: Alignment.center,
//     // color: Colors.deepOrange,
//     child: TextButton.icon(
//       onPressed: () => showPress(context),
//       icon: const Icon(
//         Icons.add,
//         color: Colors.white,
//       ),
//       label: const Text(
//         'Add new',
//         textScaleFactor: 1.4,
//         style: TextStyle(color: Colors.white),
//       ),
//     ),
//   );
// }
//
// // up
// showPress(BuildContext context) {
//   showModalBottomSheet(
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(15), topRight: Radius.circular(15)),
//       ),
//       backgroundColor: Colors.white,
//       context: context,
//       builder: (context) {
//         // var labelAdd;
//         return Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               textUnderField(),
//               addTextField('', () {}),
//               _addItemButton(() {}),
//             ]);
//       });
// }
//
// TextEditingController _inputController = TextEditingController();
//
// dynamic dateNow = DateTime.now().toString();
// final date = dateNow.substring(5, 13);
//
// Items test(date, _inputController) {
//   var label = _inputController;
//   var da = date;
//   return Items(label, da);
// }
//
// void addLabelToList() {
//   var label = _inputController.text;
//   Items.listItems.insert(0, test(date, label));
//   _inputController.clear();
//   //state();
// }
//
// Widget _input(String hint, TextEditingController controller) {
//   return Container(
//     child: TextField(
//         controller: controller,
//
//         //onChanged: (labelAdd),
//         textAlign: TextAlign.center,
//         decoration: InputDecoration(
//           focusedBorder:
//               const OutlineInputBorder(borderSide: BorderSide(width: 3)),
//           hintText: hint,
//           filled: true,
//           border: OutlineInputBorder(
//               borderSide: BorderSide.none,
//               borderRadius: BorderRadius.circular(30)),
//           helperText: 'Write slowly',
//           floatingLabelBehavior: FloatingLabelBehavior.auto,
//         ),
//         textInputAction: TextInputAction.next,
//         restorationId: 'add new text'),
//   );
// }
//
// // text - add new item
// Widget textUnderField() {
//   return const Padding(
//     padding: EdgeInsets.all(10.0),
//     child: Text(
//       'add new item',
//       style: TextStyle(
//         color: Colors.black38,
//         fontSize: 20,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//   );
// }
//
// // input text field (_input)
// Widget addTextField(labelAdd, Function() func) {
//   return Padding(
//     padding: const EdgeInsets.all(10.0),
//     child: _input('hint', _inputController),
//   );
// }
//
// // button add item to list
// Widget _addItemButton(void Function() foo) {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Container(
//       height: 100.0,
//       width: 100.0,
//       padding: const EdgeInsets.all(8.0),
//       child: FloatingActionButton(
//         onPressed: () {
//           addLabelToList();
//
//           // addLabelToList();
//           // _warningMessage = "new message from within the State class";
//         },
//         child: const Icon(
//           Icons.add,
//           size: 30,
//         ),
//       ),
//     ),
//   );
// }
