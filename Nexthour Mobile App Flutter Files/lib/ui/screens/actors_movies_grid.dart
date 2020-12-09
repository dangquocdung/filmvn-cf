import 'package:flutter/material.dart';
import 'package:nexthour/common/apipath.dart';
import 'package:nexthour/common/route_paths.dart';
import 'package:nexthour/models/datum.dart';
import 'package:nexthour/models/episode.dart';
import 'package:nexthour/models/genre_model.dart';
import 'package:nexthour/providers/actor_movies_provider.dart';
import 'package:nexthour/ui/screens/video_detail_screen.dart';
import 'package:nexthour/ui/shared/appbar.dart';
import 'package:nexthour/ui/shared/blank_history.dart';
import 'package:provider/provider.dart';

class ActorMoviesGrid extends StatefulWidget {
  ActorMoviesGrid(this.actorDetails);
  final Actor actorDetails;

  @override
  _ActorMoviesGridState createState() => _ActorMoviesGridState();
}

class _ActorMoviesGridState extends State<ActorMoviesGrid> {
  List<Widget> videoList;
  bool _visible = false;


  @override
  void initState() {
    super.initState();
    setState(() {
      _visible = false;
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      await Provider.of<ActorMoviesProvider>(context, listen: false).getActorsMovies(context, widget.actorDetails.id.toString());
      setState(() {
        _visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var actorsList = Provider.of<ActorMoviesProvider>(context).actorMoviesList;
    return Scaffold(
      appBar: customAppBar(context, ""),
      body: _visible == false ? Center(child: CircularProgressIndicator(),) : actorsList.length == 0 ? NoMovies() : Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: GridView.builder(
            itemCount: actorsList.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 5/20
            ),
            itemBuilder: (BuildContext context, int index){
              return Column(
                children: [
                  Container(
                    height: 160,
                    width: 110,
                    child: Material(
                      borderRadius: new BorderRadius.circular(10.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10.0),
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(10.0),
                          child: FadeInImage.assetNetwork(
                            image: actorsList[index].type == DatumType.M ?
                            "${APIData.movieImageUri}${actorsList[index].thumbnail}" :
                            "${APIData.tvImageUriTv}${actorsList[index].thumbnail}",
                            placeholder: "assets/placeholder_box.jpg",
                            imageScale: 1.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, RoutePaths.videoDetail, arguments: VideoDetailScreen(actorsList[index]));
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }
}
