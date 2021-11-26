import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/src/function/functions_main_screen.dart';
import 'package:to_do/src/pages/details_page.dart';
import 'package:to_do/src/widgets/widgets_main_screen.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
  // get label => label;

  //get isChecked => isChecked;

  void addNewLabelToList() {
    setState(() {
      var dateNow = DateTime.now().toString().substring(0, 16);
      if (inputController.text.isNotEmpty) {
        FirebaseFirestore.instance.collection('todos').add({
          'label': inputController.text,
          'isChecked': false,
          'imgUrl':
              'https://pre-party.com.ua/uploads/2017/Tanya_January/Zhdun_mem/001-Zhdun_mem.jpg',
          'dateNow': dateNow
        });
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
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('todos')
            .snapshots(includeMetadataChanges: true),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          // List<ItemData> items = [];
//List<Map<ItemData>> items = []
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (snapshot.hasData) {
            for (var query in snapshot.data!.docs) {
              Map<String, dynamic> data = query.data()! as Map<String, dynamic>;

              log('DATA ${data.toString()}');
              log('Snap list of map _JsonQueryDocumentSnapshot == ${snapshot.data!.docs}');

              // data.deepSortByValue();
              // sortByChecked(data);

              // var label = data['label'];
              // var imgUrl = data['imgUrl'];
              // var dateNow = data['dateNow'];
              // var isChecked = data['isChecked'];

              // items.add(ItemData(
              //     label: data['label'],
              //     imgUrl: data['imgUrl'],
              //     dateNow: data['dateNow'],
              //     isChecked: data['isChecked']));
              //
              // log('ITEMS ${items.toString()}');
            }
          }

          return Center(
            child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var targetIndex = snapshot.data!.docs[index];

                  return Slidable(
                    key: const ValueKey(0),
                    endActionPane: ActionPane(
                      extentRatio: 0.5,
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          backgroundColor: Colors.deepOrange,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                          onPressed: (BuildContext context) {
                            delLabelItem(context, targetIndex);
                          },
                        ),
                      ],
                    ),
                    child: Container(
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
                          CheckBoxWidget(
                            targetIndex,
                            // items.index['imgUrl'],
                            targetIndex['isChecked'],
                            targetIndex['imgUrl'],
                          ),
                          ImageSmallWidget(targetIndex['imgUrl']),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemPage(
                                              targetIndex: targetIndex,
                                              title: widget.title,
                                              label: targetIndex['label'],
                                              imgUrl: targetIndex['imgUrl'],
                                            )));
                              },
                              child: Stack(children: [
                                ShowLabelWidget(targetIndex['label']),
                                Positioned(
                                  child: ShowItemDate(targetIndex['dateNow']),
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
                    ),
                  );
                }),
          );
        },
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
}
