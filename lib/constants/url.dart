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
  static String recommend_resource = "/recommend/resource";

  ///推荐歌单
  static String recommend_personalized({int limit = 6}) =>
      "/personalized?limit=$limit";

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

  ///电台 - 推荐类型
  static String dj_recommend_category = "/dj/category/recommend";

  ///电台 - banner
  static String dj_banner = "/dj/banner";

  ///电台 - 电台个性推荐
  static String dj_recommend = "/dj/personalize/recommend";

  ///电台 - 电台全部分类
  static String dj_catelist = "/dj/catelist";

  ///电台 - 电台全部分类下的数据
  static String dj_catelist_recommend(int type) =>
      "/dj/recommend/type?type=$type";

  ///电台 - 电台详情
  static String dj_catelist_detail(int rid) => "/dj/detail?rid=$rid";

  ///电台 - 电台详情列表
  ///说明 : 登录后调用此接口 , 传入rid, 可查看对应电台的电台节目以及对应的 id, 需要 注意的是这个接口返回的 mp3Url 已经无效 , 都为 null, 但是通过调用 /song/url 这 个接口 , 传入节目 id 仍然能获取到节目音频 , 如 /song/url?id=478446370 获取代 码时间的一个节目的音频
  //
  //必选参数 : rid: 电台 的 id
  //
  //可选参数 :
  //
  //limit : 返回数量 , 默认为 30
  //
  //offset : 偏移数量，用于分页 , 如 :( 页数 -1)*30, 其中 30 为 limit 的值 , 默认为 0
  //
  //asc : 排序方式,默认为 false (新 => 老 ) 设置 true 可改为 老 => 新
  static String dj_catelist_detail_list(
    int rid, {
    int limit = 40,
  }) =>
      "/dj/program?rid=$rid&limit=$limit";

  ///获取视频标签列表
  static const String video_group = "/video/group/list";

  ///获取视频分类列表
  static const String video_category = "/video/category/list";

  ///获取视频标签/分类下的视频
  static String video_group_source(int id, {int offset = 0}) =>
      "/video/group?id=$id&offset=$offset";

  ///获取视频详情
  static String video_detail(String vid) => "/video/detail?id=$vid";

  ///获取视频url
  static String video_url(String vid) => "/video/url?id=$vid";

  ///获取视频点赞转发评论数数据
  static String video_detail_info(String vid) => "/video/detail/info?id=$vid";

  /*
  * 视频评论
说明 : 调用此接口 , 传入音乐 id 和 limit 参数 , 可获得该 视频 的所有评论 ( 不需要登录 )

必选参数 : id: 视频的 id

可选参数 : limit: 取出评论数量 , 默认为 20

offset: 偏移数量 , 用于分页 , 如 :( 评论页数 -1)*20, 其中 20 为 limit 的值

before: 分页参数,取上一页最后一项的 time 获取下一页数据(获取超过 5000 条评论的时候需要用到)

接口地址 : /comment/video
  *
  * */
  static String video_comment(String vid) => "/comment/video?id=$vid";

  ///搜索-关键词
  static const String search_default = "/search/default";

  ///搜索-热搜榜
  static const String search_hot_detail = "/search/hot/detail";

  ///搜索-推荐
  static const String search_recommend = "/search/hot";

  ///搜索 - 详情
  /*
  * 说明 : 调用此接口 , 传入搜索关键词可以搜索该音乐 / 专辑 / 歌手 / 歌单 / 用户 , 关键词可以多个 , 以空格隔开 , 如 " 周杰伦 搁浅 "( 不需要登录 ), 可通过 /song/url 接口传入歌曲 id 获取具体的播放链接

必选参数 : keywords : 关键词

可选参数 : limit : 返回数量 , 默认为 30 offset : 偏移数量，用于分页 , 如 : 如 :( 页数 -1)*30, 其中 30 为 limit 的值 , 默认为 0

type: 搜索类型；默认为 1 即单曲 , 取值意义 : 1: 单曲, 10: 专辑, 100: 歌手, 1000: 歌单, 1002: 用户, 1004: MV, 1006: 歌词, 1009: 电台, 1014: 视频, 1018:综合, 2000:声音(搜索声音返回字段格式会不一样)
  * */
  static String search_detail(String keywords, {int type = 1018}) =>
      "/search?keywords=$keywords&type=$type";
}
