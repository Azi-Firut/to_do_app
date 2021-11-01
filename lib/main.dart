import 'package:flutter/material.dart';
import 'src/list_items.dart';
import 'src/widgets.dart';

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
      home: const HomePage(title: 'ToDo List'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)),
        ),
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: todoItems.length,
            itemBuilder: (context, int index) {
              var item = todoItems[index];
              return toDoRow(item, index);
            }),
      ),
      floatingActionButtonLocation: (FloatingActionButtonLocation.centerDocked),
      floatingActionButton: const BottomSheetStatelessWidget(),
    );
  }
}
