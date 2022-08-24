import 'package:http_app/model/video_resolutions.dart';

class Video {
  final int id;
  final String pageURL, type, tags, pictureId, user;
  final int views, downloads, likes, comments, userId;
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
        id: json['id'],
        pageURL: json['pageURL'],
        type: json['type'],
        tags: json['tags'],
        pictureId: json['picture_id'],
        user: json['user'],
        views: json['views'],
        downloads: json['downloads'],
        likes: json['likes'],
        comments: json['comments'],
        userId: json['user_id'],
        videos: VideoResolutions.convert(
          json['videos'], // map
        ));
  }
}
