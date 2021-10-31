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
        primarySwatch: Colors.indigo,
      ),
      home: const HomePage(title: 'ToDo List'),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ListView.builder(
            //physics: const BouncingScrollPhysics(),  // not beautiful
            itemCount: todoItems.length,
            itemBuilder: (context, int index) {
              var item = todoItems[index];
              return toDoRow(item, index);
            }),
      ),
    );
  }
}

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: ListView.builder(
//             //physics: const BouncingScrollPhysics(),  // not beautiful
//             itemCount: todoItems.length,
//             itemBuilder: (context, int index) {
//               var item = todoItems[index];
//               return toDoRow(item, index);
//             }),
//       ),
//     );
//   }
// }
