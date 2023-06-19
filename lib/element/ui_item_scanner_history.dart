import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scoutifyfe/element/color_palette.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:scoutifyfe/element/ui_functions.dart';

class UIItemScannerHistory extends StatefulWidget {
  UIItemScannerHistory({super.key, required this.name, required this.time});
  String name;
  int time;

  @override
  State<UIItemScannerHistory> createState() => _UIItemScannerHistoryState();
}

class _UIItemScannerHistoryState extends State<UIItemScannerHistory> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.name,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Palette.grey,
          ),
        ),
        Text(
          Functions.getEstimationByTimeAgo(DateTime(widget.time)),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Palette.grey,
          ),
        ),
      ],
    );
  }
}
