import 'package:flutter/material.dart';
import 'package:nexthour/providers/login_provider.dart';
import 'package:nexthour/providers/menu_data_provider.dart';
import 'package:nexthour/ui/shared/actors_horizontal_list.dart';
import 'package:nexthour/ui/shared/heading1.dart';
import 'package:nexthour/ui/shared/image_slider.dart';
import 'package:nexthour/ui/screens/horizental_genre_list.dart';
import 'package:nexthour/ui/screens/horizontal_movies_list.dart';
import 'package:nexthour/ui/screens/horizontal_tvseries_list.dart';
import 'package:nexthour/ui/screens/top_video_list.dart';
import 'package:nexthour/ui/shared/live_video_list.dart';
import 'package:nexthour/ui/widgets/blog_view.dart';
import 'package:provider/provider.dart';

class VideosPage extends StatefulWidget {
  VideosPage({Key key, this.menuId}) : super(key: key);
  final menuId;

  @override
  _VideosPageState createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  GlobalKey _keyRed = GlobalKey();
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  var meData;
  ScrollController controller;
  bool _visible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = ScrollController(initialScrollOffset: 50.0);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    try{
      MenuDataProvider menuDataProvider =
      Provider.of<MenuDataProvider>(context, listen: false);
      await menuDataProvider.getMenusData(context, widget.menuId);
    }catch (err){
//     print(err.toString());
    return null;
    }
    if(mounted){
      setState(() {
        _visible = true;
      });
    }
    });
  }

  Future<Null> refreshList() async {
    refreshKey.currentState?.show();
    await Future.delayed(Duration(seconds: 2));
//    getMenuData();
  }

  @override
  Widget build(BuildContext context) {
    var login = Provider.of<LoginProvider>(context);
    var menuDataList = Provider.of<MenuDataProvider>(context).menuDataList;
    var moviesList = Provider.of<MenuDataProvider>(context).menuCatMoviesList;
    var tvSeriesList = Provider.of<MenuDataProvider>(context).menuCatTvSeriesList;
    return Container(
      child: _visible == false
          ? Center(
              child: CircularProgressIndicator(),
            )
          : menuDataList.length == 0 ? Center(child: Text("No data available", style: TextStyle(fontSize: 16.0),),): Container(
              child: SingleChildScrollView(
                child: Column(
                  key: _keyRed,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ImageSlider(),
                    SizedBox(
                      height: 15.0,
                    ),
                    HorizontalGenreList(),
                    SizedBox(
                      height: 15.0,
                    ),
                    Heading1("Artist", "Actor"),
                    SizedBox(
                      height: 15.0,
                    ),
                    ActorsHorizontalList(),
                    SizedBox(
                      height: 15.0,
                    ),
                    Heading1("Top Movies & TV Series", "Top"),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      height: 140,
                      child: TopVideoList(),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Heading2("LIVE", "Live"),
                    SizedBox(
                      height: 15.0,
                    ),
                    LiveVideoList(),
                    SizedBox(
                      height: 15.0,
                    ),
                    tvSeriesList.length == 0
                        ? SizedBox.shrink()
                        : Heading1("TV Series", "TV"),
                    TvSeriesList(),
                    SizedBox(
                      height: 15.0,
                    ),
                    moviesList.length == 0
                        ? SizedBox.shrink()
                        : Heading1("Movies", "Mov"),
                    MoviesList(),
                    SizedBox(
                      height: 15.0,
                    ),
                    Heading1("Our Blog Posts", "Blog"),
                    SizedBox(
                      height: 15.0,
                    ),
                    BlogView(),
                  ],
                ),
              ),
            ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
