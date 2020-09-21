import 'package:crimemap/shared/theme.dart';
import 'package:flutter/material.dart';

class ButtonForm extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color color;

  ButtonForm({this.onPressed, this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: FlatButton(
        onPressed: onPressed,
        child: Text(text, style: blackTextFont),
        color: color,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(20),
      ),
    );
  }
}
