import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do/src/function/functions_main_screen.dart';

import '../../main.dart';

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
        targetIndex: '',
      ),
    );
  }
}

class ItemPage extends StatefulWidget {
  const ItemPage(
      {Key? key,
      required this.title,
      required this.label,
      this.imgUrl,
      this.targetIndex})
      : super(key: key);
  final String title;
  final String label;
  final imgUrl;
  final targetIndex;

  @override
  State<ItemPage> createState() => ItemPageState();
}

class ItemPageState extends State<ItemPage> {
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
        title: Text('Details '),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              FirebaseFirestore.instance
                  .collection('todos')
                  .doc(widget.targetIndex.id)
                  .delete()
                  .then((_) {
                delMessage(widget.label);
                print("success!");
              });
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomePage(
                            title: '',
                          )));
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          )
        ],
      ),
      body: Slidable(
        // Specify a key if the Slidable is dismissible.
        key: const ValueKey(0),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          // A pane can dismiss the Slidable.
          dismissible: DismissiblePane(onDismissed: () {}),
          children: [
            SlidableAction(
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
              onPressed: (BuildContext context) {},
            ),
          ],
        ),

        child: const ListTile(title: Text('Slide me')),
      ),
    );
  }
}
