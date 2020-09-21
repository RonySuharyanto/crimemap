import 'package:crimemap/shared/theme.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

showFlushBar(BuildContext context, String text) {
  return Flushbar(
    icon: Icon(Icons.info_outline),
    backgroundColor: Colors.red,
    duration: Duration(seconds: 3),
    flushbarPosition: FlushbarPosition.BOTTOM,
    messageText: Text(
      text,
      style: blackTextFont.copyWith(color: Colors.white),
    ),
  )..show(context);
}
