import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:scoutifyfe/dummy_data.dart';
import 'package:scoutifyfe/element/color_palette.dart';
import 'package:scoutifyfe/element/ui_appbar.dart';
import 'package:scoutifyfe/element/ui_home_content_view.dart';
import 'package:scoutifyfe/element/ui_navbar.dart';
import 'package:scoutifyfe/element/ui_popup_menu.dart';
import 'package:scoutifyfe/page/content_list_page.dart';
import 'package:scoutifyfe/page/scanner_page.dart';

import '../element/ui_functions.dart';
import '../object/user.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.user});
  User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double distance = 0.0;
  late int steps = 0;
  late double calories = 0.0;

  static const LatLng _kMapCenter = LatLng(-6.2088, 106.8456);

  static const CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);

  @override
  void initState() {
    requestPermission();
    super.initState();
  }

  Future<void> requestPermission() async {
    await Permission.location.request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bgcream,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Palette.bggreen,
        elevation: 0,
        title: UIAppbar(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Palette.active,
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              duration: const Duration(milliseconds: 300),
              child: const ScannerPage(),
            ),
          );
        },
        child: const Icon(
          Icons.remove_red_eye_rounded,
          size: 30,
        ),
      ),
      bottomNavigationBar: const UINavbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 100),
                  height: 350,
                  color: Palette.grey,
                  width: double.infinity,
                  child: const GoogleMap(
                    initialCameraPosition: _kInitialPosition,
                    zoomControlsEnabled: false,
                    compassEnabled: true,
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  height: 125,
                  decoration: BoxDecoration(
                    color: Palette.greenlight,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          widget.user.imagePath != null
                              ? widget.user.imagePath!
                              : "assets/profile.png",
                          fit: BoxFit.cover,
                          width: 70,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Functions.getGreetingByTime(),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Palette.white,
                              ),
                            ),
                            Text(
                              widget.user.username,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Palette.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 325, left: 15, right: 15),
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    height: 150,
                    decoration: BoxDecoration(
                      color: Palette.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0,
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/Steps icon.png",
                              width: 32,
                              fit: BoxFit.contain,
                            ),
                            Row(
                              children: [
                                Text(
                                  "$distance",
                                  style: const TextStyle(
                                    fontSize: 36,
                                    fontFamily: 'whiteMountainView body2',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Text(
                                  " Km",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "$steps",
                                  style: const TextStyle(
                                    fontSize: 36,
                                    fontFamily: 'whiteMountainView body2',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Text(
                                  " Steps",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/Ccal icon.png",
                              width: 30,
                              fit: BoxFit.contain,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 55),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "$calories",
                                    style: const TextStyle(
                                      fontSize: 36,
                                      fontFamily: 'whiteMountainView body2',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Text(
                                    " Ccal",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                top: 15,
                bottom: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "For You",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Palette.grey,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: const Duration(milliseconds: 300),
                          child: ContentListPage(
                            title: "For You",
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  UIHomeContentView(content: Dummy.content1),
                  UIHomeContentView(content: Dummy.content1),
                  UIHomeContentView(content: Dummy.content1),
                  UIHomeContentView(content: Dummy.content1),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                top: 15,
                bottom: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Saved Contents",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Palette.grey,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: const Duration(milliseconds: 300),
                          child: ContentListPage(
                            title: "Saved Contents",
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  UIHomeContentView(content: Dummy.content1),
                  UIHomeContentView(content: Dummy.content1),
                  UIHomeContentView(content: Dummy.content1),
                  UIHomeContentView(content: Dummy.content1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
