class Post {
  Post({
    required this.id,
    required this.pageUrl,
    required this.type,
    required this.tags,
    required this.previewUrl,
    required this.previewWidth,
    required this.previewHeight,
    required this.webformatUrl,
    required this.webformatWidth,
    required this.webformatHeight,
    required this.largeImageUrl,
    required this.fullHdurl,
    required this.imageUrl,
    required this.imageWidth,
    required this.imageHeight,
    required this.imageSize,
    required this.views,
    required this.downloads,
    required this.likes,
    required this.comments,
    required this.userId,
    required this.user,
    required this.userImageUrl,
  });

  final int id;
  final String pageUrl;
  final String type;
  final String tags;
  final String previewUrl;
  final int previewWidth;
  final int previewHeight;
  final String webformatUrl;
  final int webformatWidth;
  final int webformatHeight;
  final String largeImageUrl;
  final String fullHdurl;
  final String imageUrl;
  final int imageWidth;
  final int imageHeight;
  final int imageSize;
  final int views;
  final int downloads;
  final int likes;
  final int comments;
  final int userId;
  final String user;
  final String userImageUrl;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"] ?? 0,
        pageUrl: json["pageURL"] ?? "",
        type: json["type"] ?? "",
        tags: json["tags"] ?? "",
        previewUrl: json["previewURL"] ?? "",
        previewWidth: json["previewWidth"] ?? "",
        previewHeight: json["previewHeight"] ?? "",
        webformatUrl: json["webformatURL"] ?? "",
        webformatWidth: json["webformatWidth"] ?? "",
        webformatHeight: json["webformatHeight"] ?? "",
        largeImageUrl: json["largeImageURL"] ?? "",
        fullHdurl: json["fullHDURL"] ?? "",
        imageUrl: json["imageURL"] ?? "",
        imageWidth: json["imageWidth"] ?? 0,
        imageHeight: json["imageHeight"] ?? 0,
        imageSize: json["imageSize"] ?? 0,
        views: json["views"] ?? 0,
        downloads: json["downloads"] ?? 0,
        likes: json["likes"] ?? 0,
        comments: json["comments"] ?? 0,
        userId: json["user_id"] ?? 0,
        user: json["user"] ?? "",
        userImageUrl: json["userImageURL"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pageURL": pageUrl,
        "type": type,
        "tags": tags,
        "previewURL": previewUrl,
        "previewWidth": previewWidth,
        "previewHeight": previewHeight,
        "webformatURL": webformatUrl,
        "webformatWidth": webformatWidth,
        "webformatHeight": webformatHeight,
        "largeImageURL": largeImageUrl,
        "fullHDURL": fullHdurl,
        "imageURL": imageUrl,
        "imageWidth": imageWidth,
        "imageHeight": imageHeight,
        "imageSize": imageSize,
        "views": views,
        "downloads": downloads,
        "likes": likes,
        "comments": comments,
        "user_id": userId,
        "user": user,
        "userImageURL": userImageUrl,
      };
}
