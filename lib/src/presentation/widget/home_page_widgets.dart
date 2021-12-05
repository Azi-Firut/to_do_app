import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/src/domain/repository/todo_repository.dart';
import 'package:to_do/src/presentation/screens/add_task_page.dart';

import 'detail_page_widgets.dart';

// Check Box widget
class CheckBoxWidget extends StatefulWidget {
  CheckBoxWidget(
    this.targetIndex,
    this.isChecked,
    this.imgUrl, {
    Key? key,
  }) : super(key: key);
  dynamic isChecked;
  String imgUrl;
  dynamic targetIndex;

  @override
  State<StatefulWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        value: widget.isChecked,
        uncheckedIcon: const IconData(10),
        uncheckedFillColor: Colors.grey.shade300,
        shouldShowBorder: true,
        borderColor: Colors.white,
        checkedFillColor: Colors.red,
        borderRadius: 20,
        borderWidth: 3,
        checkBoxSize: 18,
        onChanged: (val) {
          setState(() {
            var indexId = widget.targetIndex.id;
            if (widget.isChecked == true) {
              widget.isChecked = false;
              var isChecked = widget.isChecked;
              Provider.of<TodoRepository>(context, listen: false)
                  .changeIsChecked(indexId, isChecked);
            } else {
              widget.isChecked = true;
              var isChecked = widget.isChecked;
              Provider.of<TodoRepository>(context, listen: false)
                  .changeIsChecked(indexId, isChecked);
            }
          });
        },
      ),
    );
  }
}

// Small Avatar
class SmallImageWidget extends StatelessWidget {
  SmallImageWidget(
    this.imgUrl,
    this.targetIndex, {
    Key? key,
  }) : super(key: key);
  var imgUrl;
  var targetIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(onTap: () {
        // inputNewImgUrlDialog(context, targetIndex, imgUrl);
        Provider.of<TodoRepository>(context, listen: false)
            .callZoomSmallAvatar(context, imgUrl, targetIndex);
        Container();
      }),
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        color: const Color(0xff7c94b6),
        image: DecorationImage(
          image: NetworkImage(imgUrl), // temporarily not used
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(50.0)),
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

// Show Label widget
class ShowLabelWidget extends StatelessWidget {
  ShowLabelWidget(this.label, {Key, key}) : super(key: key);
  var label;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76.0,
      child: Padding(
        padding: const EdgeInsets.only(
            left: 8.0, top: 16.0, bottom: 10.0, right: 8.0),
        //GestureDetector!!
        child: Text(
          // GestureDetector
          label,
          maxLines: 2,
          textAlign: TextAlign.right,
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
    );
  }
}

// Show number of item
class ShowNumberOfItem extends StatelessWidget {
  ShowNumberOfItem(
    this.index, {
    Key? key,
  }) : super(key: key);
  var index;
  @override
  Widget build(BuildContext context) {
    return Text(
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
    );
  }
}

// Show item date
class ShowItemDate extends StatelessWidget {
  ShowItemDate(
    this.date, {
    Key? key,
  }) : super(key: key);
  var date;

  @override
  Widget build(BuildContext context) {
    return Text(
      date,
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
    );
  }
}

class DownDockedButton extends StatelessWidget {
  DownDockedButton(
    this.date, {
    Key? key,
  }) : super(key: key);
  var date;

  @override
  Widget build(BuildContext context) {
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
