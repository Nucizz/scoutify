import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:page_transition/page_transition.dart';
import 'package:scoutifyfe/dummy_data.dart';
import 'package:scoutifyfe/element/color_palette.dart';
import 'package:scoutifyfe/element/ui_home_content_view.dart';
import 'package:scoutifyfe/element/ui_list_content_view.dart';

import '../element/ui_appbar.dart';

class ContentListPage extends StatefulWidget {
  ContentListPage({super.key, required this.title});
  String title;

  @override
  State<ContentListPage> createState() => _ContentListPageState();
}

class _ContentListPageState extends State<ContentListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bgcream,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Palette.bggreen,
        elevation: 0,
        title: UIAppbar(
          backBtn: true,
          title: widget.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              primary: false,
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 0,
              padding: const EdgeInsets.all(20),
              children: [
                UIListContentView(content: Dummy.content1),
                UIListContentView(content: Dummy.content1),
                UIListContentView(content: Dummy.content1),
                UIListContentView(content: Dummy.content1),
                UIListContentView(content: Dummy.content1),
                UIListContentView(content: Dummy.content1),
                UIListContentView(content: Dummy.content1),
                UIListContentView(content: Dummy.content1),
                UIListContentView(content: Dummy.content1),
                UIListContentView(content: Dummy.content1),
                UIListContentView(content: Dummy.content1),
              ],
            )
          ],
        ),
      ),
    );
  }
}
