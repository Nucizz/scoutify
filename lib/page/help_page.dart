import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

import '../element/color_palette.dart';
import '../element/ui_appbar.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
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
          title: "Help Center",
        ),
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/Help icon.png",
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                    "Help Center",
                    style: TextStyle(
                      color: Palette.grey,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Hi, do you need help?",
                  style: TextStyle(
                    color: Palette.grey,
                    fontSize: 16,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Palette.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      children: ListTile.divideTiles(
                        context: context,
                        tiles: [
                          HelpItem(
                            title: "How to download content?",
                            link:
                                "https://www.drifted.com/assetto-corsa-content-manager/",
                          ),
                          HelpItem(
                            title: "How to download content?",
                            link:
                                "https://www.drifted.com/assetto-corsa-content-manager/",
                          ),
                          HelpItem(
                            title: "How to download content?",
                            link:
                                "https://www.drifted.com/assetto-corsa-content-manager/",
                          ),
                          HelpItem(
                            title: "How to download content?",
                            link:
                                "https://www.drifted.com/assetto-corsa-content-manager/",
                          ),
                          HelpItem(
                            title: "How to download content?",
                            link:
                                "https://www.drifted.com/assetto-corsa-content-manager/",
                          ),
                        ],
                        color: Palette.grey,
                      ).toList(),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class HelpItem extends StatelessWidget {
  HelpItem({super.key, required this.title, required this.link});
  String title;
  String link;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final uri = Uri.parse(link);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        } else {
          throw 'Could not launch $link';
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Text(
          title,
          style: TextStyle(
            color: Palette.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
