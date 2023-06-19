import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:page_transition/page_transition.dart';
import 'package:scoutifyfe/element/color_palette.dart';
import 'package:scoutifyfe/element/ui_form_submit.dart';
import 'package:scoutifyfe/page/register_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int slideIndex = 0;
  final slideCtrl = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bggreen,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset("assets/vectors/forest background.png"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Image.asset(
                    "assets/logo.png",
                    width: 100,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    "Welcome to",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Palette.white,
                      fontSize: 28,
                    ),
                  ),
                  Text(
                    "Scoutify.",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
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
            children: [
              SizedBox(
                height: 400,
                child: PageView(
                  controller: slideCtrl,
                  children: [
                    IntroView(
                      vectorPath: "assets/vectors/intro 1.png",
                      description:
                          """Hello adventurer!\nThanks for choosing Scoutify!""",
                    ),
                    IntroView(
                      vectorPath: "assets/vectors/intro 2.png",
                      description:
                          """Enjoy your next level\nadventure experience with us!""",
                    ),
                    IntroView(
                      vectorPath: "assets/vectors/intro 3.png",
                      description: """Let's begin exploring\nthe nature now!""",
                    ),
                  ],
                  onPageChanged: (value) {
                    setState(() {
                      slideIndex = value;
                    });
                  },
                ),
              ),
              SmoothPageIndicator(
                controller: slideCtrl,
                count: 3,
                effect: WormEffect(
                  activeDotColor: Palette.active,
                  dotColor: Palette.white,
                  dotHeight: 15,
                  dotWidth: 15,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 80),
            alignment: Alignment.bottomCenter,
            child: slideIndex < 2
                ? InkWell(
                    onTap: (() {
                      slideCtrl.animateToPage(
                        slideIndex + 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }),
                    child: Text(
                      "Next",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Palette.white,
                        fontSize: 20,
                      ),
                    ),
                  )
                : UIFormSubmit(
                    text: "Continue",
                    top: 0,
                    function: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: const Duration(milliseconds: 300),
                          child: const RegisterPage(),
                        ),
                      );
                    }),
          ),
        ],
      ),
    );
  }
}

class IntroView extends StatelessWidget {
  String vectorPath;
  String description;

  IntroView({super.key, required this.vectorPath, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: Palette.greenlight,
          ),
          child: Image.asset(
            vectorPath,
            width: 300,
            height: 200,
            fit: BoxFit.contain,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
          child: Text(
            description,
            style: TextStyle(
              color: Palette.white,
              fontSize: 18,
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
