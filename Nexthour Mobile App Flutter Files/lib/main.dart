import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'common/global.dart';
import 'my_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  FlutterDownloader.initialize();
  authToken = await storage.read(key: "token");
  runApp(MyApp(token: authToken,));
}

