import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';


showAlertDialog(
      {required String title,
      required String msg,
      required String positiveBtn,
      required String negativeBtn,
      required VoidCallback function}) {
    Get.defaultDialog(
      title: title,
      middleText: msg,
      backgroundColor: Colors.white,
      titleStyle: const TextStyle(color: Colors.tealAccent),
      middleTextStyle: const TextStyle(color: Colors.black),
      textConfirm: positiveBtn,
      textCancel: negativeBtn,
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.tealAccent,
      onConfirm: function,
      barrierDismissible: true,
      radius: 50,
    );
  }
  
Future showToast({required String msg, required Color backGround}) =>
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: backGround,
        textColor: Colors.white,
        fontSize: 16.0);
