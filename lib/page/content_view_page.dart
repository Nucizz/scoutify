import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:page_transition/page_transition.dart';
import 'package:scoutifyfe/page/scanner_page.dart';

import '../element/color_palette.dart';
import '../element/ui_appbar.dart';
import '../element/ui_navbar.dart';
import '../object/dlc.dart';

class ContentViewPage extends StatefulWidget {
  ContentViewPage({super.key, required this.content});
  Dlc content;

  @override
  State<ContentViewPage> createState() => _ContentViewPageState();
}

class _ContentViewPageState extends State<ContentViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bgcream,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Palette.bggreen,
        elevation: 0,
        title: UIAppbar(backBtn: true, title: "Content",),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.content.imagePath,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 15,
              ),
              child: Text(
                widget.content.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Palette.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Text(
                widget.content.contain,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Palette.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
