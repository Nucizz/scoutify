import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scoutifyfe/element/ui_button_scanner.dart';
import 'package:scoutifyfe/element/ui_item_scanner_history.dart';

import '../element/color_palette.dart';
import '../element/ui_appbar.dart';
import '../element/ui_navbar.dart';

import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  bool flash = false;

  bool _isLoading=true;
  File _image = File("");
  List _output = [];
  final picker = ImagePicker();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadModel().then((value) {
      setState(() {

      });
    });
  }


  detectImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 3,
      threshold: 0.75,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _output = [];
      _output.add(output);
      _isLoading = false;
      // print("-----------------------------------------------");
      // print(_output);
    });
  }

  detectImageObjectDetection(File image) async {
    var output = await Tflite.detectObjectOnImage(
      path: image.path,
      // model: "SSDMobileNet",     
      model: "assets/model/model_unquant.tflite",
      numResultsPerClass: 2,
      threshold: 0.75,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _output = [];
      _output.add(output);
      _isLoading = false;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: 'assets/model/model_unquant.tflite',
      labels: 'assets/model/labels.txt',
    );
  }


  pickImage() async {
    var image = await picker.pickImage(source: ImageSource.camera);
    if(image == null) {
      return null;
    }

    setState(() {
      _image = File(image.path);
    });

    detectImage(_image);
  }

  pickGalleryImage() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    if(image == null) {
      return null;
    }

    setState(() {
      _image = File(image.path);
    });

    detectImage(_image);
    // detectImageObjectDetection(_image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bgcream,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Palette.bggreen,
        elevation: 0,
        title: UIAppbar(backBtn: true),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Palette.active,
        onPressed: () {
          pickImage();
        },
        child: const Icon(
          Icons.remove_red_eye_rounded,
          size: 30,
        ),
      ),
      bottomNavigationBar: const UINavbar(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              color: Palette.grey,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.65,
                    // color: Colors.white,
                    child: _isLoading ? Container() : Container(
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width,
                            color: Palette.bgcream,
                            alignment: Alignment.center,
                            // child: Text("aaa"),
                            child: _output!=null ? !_output[0].isEmpty? 
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(_output[0][0]["label"], style: const TextStyle(fontSize: 15.0),),
                                Text("Confidence Level: " + _output[0][0]["confidence"].toString(), style: const TextStyle(fontSize: 15.0),) 
                                // Text(_output[0][0]["detectedClass"], style: const TextStyle(fontSize: 15.0),),
                                // Text("Confidence Level: " + _output[0][0]["confidenceInClass"].toString(), style: const TextStyle(fontSize: 15.0),) 
                              ],
                            )
                            : const Text("Not Detected (others)", style: TextStyle(fontSize: 15.0))
                            : Container(),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.57,
                            width: MediaQuery.of(context).size.width,
                            // color: Palette.bggreen,
                            child: Image.file(_image),
                          )
                        ],
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height * 0.35,
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        color: Palette.bgcream,
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/Drag bar.png",
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "You can also do this",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Palette.grey,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      flash ? flash = false : flash = true;
                                    });
                                  },
                                  icon: Icon(
                                    flash
                                        ? Icons.flash_on_rounded
                                        : Icons.flash_off_rounded,
                                    color: Palette.grey,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              // UIButtonScanner(
                              //   icon: Icons.image_outlined,
                              //   text: "Upload Image",
                              //   onTap: () {
                              //     pickGalleryImage();
                              //   },
                              // ),
                              // const Spacer(),
                              // UIButtonScanner(
                              //   icon: Icons.book_rounded,
                              //   text: "Open Guide",
                              //   onTap: () {},
                              // ),
                              InkWell(
                                onTap: () => pickGalleryImage(),
                                child: UIButtonScannerContainer(
                                  icon: Icons.image_outlined,
                                  text: "Upload Image"
                                ),
                              ),                             
                              const Spacer(),
                              InkWell(
                                // onTap: () => print("test ica"),
                                child: UIButtonScannerContainer(
                                  icon: Icons.book_rounded,
                                  text: "Open Guide"
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "History",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Palette.grey,
                                  ),
                                ),
                                ListView(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    UIItemScannerHistory(
                                      name: "Salamander",
                                      time: 1678896692000,
                                    ),
                                    UIItemScannerHistory(
                                      name: "Giant Hornet",
                                      time: 1678755592000,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
