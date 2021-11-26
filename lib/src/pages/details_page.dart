import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/src/function/functions_main_screen.dart';
import 'package:parallax_bg/parallax_bg.dart';

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
          centerTitle: true,
          title: Text('Details '),
          actions: [
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                delLabelItem(context, widget.targetIndex);
                delMessage(widget.label);
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
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 28, bottom: 28),
                width: 260.0,
                height: 260.0,
                decoration: BoxDecoration(
                  color: const Color(0xff7c94b6),
                  image: DecorationImage(
                    image: NetworkImage(widget.imgUrl),

                    // temporarily not used
                    fit: BoxFit.cover,
                  ),
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
              Text(
                widget.label,
                style: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black38,
                      offset: Offset(0, 4.0),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
