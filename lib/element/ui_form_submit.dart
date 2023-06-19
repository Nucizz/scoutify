import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'color_palette.dart';

class UIFormSubmit extends StatefulWidget {
  const UIFormSubmit(
      {super.key,
      required this.text,
      required this.top,
      required this.function});
  final String text;
  final double top;
  final function;

  @override
  State<UIFormSubmit> createState() => _UIFormSubmitState();
}

class _UIFormSubmitState extends State<UIFormSubmit> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: widget.top),
      child: TextButton(
        onPressed: widget.function,
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(EdgeInsets.all(0)),
          backgroundColor: MaterialStatePropertyAll(Palette.accent),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Colors.transparent),
            ),
          ),
        ),
        child: Container(
          width: 200,
          height: 50,
          alignment: Alignment.center,
          child: Text(
            widget.text,
            style: TextStyle(
              color: Palette.grey,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
