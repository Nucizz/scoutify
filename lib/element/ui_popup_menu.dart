import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:page_transition/page_transition.dart';
import 'package:scoutifyfe/page/help_page.dart';
import 'package:scoutifyfe/page/login_page.dart';
import 'package:scoutifyfe/page/register_page.dart';

import 'color_palette.dart';

class UIPopUpMenu extends StatefulWidget {
  const UIPopUpMenu({super.key});

  @override
  State<UIPopUpMenu> createState() => _UIPopUpMenuState();
}

class _UIPopUpMenuState extends State<UIPopUpMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(
        Icons.menu_rounded,
        color: Palette.white,
        size: 30,
      ),
      onSelected: (value) {
        setState(() {
          switch (value) {
            case 1:
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  duration: const Duration(milliseconds: 300),
                  child: const HelpPage(),
                ),
              );
              break;
            case 2:
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const RegisterPage()),
                  ModalRoute.withName('/'));
              break;
            default:
          }
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem(
            value: 0,
            child: MenuItem(icon: Icons.close_rounded, text: "Close")),
        PopupMenuItem(
            value: 1, child: MenuItem(icon: Icons.help_rounded, text: "Help")),
        PopupMenuItem(
            value: 2,
            child: MenuItem(icon: Icons.logout_rounded, text: "Logout")),
      ],
    );
  }
}

// ignore: must_be_immutable
class MenuItem extends StatelessWidget {
  MenuItem({super.key, required this.icon, required this.text});
  IconData icon;
  String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Palette.bggreen,
          size: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Palette.greenlight,
            ),
            textAlign: TextAlign.start,
          ),
        )
      ],
    );
  }
}
