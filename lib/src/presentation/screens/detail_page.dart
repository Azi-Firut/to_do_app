import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/src/presentation/widget/detail_page_widgets.dart';

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
      home: const DetailPage(
        title: 'ToDo List',
        label: '',
        targetIndex: '',
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  const DetailPage(
      {Key? key,
      required this.title,
      required this.label,
      this.imgUrl,
      this.targetIndex,
      this.id})
      : super(key: key);
  final String title;
  final String label;
  final id;
  final imgUrl;
  final targetIndex;

  @override
  State<DetailPage> createState() => DetailPageState();
}
