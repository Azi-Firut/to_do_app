import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_check_box/custom_check_box.dart';

toDoRow(item, index) {
  const shadowOffsetY = 4.0;
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.black.withOpacity(0.4),
          Colors.indigo.withOpacity(0.1),
          Colors.transparent,
          // Colors.transparent,
          // Colors.transparent,
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
              // color: const Color(0xff7c94b6),
              // // image: const DecorationImage(
              // //   image: AssetImage('assets/bg_header.png'),  // temporarily not used
              // //   fit: BoxFit.cover,
              // // ),
              borderRadius: BorderRadius.all(Radius.circular(50)),
              // border: Border.all(
              //   color: Colors.white,
              //   width: 4.0,
              // ),
              boxShadow: [
                BoxShadow(
                  spreadRadius: -11,
                  color: Colors.grey,
                  offset: Offset(0.0, shadowOffsetY), //(x,y)
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
            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
            border: Border.all(
              color: Colors.white,
              width: 4.0,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, shadowOffsetY), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
          child: Text(
            "${++index}. $item ",
            style: const TextStyle(
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
      ],
    ),
  );
}
