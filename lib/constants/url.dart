class UrlConstants {
  static const String baseUrl =
      "https://netease-cloud-music-api-sable-gamma.vercel.app";
}

class MusicUri extends UrlConstants {
  ///首页-发现
  ///可选参数 : refresh: 是否刷新数据,默认为 false
  static String home({bool refresh = false}) =>
      "/homepage/block/page?refresh=$refresh";

  ///登录
  static String phoneLogin(String phone, String password) =>
      "/login/cellphone?phone=$phone&password=$password";

  ///游客登录
  static String visitorLogin = "/register/anonimous";

  ///推荐音乐
  static const String recommend_url = "/recommend/resource";

  ///歌单分类
  ///说明 : 调用此接口,可获取歌单分类,包含 category 信息
  static const String catlist = "/playlist/catlist";

  ///热门歌单分类
  ///说明 : 调用此接口,可获取歌单分类,包含 category 信息
  static const String hot = "/playlist/hot";

  /**
   * 歌单 ( 网友精选碟 )
      说明 : 调用此接口 , 可获取网友精选碟歌单

      可选参数 : order: 可选值为 'new' 和 'hot', 分别对应最新和最热 , 默认为 'hot'

      cat: tag, 比如 " 华语 "、" 古风 " 、" 欧美 "、" 流行 ", 默认为 "全部",可从歌单分类接口获取(/playlist/catlist)

      limit: 取出歌单数量 , 默认为 50

      offset: 偏移数量 , 用于分页 , 如 :( 评论页数 -1)*50, 其中 50 为 limit 的值
   *
   * */
  static String getSongPlayList(
          {int limit = 10,
          int offset = 0,
          String order = "hot",
          String tag = "全部"}) =>
      "/top/playlist?limit=$limit&offset=$offset&order=$order&cat=$tag";
}
