import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'color_palette.dart';

class UIFormField extends StatefulWidget {
  const UIFormField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.keyboardType,
      required this.top,
      required this.suffixIcon});

  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  final double top;
  final IconData suffixIcon;

  @override
  State<UIFormField> createState() => _UIFormFieldState();
}

class _UIFormFieldState extends State<UIFormField> {
  Widget? iconSys;
  bool iconHidden = true;

  void _iconInit() {
    if (widget.suffixIcon == Icons.visibility) {
      iconSys = IconButton(
        icon: Icon(
          iconHidden == true ? Icons.visibility_off : Icons.visibility,
          color: Palette.white,
        ),
        onPressed: () {
          setState(() {
            iconHidden == true ? iconHidden = false : iconHidden = true;
          });
        },
      );
    } else if (widget.suffixIcon == Icons.abc) {
      iconSys = Icon(
        widget.suffixIcon,
        color: Palette.bggreen,
      );
      iconHidden = false;
    } else {
      iconSys = Icon(widget.suffixIcon, color: Palette.white);
      iconHidden = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    _iconInit();
    return Padding(
      padding: EdgeInsets.only(top: widget.top, left: 25, right: 25, bottom: 0),
      child: TextFormField(
        controller: widget.controller,
        style: TextStyle(
          fontSize: 16,
          color: Palette.white,
        ),
        keyboardType: widget.keyboardType,
        obscureText: iconHidden,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Palette.semi,
          ),
          contentPadding: const EdgeInsets.all(15),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Palette.white, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Palette.semi,
              width: 1,
            ),
          ),
          suffixIcon: iconSys,
          filled: true,
          fillColor: Palette.bggreen,
          focusColor: Palette.white,
        ),
      ),
    );
  }
}
