import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/src/function/functions_main_screen.dart';
import 'package:to_do/src/widgets/widgets_main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo List',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const ItemPage(
        title: 'ToDo List',
        label: '',
      ),
    );
  }
}

class ItemPage extends StatefulWidget {
  const ItemPage({Key? key, required this.title, required this.label})
      : super(key: key);
  final String title;
  final String label;

  @override
  State<ItemPage> createState() => ItemPageState();
}

class ItemPageState extends State<ItemPage> {
  // void addNewLabelToList() {
  //   setState(() {
  //     //var isChecked;
  //     var label = inputController.text;
  //     var dateNow = DateTime.now().toString();
  //     if (label.isNotEmpty) {
  //       Items.listItems.insert(0, createNewItem(dateNow, label));
  //       inputController.clear();
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 40,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
          ),
          centerTitle: true,
          title: const Text('Details'),
        ),
        body: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 28, bottom: 28),
                width: 260.0,
                height: 260.0,
                decoration: BoxDecoration(
                  color: const Color(0xff7c94b6),
                  // image: const DecorationImage(
                  //   image: AssetImage('assets/bg_header.png'),  // temporarily not used
                  //   fit: BoxFit.cover,
                  // ),
                  borderRadius: const BorderRadius.all(Radius.circular(200.0)),
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
              ),
              Text(widget.label)
            ],
          ),
        ));
  }
}
