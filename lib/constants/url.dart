class UrlConstants {
  static const String baseUrl =
      "https://netease-cloud-music-api-sable-gamma.vercel.app";
}

class MusicUri extends UrlConstants {
  ///首页-发现
  ///可选参数 : refresh: 是否刷新数据,默认为 false
  static String home({bool refresh = false}) =>
      "/homepage/block/page?refresh=$refresh";
}
