import 'package:flutter/material.dart';
import 'logo.dart';
import 'wavy_header_image.dart';

Widget stickyHeader(myModel) {
  return Stack(
    children: <Widget>[
      Container(
        margin: new EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
        child: WavyHeaderImage2(),
      ),
      Container(
        margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        child: WavyHeaderImage(),
      ),
      logoImage(myModel, 0.9),
    ],
  );
}
