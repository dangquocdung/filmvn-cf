import 'package:flutter/material.dart';
import 'package:nexthour/common/apipath.dart';

//    Logo image on login page
Widget logoImage(myModel, scale) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 15.0, left: 20.0),
        child: Container(
          child: Image.network(
            '${APIData.logoImageUri}${myModel.appModel.config.logo}',
            scale: scale,
          ),
        ),
      )
    ],
  );
}
