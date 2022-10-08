import 'dart:ffi';

import 'package:flutter/material.dart';

class ExpandedText extends StatefulWidget {
  final String text;
  final TextStyle style;
  const ExpandedText({super.key, required this.text, required this.style});

  @override
  State<ExpandedText> createState() => _ExpandedTextState();
}

class _ExpandedTextState extends State<ExpandedText> {
  late String firstHalf;
  late String secondHalf;
  bool flag = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.text.length > 200) {
      firstHalf = "${widget.text.substring(0, 200)}...";
      secondHalf = widget.text.substring(201, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
          onTap: (() => setState(() {
                flag = !flag;
              })),
          child: Center(
            child: Container(
              height: 280.0,
              child: Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                    flag ? firstHalf : widget.text,
                    style: widget.style,
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
