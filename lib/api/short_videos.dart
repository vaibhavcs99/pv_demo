// To parse this JSON data, do
//
//     final shortVideos = shortVideosFromJson(jsonString);

import 'dart:convert';

List<ShortVideos> shortVideosFromJson(String? str) => List<ShortVideos>.from(
    json.decode(str!).map((x) => ShortVideos.fromJson(x)));

String? shortVideosToJson(List<ShortVideos> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShortVideos {
  ShortVideos({
    this.title,
    this.nid,
    this.type,
    this.shortVideoId,
    this.imageUrl,
    this.orignalImageUrl,
    this.sectionImage,
    this.videoImageurlLandscape,
    this.postDateUnix,
    this.path,
    this.description,
    this.viewCount,
    this.viewCountFormat,
    this.postDateStr,
    this.commentCount,
    this.fieldUaeMicrositeCategories,
    this.fieldUaeMicrositeFeaturedArt,
    this.vimeo,
  });

  String? title;
  String? nid;
  ShortVideoType? type;
  String? shortVideoId;
  String? imageUrl;
  String? orignalImageUrl;
  String? sectionImage;
  String? videoImageurlLandscape;
  String? postDateUnix;
  String? path;
  String? description;
  int? viewCount;
  String? viewCountFormat;
  PostDateStr? postDateStr;
  String? commentCount;
  String? fieldUaeMicrositeCategories;
  String? fieldUaeMicrositeFeaturedArt;
  List<Vimeo>? vimeo;

  factory ShortVideos.fromJson(Map<String?, dynamic> json) => ShortVideos(
        title: json["title"],
        nid: json["nid"],
        type: shortVideoTypeValues.map[json["type"]],
        shortVideoId: json["short_video_id"],
        imageUrl: json["imageUrl"],
        orignalImageUrl: json["orignal_imageUrl"],
        sectionImage: json["section_image"],
        videoImageurlLandscape: json["video_imageurl_landscape"],
        postDateUnix: json["postDateUnix"],
        path: json["path"],
        description: json["description"],
        viewCount: json["viewCount"],
        viewCountFormat: json["viewCountFormat"],
        postDateStr: postDateStrValues.map[json["postDateStr"]],
        commentCount: json["commentCount"],
        fieldUaeMicrositeCategories: json["field_uae_microsite_categories"],
        fieldUaeMicrositeFeaturedArt: json["field_uae_microsite_featured_art"],
        vimeo: List<Vimeo>.from(json["vimeo"].map((x) => Vimeo.fromJson(x))),
      );

  Map<String?, dynamic> toJson() => {
        "title": title,
        "nid": nid,
        "type": shortVideoTypeValues.reverse[type],
        "short_video_id": shortVideoId,
        "imageUrl": imageUrl,
        "orignal_imageUrl": orignalImageUrl,
        "section_image": sectionImage,
        "video_imageurl_landscape": videoImageurlLandscape,
        "postDateUnix": postDateUnix,
        "path": path,
        "description": description,
        "viewCount": viewCount,
        "viewCountFormat": viewCountFormat,
        "postDateStr": postDateStrValues.reverse[postDateStr],
        "commentCount": commentCount,
        "field_uae_microsite_categories": fieldUaeMicrositeCategories,
        "field_uae_microsite_featured_art": fieldUaeMicrositeFeaturedArt,
        "vimeo": List<dynamic>.from(vimeo!.map((x) => x.toJson())),
      };
}

enum PostDateStr { THE_1_M_AGO }

final postDateStrValues = EnumValues({"1m ago": PostDateStr.THE_1_M_AGO});

enum ShortVideoType { SHORT_VIDEO }

final shortVideoTypeValues =
    EnumValues({"Short Video": ShortVideoType.SHORT_VIDEO});

class Vimeo {
  Vimeo({
    this.quality,
    this.type,
    this.width,
    this.height,
    this.link,
    this.createdTime,
    this.fps,
    this.size,
    this.md5,
    this.publicName,
    this.sizeShort,
    this.linkSecure,
    this.url,
    this.profile,
  });

  PublicName? quality;
  VimeoType? type;
  int? width;
  int? height;
  String? link;
  DateTime? createdTime;
  int? fps;
  int? size;
  String? md5;
  PublicName? publicName;
  String? sizeShort;
  String? linkSecure;
  String? url;
  String? profile;

  factory Vimeo.fromJson(Map<String?, dynamic> json) => Vimeo(
        quality: publicNameValues.map[json["quality"]],
        type: vimeoTypeValues.map[json["type"]],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
        link: json["link"],
        createdTime: DateTime.parse(json["created_time"]),
        fps: json["fps"],
        size: json["size"],
        md5: json["md5"],
        publicName: publicNameValues.map[json["public_name"]],
        sizeShort: json["size_short"],
        linkSecure: json["link_secure"],
        url: json["url"] == null ? null : json["url"],
        profile: json["profile"] == null ? null : json["profile"],
      );

  Map<String?, dynamic> toJson() => {
        "quality": publicNameValues.reverse[quality],
        "type": vimeoTypeValues.reverse[type],
        "width": width == null ? null : width,
        "height": height == null ? null : height,
        "link": link,
        "created_time": createdTime?.toIso8601String(),
        "fps": fps,
        "size": size,
        "md5": md5,
        "public_name": publicNameValues.reverse[publicName],
        "size_short": sizeShort,
        "link_secure": linkSecure,
        "url": url == null ? null : url,
        "profile": profile == null ? null : profile,
      };
}

enum PublicName { THE_1080_P, THE_360_P, THE_720_P, THE_540_P, HLS }

final publicNameValues = EnumValues({
  "hls": PublicName.HLS,
  "1080p": PublicName.THE_1080_P,
  "360p": PublicName.THE_360_P,
  "540p": PublicName.THE_540_P,
  "720p": PublicName.THE_720_P
});

enum VimeoType { VIDEO_MP4 }

final vimeoTypeValues = EnumValues({"video/mp4": VimeoType.VIDEO_MP4});

class EnumValues<T> {
  late Map<String?, T> map;
  late Map<T, String?> reverseMap;

  EnumValues(this.map);

  Map<T, String?> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
