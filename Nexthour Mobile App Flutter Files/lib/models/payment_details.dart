// To parse this JSON data, do
//
//     final paymentDetail = paymentDetailFromJson(jsonString);
import 'dart:convert';

import 'package:flutter/foundation.dart';

PaymentDetail paymentDetailFromJson(String str) => PaymentDetail.fromJson(json.decode(str));

String paymentDetailToJson(PaymentDetail data) => json.encode(data.toJson());

class PaymentDetail extends ChangeNotifier{
  PaymentDetail({
    this.key,
    this.pass,
    this.paystack,
    this.razorkey,
    this.razorpass,
    this.paytmkey,
    this.paytmpass,
  });

  String key;
  String pass;
  String paystack;
  String razorkey;
  String razorpass;
  String paytmkey;
  String paytmpass;

  factory PaymentDetail.fromJson(Map<String, dynamic> json) => PaymentDetail(
    key: json["key"],
    pass: json["pass"],
    paystack: json["paystack"],
    razorkey: json["razorkey"],
    razorpass: json["razorpass"],
    paytmkey: json["paytmkey"],
    paytmpass: json["paytmpass"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "pass": pass,
    "paystack": paystack,
    "razorkey": razorkey,
    "razorpass": razorpass,
    "paytmkey": paytmkey,
    "paytmpass": paytmpass,
  };
}
