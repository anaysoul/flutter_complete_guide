import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveButton extends StatelessWidget {
  final String text;
  final Function handler;

  AdaptiveButton(this.text, this.handler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: handler,
            child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
          )
        : TextButton(
            onPressed: handler,
            child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
            style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.purpleAccent)));
  }
}
