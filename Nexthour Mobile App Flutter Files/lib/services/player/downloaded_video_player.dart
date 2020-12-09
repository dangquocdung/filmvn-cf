import 'package:flutter/material.dart';

class DownloadedVideoPlayer extends StatefulWidget {
  DownloadedVideoPlayer({this.taskId, this.name, this.fileName, this.downloadStatus});
  final String taskId;
  final String name;
  final String fileName;
  final int downloadStatus;

  @override
  _DownloadedVideoPlayerState createState() => _DownloadedVideoPlayerState();
}

class _DownloadedVideoPlayerState extends State<DownloadedVideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
