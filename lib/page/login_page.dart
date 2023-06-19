import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:page_transition/page_transition.dart';
import 'package:scoutifyfe/element/ui_form_field.dart';
import 'package:scoutifyfe/element/ui_form_submit.dart';
import 'package:scoutifyfe/page/home_page.dart';

import '../dummy_data.dart';
import '../element/color_palette.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController unameCtrl = TextEditingController();
  TextEditingController pwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Palette.bggreen,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset("assets/vectors/forest background.png"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Image.asset(
                    "assets/logo.png",
                    width: 100,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Palette.white,
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UIFormField(
                controller: unameCtrl,
                hintText: "Usename",
                keyboardType: TextInputType.name,
                suffixIcon: Icons.abc,
                top: 100,
              ),
              UIFormField(
                controller: pwordCtrl,
                hintText: "Password",
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: Icons.visibility,
                top: 15,
              ),
              UIFormSubmit(
                  text: "LOGIN",
                  top: 60,
                  function: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        duration: const Duration(milliseconds: 300),
                        child: HomePage(user: Dummy.user1),
                      ),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Palette.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Palette.accent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
