import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scoutifyfe/element/ui_popup_menu.dart';

import 'color_palette.dart';

class UIAppbar extends StatefulWidget {
  UIAppbar({super.key, this.backBtn, this.title});
  bool? backBtn;
  String? title;

  @override
  State<UIAppbar> createState() => _UIAppbarState();
}

class _UIAppbarState extends State<UIAppbar> {
  @override
  Widget build(BuildContext context) {
    widget.backBtn ??= false;
    widget.title ??= "Scoutify.";
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        widget.backBtn == false
            ? Image.asset(
                "assets/logo.png",
                width: 30,
                fit: BoxFit.contain,
              )
            : IconButton(
                onPressed: (() {
                  Navigator.pop(context);
                }),
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Palette.white,
                  size: 30,
                ),
              ),
        Text(
          widget.title!,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        const UIPopUpMenu(),
      ],
    );
  }
}
