import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:nexthour/common/apipath.dart';
import 'package:nexthour/common/route_paths.dart';
import 'package:nexthour/common/global.dart';
import 'package:nexthour/providers/app_config.dart';
import 'package:nexthour/providers/login_provider.dart';
import 'package:nexthour/providers/main_data_provider.dart';
import 'package:nexthour/providers/menu_provider.dart';
import 'package:nexthour/providers/movie_tv_provider.dart';
import 'package:nexthour/providers/slider_provider.dart';
import 'package:nexthour/providers/user_profile_provider.dart';
import 'package:nexthour/ui/screens/multi_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({this.token});

  final String token;

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  bool _flexibleUpdateAvailable = false;
  AppUpdateInfo _updateInfo;
  bool _visible = false;

  Future<void> checkForUpdate() async {
    InAppUpdate.checkForUpdate().then((info) {
      setState(() {
        _updateInfo = info;
      });
    }).catchError((e) => _showError(e));
    if(_updateInfo.updateAvailable){
      InAppUpdate.startFlexibleUpdate().then((_) {
        setState(() {
          _flexibleUpdateAvailable = true;
        });
      }).catchError((e) => _showError(e));
    }
    if(!_flexibleUpdateAvailable){
      InAppUpdate.completeFlexibleUpdate().then((_) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Success!')));
      }).catchError((e) => _showError(e));
    }
  }

  void _showError(dynamic exception) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(exception.toString())));
  }

  @override
  void initState() {
    super.initState();
//   In app update and it works only in live mode after deploying on PlayStore
//    checkForUpdate();
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        checkLoginStatus();
      });
  }

  Widget logoImage(myModel) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Image.asset('assets/logo.png',
            width: 250.0,
            height: 200.0,
          ),
        )
      ],
    );
  }

  Future checkLoginStatus() async {
    final appConfig = Provider.of<AppConfig>(context, listen: false);
    await appConfig.getHomeData(context);
    final all = await storage.read(key: "login");
    if (all == "true") {
      var token = await storage.read(key: "authToken");
      setState(() {
        authToken = token;
      });
      final menuProvider = Provider.of<MenuProvider>(context, listen: false);
      final userProfileProvider = Provider.of<UserProfileProvider>(
          context, listen: false);
      final mainProvider = Provider.of<MainProvider>(context, listen: false);
      final sliderProvider = Provider.of<SliderProvider>(
          context, listen: false);
      final movieTVProvider = Provider.of<MovieTVProvider>(
          context, listen: false);
      await userProfileProvider.getUserProfile();
      await menuProvider.getMenus();
      await sliderProvider.getSlider();
      await mainProvider.getMainApiData(context);
      await movieTVProvider.getMoviesTVData(context);
        var userDetails = Provider.of<UserProfileProvider>(context, listen: false);

        if(userDetails.userProfileModel.active == "1" || userDetails.userProfileModel.active == 1){
          var activeScreen = await storage.read(key: "activeScreen");
          if(activeScreen == null){
            Navigator.pushNamed(context, RoutePaths.multiScreen);
          }else{
            setState(() {
              myActiveScreen = activeScreen;
            });
            getAllScreens();
            Navigator.pushNamed(context, RoutePaths.bottomNavigationHome);
          }
        }else{
          Navigator.pushNamed(context, RoutePaths.bottomNavigationHome);
        }
    } else {
      if(appConfig.slides.length == 0){
        Navigator.pushNamed(context, RoutePaths.loginHome);
      }else{
        Navigator.pushNamed(context, RoutePaths.introSlider);
      }
    }
    setState(() {
      _visible = true;
    });
  }

  Future<String> getAllScreens() async {
    final getAllScreensResponse = await http.get(Uri.encodeFull(APIData.showScreensApi), headers: {
      HttpHeaders.authorizationHeader: "Bearer $authToken",
      "Accept" : "application/json"
    });
    if(getAllScreensResponse.statusCode == 200){
      var screensRes = json.decode(getAllScreensResponse.body);
      setState(() {
        screen1 = screensRes['screen']['screen1'] == null ? "Screen1" : screensRes['screen']['screen1'];
        screen2 = screensRes['screen']['screen2'] == null ? "Screen2" : screensRes['screen']['screen2'];
        screen3 = screensRes['screen']['screen3'] == null ? "Screen3" : screensRes['screen']['screen3'];
        screen4 = screensRes['screen']['screen4'] == null ? "Screen4" : screensRes['screen']['screen4'];

        activeScreen = screensRes['screen']['activescreen'];
        screenUsed1 = screensRes['screen']['screen_1_used'];
        screenUsed2 = screensRes['screen']['screen_2_used'];
        screenUsed3 = screensRes['screen']['screen_3_used'];
        screenUsed4 = screensRes['screen']['screen_4_used'];
        screenList = [
          ScreenProfile(0, screen1, screenUsed1),
          ScreenProfile(1, screen2, screenUsed2),
          ScreenProfile(2, screen3, screenUsed3),
          ScreenProfile(3, screen4, screenUsed4),
        ];
      });

    }else if(getAllScreensResponse.statusCode == 401){
      storage.deleteAll();
      Navigator.pushNamed(context, RoutePaths.login);
    }
    else{
      throw "Can't get screens data";
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    final myModel = Provider.of<AppConfig>(context, listen: false);
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          logoImage(myModel),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
