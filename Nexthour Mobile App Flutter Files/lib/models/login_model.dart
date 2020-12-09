// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:nexthour/common/apipath.dart';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel extends ChangeNotifier{
  LoginModel({
    this.tokenType,
    this.expiresIn,
    this.accessToken,
    this.refreshToken,
  });

  String tokenType;
  int expiresIn;
  String accessToken;
  String refreshToken;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    tokenType: json["token_type"],
    expiresIn: json["expires_in"],
    accessToken: json["access_token"],
    refreshToken: json["refresh_token"],
  );

  Map<String, dynamic> toJson() => {
    "token_type": tokenType,
    "expires_in": expiresIn,
    "access_token": accessToken,
    "refresh_token": refreshToken,
  };
}
