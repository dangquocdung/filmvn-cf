import 'package:flutter/material.dart';
import 'package:nexthour/common/global.dart';
import 'package:nexthour/common/route_paths.dart';
import 'package:nexthour/providers/app_config.dart';
import 'package:nexthour/providers/menu_provider.dart';
import 'package:nexthour/providers/user_profile_provider.dart';
import 'package:nexthour/ui/shared/back_press.dart';
import 'package:nexthour/ui/shared/logo.dart';
import 'package:nexthour/ui/screens/video_page.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin, RouteAware {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ScrollController _scrollViewController;
  TabController tabController;

  @override
  void initState() {
    super.initState();
    _scrollViewController = new ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      final menus = Provider.of<MenuProvider>(context, listen: false);
      tabController = TabController(
        vsync: this,
        length: menus.menuList.length,
        initialIndex: 0,
      );
    });
  }

  //  When menu length is 0.
  Widget safeAreaMenuNull() {
    return SafeArea(
      child: Scaffold(body: scaffoldBodyMenuNull()),
    );
  }

  //  Scaffold body when menu length is 0.
  Widget scaffoldBodyMenuNull() {
    return Center(
      child: Text("No data Available"),
    );
  }

  //  Sliver app bar
  Widget _sliverAppBar(innerBoxIsScrolled, myModel, menus) {
    return SliverAppBar(
      elevation: 10.0,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          logoImage(myModel, 1.4),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColorLight,
      pinned: true,
      floating: true,
      centerTitle: true,
      forceElevated: innerBoxIsScrolled,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(icon: Icon(Icons.notifications, size: 18,), splashRadius: 22, onPressed: () {
          Navigator.pushNamed(context, RoutePaths.notifications);
        })
      ],

//   Tabs used on home page
      bottom: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Color.fromRGBO(125, 183, 91, 1.0),
//        controller: tabController,
        isScrollable: true,
        tabs: List<Tab>.generate(
          menus.menuList.length,
          (int index) {
            return Tab(
              child: new Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: new Text(
                  '${menus.menuList[index].name}',
                  style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 15.0,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.9,
                      color: Colors.white),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

//  Scaffold body
  Widget _scaffoldBody(myModel, menus) {
    return NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            _sliverAppBar(innerBoxIsScrolled, myModel, menus),
          ];
        },
        body: TabBarView(
//            controller: tabController,
            children: List<Widget>.generate(menus.menuList.length, (int index) {
              menuId = menus.menuList[index].id;
              return VideosPage(
                menuId: menuId,
              );
            }),
        ),
    );
  }


  //  When menu length is not 0
  Widget safeArea(myModel, menus) {
    return SafeArea(
      child: WillPopScope(
          child: DefaultTabController(
            length: menus.menuList == null ? 0 : menus.menuList.length,
            child: Scaffold(
              key: _scaffoldKey,
              body: _scaffoldBody(myModel, menus),
            ),
          ),
          onWillPop: OnBackPress.onWillPopS),
    );
  }

  @override
  Widget build(BuildContext context) {
    var userProfile = Provider.of<UserProfileProvider>(context, listen: false);
    final menus = Provider.of<MenuProvider>(context, listen: false);
    final myModel = Provider.of<AppConfig>(context, listen: false);
    return safeArea(myModel, menus);
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    tabController.dispose();
    super.dispose();
  }
}
