import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/src/function/functions_main_screen.dart';
import 'package:to_do/src/pages/details_page.dart';
import 'package:to_do/src/widgets/widgets_main_screen.dart';
import 'src/data/list_items.dart';

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
  void addNewLabelToList() {
    setState(() {
      var isChecked;
      var imgUrl =
          'https://i.c97.org/p/articles/2017/ai-240143-aux-head-20161207_zdun_360.jpg';
      var label = inputController.text;
      var dateNow = DateTime.now().toString();
      if (label.isNotEmpty) {
        Items.listItems.insert(0, createNewItem(dateNow, label, imgUrl));
        inputController.clear();
      }
    });
  }

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
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: Items.listItems.length,
          itemBuilder: (BuildContext context, int index) {
            Widget buildToDoList(Items toDoItem) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.4),
                      Colors.indigo.withOpacity(0.1),
                      Colors.transparent,
                    ],
                    stops: const [0, 0.01, 0.5],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Row(
                  children: [
                    CheckBoxWidget(toDoItem.isChecked),
                    ImageSmallWidget(toDoItem.imgUrl),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        ///////
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ItemPage(
                                        title: widget.title,
                                        label: toDoItem.label,
                                        imgUrl: toDoItem.imgUrl,
                                      ) ///////
                                  ));
                        },
                        child: Stack(children: [
                          ShowLabelWidget(toDoItem.label),
                          Positioned(
                            child: ShowItemDate(toDoItem.date),
                            bottom: 4,
                            right: 4,
                          ),
                          Positioned(
                            child: ShowNumberOfItem(index),
                            top: 4,
                            right: 4,
                          ),
                        ]),
                      ),
                    )
                  ],
                ),
              );
            }

            return buildToDoList(Items.listItems[index]);
          },
        ),
      ),
      floatingActionButtonLocation: (FloatingActionButtonLocation.centerDocked),
      floatingActionButton: buttonNewDownDocked(context),
    );
  }

  // Button add_new_item to list
  addItemButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100.0,
        width: 100.0,
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {
            addNewLabelToList();
          },
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
      ),
    );
  }

  // Show small bottom screen when pressed add_new (text text_input add_button)
  showBottomDocketScreen(BuildContext context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        backgroundColor: Colors.white,
        context: context,
        builder: (context) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ShowTexUnderField(),
                const AddTextField(''),
                addItemButton(),
              ]);
        });
  }

// Button add_new

  buttonNewDownDocked(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0.0, -4), //(x,y)
              blurRadius: 6.0,
            ),
          ],
          color: Colors.deepOrange,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      height: 50,
      alignment: Alignment.center,
      child: TextButton.icon(
        onPressed: () => showBottomDocketScreen(context),
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        label: const Text(
          'Add new',
          textScaleFactor: 1.4,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  // Sort fun
  void sortByCheck() {}
}
