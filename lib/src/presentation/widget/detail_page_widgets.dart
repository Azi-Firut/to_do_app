import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/src/domain/repository/todo_repository.dart';
import 'package:to_do/src/presentation/screens/detail_page.dart';
import 'package:to_do/src/presentation/screens/home_page.dart';

class DetailPageState extends State<DetailPage> {
  get targetIndex => widget.targetIndex;
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
              // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            )
          ],
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BigImage(
                widget.imgUrl,
                targetIndex,
              ),
              ModifyLabelField(
                widget.label,
                targetIndex,
              )
            ],
          ),
        ));
  }
}

// BigImage
class BigImage extends StatefulWidget {
  var targetIndex;
  var imgUrl;

  BigImage(this.imgUrl, this.targetIndex, {Key, key}) : super(key: key);

  @override
  State<BigImage> createState() => BigImageState();
}

class BigImageState extends State<BigImage> {
  @override
  Widget build(BuildContext context) {
    // TextEditingController inputNewlabel =
    //     TextEditingController(text: widget.imgUrl);
    // log('detail page widgets in  ${widget.label}');
    return Container(
      child: GestureDetector(onTap: () {
        // inputNewImgUrlDialog(context, widget.targetIndex, widget.imgUrl);
        Provider.of<TodoRepository>(context, listen: false)
            .inputNewImgUrlDialog(context, widget.targetIndex, widget.imgUrl);
      }),
      margin: const EdgeInsets.only(top: 28, bottom: 28),
      width: 260.0,
      height: 260.0,
      decoration: BoxDecoration(
        color: const Color(0xff7c94b6),
        image: DecorationImage(
          image: NetworkImage(
            widget.imgUrl,
          ),
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
    );
  }
}

// ModifyLabel (input)
class ModifyLabelField extends StatefulWidget {
  var targetIndex;
  var label;

  ModifyLabelField(this.label, this.targetIndex, {Key, key}) : super(key: key);

  @override
  State<ModifyLabelField> createState() => ModifyLabelFieldState();
}

class ModifyLabelFieldState extends State<ModifyLabelField> {
  @override
  Widget build(BuildContext context) {
    TextEditingController inputNewlabel =
        TextEditingController(text: widget.label);
    // log('detail page widgets in  ${widget.label}');
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextField(
            maxLines: null,
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
            onEditingComplete: () {
              // log('detail page widgets out  ${widget.label}');
              // log('detail page widgets out  ${widget.targetIndex.id}');
              Provider.of<TodoRepository>(context, listen: false)
                  .updateTodoLabel(widget.targetIndex.id, inputNewlabel.text);
              setState(() {
                widget.label = inputNewlabel.text;
                log('change State');
              });
              inputNewlabel.clear();
            },
            controller: inputNewlabel,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(10)),
              filled: false,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(30)),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
            ),
            textInputAction: TextInputAction.next,
            restorationId: ''));
  }
}
