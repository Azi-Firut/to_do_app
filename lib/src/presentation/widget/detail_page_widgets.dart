import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/src/domain/repository/todo_repository.dart';
import 'package:to_do/src/presentation/screens/detail_page.dart';
import 'package:to_do/src/presentation/screens/home_page.dart';

class DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 40,
          centerTitle: true,
          title: const Text('Details '),
          actions: [
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                Provider.of<TodoRepository>(context, listen: false)
                    .delLabelItem(context, widget.targetIndex);

                Provider.of<TodoRepository>(context, listen: false)
                    .delMessage(widget.label);

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
