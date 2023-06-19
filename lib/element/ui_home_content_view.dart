import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:page_transition/page_transition.dart';
import 'package:scoutifyfe/page/content_view_page.dart';

import '../object/dlc.dart';
import 'color_palette.dart';

class UIHomeContentView extends StatefulWidget {
  UIHomeContentView({super.key, required this.content});
  Dlc content;

  @override
  State<UIHomeContentView> createState() => _UIHomeContentViewState();
}

class _UIHomeContentViewState extends State<UIHomeContentView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              duration: const Duration(milliseconds: 300),
              child: ContentViewPage(content: widget.content),
            ),
          );
        },
        child: SizedBox(
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  widget.content.imagePath,
                  width: 150,
                  height: 110,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                widget.content.title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Palette.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
