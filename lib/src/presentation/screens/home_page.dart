import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do/src/domain/repository/todo_repository.dart';
import 'package:to_do/src/presentation/widget/home_page_widgets.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  get id => null;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.deepOrange),
        toolbarHeight: 40,
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('todos')
            .snapshots(includeMetadataChanges: true),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (snapshot.hasData) {
            for (var query in snapshot.data!.docs) {
              Map<String, dynamic> data = query.data()! as Map<String, dynamic>;

              // log('DATA ${data.toString()}');
              // log('Snap list of map _JsonQueryDocumentSnapshot == ${snapshot.data!.docs}');
            }
          }

          return Center(
            child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var targetIndex = snapshot.data!.docs[index];
                  var id =
                      FirebaseFirestore.instance.collection('todos').doc('id');

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
                            Provider.of<TodoRepository>(context, listen: false)
                                .delLabelItem(context, targetIndex);
                          },
                        ),
                      ],
                    ),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.01),
                            Colors.indigo.withOpacity(0.05),
                            Colors.transparent,
                          ],
                          stops: const [0, 0.0, 0.5],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Row(
                        children: [
                          CheckBoxWidget(
                            targetIndex,
                            targetIndex['isChecked'],
                            targetIndex['imgUrl'],
                          ),
                          SmallImageWidget(targetIndex['imgUrl'], targetIndex),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                        targetIndex: targetIndex,
                                        id: widget.id,
                                        title: widget.title,
                                        label: targetIndex['label'],
                                        imgUrl: targetIndex['imgUrl'],
                                      ),
                                    ));
                              },
                              child: Stack(children: [
                                ShowLabelWidget(targetIndex['label']),
                                Positioned(
                                  child: ShowItemDate(targetIndex['dateNow']),
                                  bottom: 0,
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
      floatingActionButton: DownDockedButton(context),
    );
  }
}
