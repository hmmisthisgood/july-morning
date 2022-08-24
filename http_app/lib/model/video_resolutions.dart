class VideoResolutions {
  final VideoSize large;
  final VideoSize medium;
  final VideoSize small;
  final VideoSize tiny;

  VideoResolutions(
      {required this.large,
      required this.medium,
      required this.small,
      required this.tiny});

  static VideoResolutions convert(Map json) {
    return VideoResolutions(
      large: VideoSize.convertFromJson(json['large']),
      medium: VideoSize.convertFromJson(json['medium']),
      small: VideoSize.convertFromJson(json['small']),
      tiny: VideoSize.convertFromJson(json['tiny']),
    );
  }
}

// {
//                 "url": "https://player.vimeo.com/external/135736646.hd.mp4?s=ed02d71c92dd0df7d1110045e6eb65a6&profile_id=174",
//                 "width": 1280,
//                 "height": 720,
//                 "size": 3562083
//             },

class VideoSize {
  final String url;
  final int width, height, size;

  VideoSize(
      {required this.url,
      required this.width,
      required this.height,
      required this.size});

  factory VideoSize.convertFromJson(Map json) {
    return VideoSize(
      url: json['url'],
      width: json['width'],
      height: json['height'],
      size: json['size'],
    );
  }
}
