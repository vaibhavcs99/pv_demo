import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../api/api.dart';
import '../api/short_videos.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ChewieController _chewieController;
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // _controller
    //   ..initialize().then((_) {
    //     setState(() {});
    //   });
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton:
            FloatingActionButton(onPressed: () => getVideos()),
        body: FutureBuilder<List<ShortVideos>>(
            future: getVideos(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return PageView(
                    scrollDirection: Axis.vertical,
                    children: List.generate(
                      snapshot.data?.length ?? 0,
                      (index) {
                        _controller = VideoPlayerController.network(
                            snapshot.data?[index].vimeo?.first.link ?? '')
                          // ..initialize()
                          ..play();
                        return _videoPlayer(context);
                      },
                    ));
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }

  Widget _videoPlayer(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.lightBlueAccent,
      child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: Chewie(
            controller: ChewieController(
                videoPlayerController: _controller,
                autoPlay: true,
                looping: true,
                autoInitialize: true,
                showControlsOnInitialize: false,
                showControls: true,
                allowFullScreen: true,
                fullScreenByDefault: true),
          )),
    );
  }
}
