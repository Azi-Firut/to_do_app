import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'src/list_items.dart';

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
              // var label = Items.listItems.in;

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
                    Container(
                        margin: const EdgeInsets.all(12.0),
                        width: 40.0,
                        height: 40.0,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: -11,
                              color: Colors.grey,
                              offset: Offset(0.0, 4.0), //(x,y)
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: CustomCheckBox(
                          value: false,
                          uncheckedIcon: const IconData(10),
                          uncheckedFillColor: Colors.grey.shade300,
                          shouldShowBorder: true,
                          borderColor: Colors.white,
                          checkedFillColor: Colors.red,
                          borderRadius: 20,
                          borderWidth: 2,
                          checkBoxSize: 14,
                          onChanged: (val) {
                            //do your stuff here
                            // setState(() {
                            //   shouldCheck = val;
                            // });
                          },
                        )),
                    Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 8),
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: const Color(0xff7c94b6),
                        // image: const DecorationImage(
                        //   image: AssetImage('assets/bg_header.png'),  // temporarily not used
                        //   fit: BoxFit.cover,
                        // ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50.0)),
                        border: Border.all(
                          color: Colors.white,
                          width: 4.0,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 4.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Stack(children: [
                        SizedBox(
                          //width: 60.0,
                          height: 70.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              toDoItem.label,
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 18,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.black38,
                                    offset: Offset(0, 4.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 5,
                          child: Container(
                            alignment: Alignment.bottomRight,
                            //height: MediaQuery.of(context).size.height,
                            child: Text(
                              toDoItem.date,
                              style: const TextStyle(
                                fontSize: 9,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.black38,
                                    offset: Offset(0, 4.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 5,
                          top: 0,
                          child: Container(
                            alignment: Alignment.bottomRight,
                            //height: MediaQuery.of(context).size.height,
                            child: Text(
                              '${++index}',
                              style: const TextStyle(
                                fontSize: 9,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.black38,
                                    offset: Offset(0, 4.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
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

// Button add new
  Widget buttonNewDownDocked(BuildContext context) {
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
        onPressed: () => showPress(context),
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

// up
  showPress(BuildContext context) {
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
                Container(child: textUnderField()),
                Container(height: 200, child: addTextField('')),
                _addItemButton(),
              ]);
        });
  }

  final TextEditingController _inputController = TextEditingController();

  var dateNow = DateTime.now().toString();
  // var date = dateNow.substring(5, 13);

  Items test(date, _inputController) {
    var label = _inputController;
    var date = dateNow.substring(5, 16);
    var da = date;
    return Items(label, da);
  }

  void addLabelToList() {
    var label = _inputController.text;
    if (label.isNotEmpty) {
      Items.listItems.insert(0, test(dateNow, label));
      _inputController.clear();
    }
  }

  Widget _input(TextEditingController controller) {
    return TextField(
        controller: controller,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 3),
              borderRadius: BorderRadius.circular(30)),
          hintText: 'type here',
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30)),
          //helperText: 'Write slowly',
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
        textInputAction: TextInputAction.next,
        restorationId: 'add new text');
  }

// text - add new item
  Widget textUnderField() {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        'add new item',
        style: TextStyle(
          color: Colors.black38,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

// input text field (_input)
  Widget addTextField(labelAdd) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: _input(_inputController),
    );
  }

// button add item to list
  Widget _addItemButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100.0,
        width: 100.0,
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              addLabelToList();
            });
            //addLabelToList();
          },
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
      ),
    );
  }
}
