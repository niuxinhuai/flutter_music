class ImageUrlUtils {
  static const Map<String, String> musicImageHeaders = {
    "User-Agent":
        "Mozilla/5.0 (iPhone; CPU iPhone OS 16_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148",
    "Referer": "https://music.163.com/",
    "Accept": "image/avif,image/webp,image/apng,image/*,*/*;q=0.8",
  };

  static String normalizeMusicImageUrl(String imageUrl) {
    return normalizeMusicMediaUrl(imageUrl);
  }

  static String normalizeMusicMediaUrl(String mediaUrl) {
    final uri = Uri.tryParse(mediaUrl);
    if (uri == null) {
      return mediaUrl;
    }
    if (uri.scheme == "http" && uri.host.endsWith("music.126.net")) {
      return uri.replace(scheme: "https").toString();
    }
    return mediaUrl;
  }
}
