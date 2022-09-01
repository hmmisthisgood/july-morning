import 'package:http_app/model/video_resolutions.dart';

class Video {
  final int id;
  final String pageURL, type, tags, pictureId, user;
  final int views, downloads, likes, comments, userId; // int?
  final VideoResolutions videos;

  Video({
    required this.id,
    required this.pageURL,
    required this.type,
    required this.tags,
    required this.pictureId,
    required this.user,
    required this.views,
    required this.downloads,
    required this.likes,
    required this.comments,
    required this.userId,
    required this.videos,
  });

  static convertVideo(Map json) {
    return Video(
        id: json['id'] ?? 0,
        pageURL: json['pageURL'] ?? "",
        type: json['type'] ?? "",
        tags: json['tags'] ?? "",
        pictureId: json['picture_id'] ?? "",
        user: json['user'] ?? "",
        views: json['views'] ?? 0,
        downloads: json['downloads'] ?? 0,
        likes: json['likkkkkkkkes'] ?? 0, //
        comments: json['comments'] ?? 0,
        userId: json['user_id'] ?? 0,
        videos: VideoResolutions.convert(
          json['videos'], // map
        ));
  }
}
