import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scoutifyfe/element/color_palette.dart';

class UINavbar extends StatefulWidget {
  const UINavbar({super.key});

  @override
  State<UINavbar> createState() => _UINavbarState();
}

class _UINavbarState extends State<UINavbar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: Palette.bggreen,
      notchMargin: 4.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.book_rounded,
              size: 30,
              color: Palette.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset(
              "assets/SOS icon.png",
              width: 30,
              fit: BoxFit.contain,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
