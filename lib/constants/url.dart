import 'package:flutter_music/constants/key.dart';

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
      "/login/cellphone"; //?phone=$phone&password=$password

  ///验证码登录
  static String captchaLogin(String phone, String captcha) =>
      "/login/cellphone"; //?phone=$phone&captcha=$captcha

  ///发送验证码
  static String sendCaptcha(String phone) => "/captcha/sent?phone=$phone";

  ///检测手机号码是否已经注册
  static String verifyPhone(String phone, {String countrycode = "86"}) =>
      "/cellphone/existence/check?phone=$phone&countrycode=$countrycode";

  ///邮箱登录
  static String emailLogin(String email, String password) =>
      "/login?email=$email&password=$password";

  ///刷新登录cookie
  static String refreshLogin = "/login/refresh";

  ///游客登录
  static String visitorLogin = "/register/anonimous";

  ///推荐音乐
  static String recommend_url = "/recommend/resource";

  ///获取每日推荐歌曲
  static const String recommend_songs = "/recommend/songs";

  ///获取音乐url
  static String song_url(String id) => "/song/url?id=$id";

  ///获取音乐对应的歌词
  static String song_lyric(String id) => "/lyric?id=$id";

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

  ///获取精品歌单
  /*
  * 说明 : 调用此接口 , 可获取精品歌单

可选参数 : cat: tag, 比如 " 华语 "、" 古风 " 、" 欧美 "、" 流行 ", 默认为 "全部",可从精品歌单标签列表接口获取(/playlist/highquality/tags)

limit: 取出歌单数量 , 默认为 50

before: 分页参数,取上一页最后一个歌单的 updateTime 获取下一页数据
  * */
  static String getHighqualityPlayList(
      {int limit = 10, int before = 0, String cat = ""}) {
    if (cat.isEmpty || cat == ConstantsKey.square_tag) {
      return "/top/playlist/highquality?before=$before&limit=$limit";
    }
    return "/top/playlist/highquality?before=$before&limit=$limit&cat=$cat";
  }

  ///获取精品歌单标签列表
  static const String highquality_tags = "/playlist/highquality/tags";

  ///获取歌单下所有歌曲
  ///说明 : 由于网易云接口限制，歌单详情只会提供 10 首歌，通过调用此接口，传入对应的歌单id，即可获得对应的所有歌曲
  //
  //必选参数 : id : 歌单 id
  //
  //可选参数 : limit : 限制获取歌曲的数量，默认值为当前歌单的歌曲数量
  //
  //可选参数 : offset : 默认值为0
  //
  //接口地址 : /playlist/track/all
  //
  //调用例子 : /playlist/track/all?id=24381616&limit=10&offset=1
  static String getTrackAllSong() =>
      "/playlist/track/all?id=24381616&limit=10&offset=1";

  ///获取歌单详情
  static String getPlaylistDetail(String id) => "/playlist/detail?id=$id";

  ///所有榜单内容摘要
  static String toplist_detail = "/toplist/detail";
}
