import 'package:fish_redux/fish_redux.dart' as FishRedux;
import 'package:flutter_music/sections/Leaderboard/page/page.dart';
import 'package:flutter_music/sections/login/page/login/page.dart';
import 'package:flutter_music/sections/login/page/photo_login/page.dart';
import 'package:flutter_music/sections/music/page/playlist_detail/page.dart';
import 'package:flutter_music/sections/music/page/recommend_list/page.dart';
import 'package:flutter_music/sections/music/page/song/page.dart';
import 'package:flutter_music/sections/podcast/page/catelist/page.dart';
import 'package:flutter_music/sections/podcast/page/detail/page.dart';
import 'package:flutter_music/sections/search/page/detail/page.dart';
import 'package:flutter_music/sections/search/page/search/page.dart';
import 'package:flutter_music/sections/search/page/singer_category/page.dart';
import 'package:flutter_music/sections/square/page/edit/page.dart';
import 'package:flutter_music/sections/square/page/page.dart';
import 'package:flutter_music/sections/video/page/page.dart';
import 'package:flutter_music/sections/webview/page/page.dart';

class RouterHelper {
  static Map<String, FishRedux.Page> routers = {
    RouterKeys.square: PlaylistSquarePage(),
    RouterKeys.square_edit: SquareEditPage(),
    RouterKeys.login: LoginPage(),
    RouterKeys.photo_login: PhotoLoginPage(),
    RouterKeys.every_day_recommend_song: RecommendListPage(),
    RouterKeys.song: AudioPlayerPage(),
    RouterKeys.playlist_detail: PlaylistDetailPage(),
    RouterKeys.toplist_detail: LeaderboardPage(),
    RouterKeys.web_view: CustomWebViewPage(),
    RouterKeys.podcast_catelist: CatelistPage(),
    RouterKeys.podcast_catelist_detail: PodcastDetailPage(),
    RouterKeys.video_detail: VideoDetailPage(),
    RouterKeys.search: SearchPage(),
    RouterKeys.search_detail: SearchDetailPage(),
    RouterKeys.search_singer_category: SingerCategoryPage(),
  };
}

class RouterKeys {
  static const login = "login";
  static const photo_login = "photo_login";
  static const every_day_recommend_song = "every_day_recommend_song";

  //入口类
  static const applicaiton = "application";

  //歌单广场
  static const square = "square";

  //跟单category编辑
  static const square_edit = "square_edit";

  //音乐播放界面
  static const song = "song";

  //歌单详情
  static const playlist_detail = "play_list_detail";

  //排行榜
  static const toplist_detail = "toplist_detail";

  //播客下全部分类
  static const podcast_catelist = "podcast_catelist";

  //播客详情页面
  static const podcast_catelist_detail = "podcast_catelist_detail";

  //视频详情页面
  static const video_detail = "video_detail";

  //搜索
  static const search = "search";

  //搜索详情
  static const search_detail = "search_detail";

  //搜索-歌手分类
  static const search_singer_category = "search_singer_category";

  //web
  static const web_view = "web_view";
}
