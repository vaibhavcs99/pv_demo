import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pv_demo/api/short_videos.dart';

Future<List<ShortVideos>> getVideos() async {
  try {
    var response =
        await Dio().get('https://www.xynie.com/feeds/short-videos-app/page/0');
        print('###### api ${response.data}');
    return shortVideosFromJson(response.data);
  } catch (e) {
    print(e);
print('###### error ${e}');
    throw e;
  }
}
