import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nexthour/common/apipath.dart';
import 'package:nexthour/models/actor_movies_details.dart';
import 'package:nexthour/models/datum.dart';
import 'package:nexthour/models/genre_model.dart';
import 'package:nexthour/providers/main_data_provider.dart';
import 'package:nexthour/providers/movie_tv_provider.dart';
import 'package:provider/provider.dart';

class ActorMoviesProvider with ChangeNotifier {
  ActorMoviesDetails actorMoviesDetails;
  List<Datum> actorMoviesList = [];
  bool loading;

  Future<ActorMoviesDetails> getActorsMovies(BuildContext context, String id) async {
    var movieTvList = Provider.of<MovieTVProvider>(context, listen: false).movieTvList;
    var genreList = Provider.of<MainProvider>(context, listen: false).genreList;
    var actorList = Provider.of<MainProvider>(context, listen: false).actorList;
    var directorList = Provider.of<MainProvider>(context, listen: false).directorList;
    var audioList = Provider.of<MainProvider>(context, listen: false).audioList;
    loading = true;
    actorMoviesList = [];
    try {
      final response = await http.get("${APIData.actorMovies}$id", headers: {
        "Accept" : "application/json"
      });
      if(response.statusCode == 200){
        actorMoviesDetails = ActorMoviesDetails.fromJson(json.decode(response.body));
        for(int i=0; i<movieTvList.length; i++){
          for(int j=0; j<actorMoviesDetails.actormovies.length; j++ ){
            if("${movieTvList[i].type}" == "${actorMoviesDetails.actormovies[j].type}"){
              if("${movieTvList[i].id}" == "${actorMoviesDetails.actormovies[j].id}"){
                var genreData = actorMoviesList[i].genreId == null ? null : actorMoviesList[i].genreId.split(",").toList();
                var actors = actorMoviesList[i].actorId == null ? null : actorMoviesList[i].actorId.split(",").toList();
                var audios = actorMoviesList[i].aLanguage == null ? null : actorMoviesList[i].aLanguage.split(",").toList();
                var directors = actorMoviesList[i].directorId == null ? null : actorMoviesList[i].directorId.split(",").toList();
                actorMoviesList.add(Datum(
                  id: actorMoviesList[i].id,
                  tmdbId: actorMoviesList[i].tmdbId,
                  title: actorMoviesList[i].title,
                  keyword: actorMoviesList[i].keyword,
                  description: actorMoviesList[i].description,
                  duration: actorMoviesList[i].duration,
                  thumbnail: actorMoviesList[i].thumbnail,
                  poster: actorMoviesList[i].poster,
                  tmdb: actorMoviesList[i].tmdb,
                  fetchBy: actorMoviesList[i].fetchBy,
                  directorId: actorMoviesList[i].directorId,
                  actorId: actorMoviesList[i].actorId,
                  genreId: actorMoviesList[i].genreId,
                  trailerUrl: actorMoviesList[i].trailerUrl,
                  detail: actorMoviesList[i].detail,
                  rating: actorMoviesList[i].rating,
                  maturityRating: actorMoviesList[i].maturityRating,
                  subtitle: actorMoviesList[i].subtitle,
                  subtitleList: actorMoviesList[i].subtitleList,
                  subtitleFiles: actorMoviesList[i].subtitleFiles,
                  publishYear: actorMoviesList[i].publishYear,
                  released: actorMoviesList[i].released,
                  uploadVideo: actorMoviesList[i].updatedAt,
                  featured: actorMoviesList[i].featured,
                  series: actorMoviesList[i].series,
                  aLanguage: actorMoviesList[i].aLanguage,
                  audioFiles: actorMoviesList[i].audioFiles,
                  type: actorMoviesList[i].type,
                  live: actorMoviesList[i].live,
                  status: actorMoviesList[i].status,
                  createdBy: actorMoviesList[i].createdBy,
                  createdAt: actorMoviesList[i].createdAt,
                  updatedAt: actorMoviesList[i].updatedAt,
                  userRating: actorMoviesList[i].userRating,
                  movieSeries: actorMoviesList[i].movieSeries,
                  videoLink: actorMoviesList[i].videoLink,
                  comments: actorMoviesList[i].comments,
                  episodeRuntime: actorMoviesList[i].episodeRuntime,
                  seasons: actorMoviesList[i].seasons,
                  genre: List.generate(genreData == null ? 0 : genreData.length,
                          (int genreIndex) {
                        return "${genreData[genreIndex]}";
                      }),
                  genres: List.generate(genreList.length, (int gIndex) {
                    var genreId2 = genreList[gIndex].id.toString();
                    var genreNameList = List.generate(genreData == null ? 0 : genreData.length,
                            (int nameIndex) {
                          return "${genreData[nameIndex]}";
                        });
                    var isAv2 = 0;
                    for (var y in genreNameList) {
                      if (genreId2 == y) {
                        isAv2 = 1;
                        break;
                      }
                    }
                    if (isAv2 == 1) {
                      if (genreList[gIndex].name == null) {
                        return null;
                      } else {
                        return "${genreList[gIndex].name}";
                      }
                    }
                    return null;
                  }),
                  actor: List.generate(actors == null ? 0 : actors.length,
                          (int aIndex) {
                        return "${actors[aIndex]}";
                      }),
                  actors: List.generate(actorList.length, (actIndex) {
                    var actorsId = actorList[actIndex].id.toString();
                    var actorsIdList = List.generate(actors == null ? 0 : actors.length,
                            (int idIndex) {
                          return "${actors[idIndex]}";
                        });
                    var isAv2 = 0;
                    for (var y in actorsIdList) {
                      if (actorsId == y) {
                        isAv2 = 1;
                        break;
                      }
                    }
                    if (isAv2 == 1) {
                      if (actorList[actIndex].name == null) {
                        return null;
                      } else {
                        return Actor(
                          id: actorList[actIndex].id,
                          name: actorList[actIndex].name,
                          image: actorList[actIndex].image,
                          biography: actorList[actIndex].biography,
                          placeOfBirth: actorList[actIndex].placeOfBirth,
                          dob: actorList[actIndex].dob,
                          createdAt: actorList[actIndex].createdAt,
                          updatedAt: actorList[actIndex].updatedAt,
                        );
                      }
                    }
                    return null;
                  }),
                  directors: List.generate(directorList.length, (actIndex) {
                    var directorsId = directorList[actIndex].id.toString();
                    var actorsIdList = List.generate(directors == null ? 0 : directors.length,
                            (int idIndex) {
                          return "${directors[idIndex]}";
                        });
                    var isAv2 = 0;
                    for (var y in actorsIdList) {
                      if (directorsId == y) {
                        isAv2 = 1;
                        break;
                      }
                    }
                    if (isAv2 == 1) {
                      if (directorList[actIndex].name == null) {
                        return null;
                      } else {
                        return Director(
                          id: directorList[actIndex].id,
                          name: directorList[actIndex].name,
                          image: directorList[actIndex].image,
                          biography: directorList[actIndex].biography,
                          placeOfBirth: directorList[actIndex].placeOfBirth,
                          dob: directorList[actIndex].dob,
                          createdAt: directorList[actIndex].createdAt,
                          updatedAt: directorList[actIndex].updatedAt,
                        );
                      }
                    }
                    return null;
                  }),
                  audios: List.generate(audioList.length, (actIndex) {
                    var actorsId = audioList[actIndex].id.toString();
                    var audioIdList = List.generate(audios == null ? 0 : audios.length,
                            (int idIndex) {
                          return "${audios[idIndex]}";
                        });
                    var isAv2 = 0;
                    for (var y in audioIdList) {
                      if (actorsId == y) {
                        isAv2 = 1;
                        break;
                      }
                    }
                    if (isAv2 == 1) {
                      if (audioList[actIndex].language == null) {
                        return null;
                      } else {
                        return "${audioList[actIndex].language}";
                      }
                    }
                    return null;
                  }),
                ));
              }
            }
          }
        }
        loading = false;
      }else{
        throw "Can't get actor movies data";
      }
      notifyListeners();
      return actorMoviesDetails;
    } catch (error){
      throw error;
    }
  }
}