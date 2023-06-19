import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scoutifyfe/element/color_palette.dart';

class UIButtonScanner extends StatefulWidget {
  UIButtonScanner(
      {super.key, required this.icon, required this.text, required this.onTap});
  IconData icon;
  String text;
  Function onTap;  

  @override
  State<UIButtonScanner> createState() => _UIButtonScannerState();
}

class _UIButtonScannerState extends State<UIButtonScanner> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => widget.onTap),
      // onTap: (() => print("test ica 2")),     
      child: Container(
        height: 50,
        width: ((MediaQuery.of(context).size.width * 0.4)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Palette.grey,
            width: 3,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              color: Palette.grey,
              size: 30,
            ),
            Text(
              " ${widget.text}",
              style: TextStyle(
                color: Palette.grey,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ],
        ),
      )
    );
  }
}



class UIButtonScannerContainer extends StatefulWidget {
  UIButtonScannerContainer(
      {super.key, required this.icon, required this.text});
  IconData icon;
  String text;  

  @override
  State<UIButtonScannerContainer> createState() => _UIButtonScannerContainerState();
}

class _UIButtonScannerContainerState extends State<UIButtonScannerContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: ((MediaQuery.of(context).size.width * 0.4)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Palette.grey,
          width: 3,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            widget.icon,
            color: Palette.grey,
            size: 30,
          ),
          Text(
            " ${widget.text}",
            style: TextStyle(
              color: Palette.grey,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
