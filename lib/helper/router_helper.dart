import 'package:fish_redux/fish_redux.dart' as FishRedux;

class RouterHelper {
  static Map<String, FishRedux.Page> routers = {
//    RouterKeys.applicaiton: ApplicationPage(),
//    RouterKeys.home: HomePage(),
//    RouterKeys.knowledge_article: KnowledgeArticlePage(),
//    RouterKeys.webView: CustomWebViewPage(),
//    RouterKeys.search: SearchArticlePage(),
//    RouterKeys.search_result: SearchResultPage(),
//    RouterKeys.login: LoginPage(),
//    RouterKeys.register: RegisterPage(),
//    RouterKeys.collect: FavoriteArticlePage(),
//    RouterKeys.weather: WeatherPage(),
//    RouterKeys.weather_segment: WeatherSegmentPage(),
//    RouterKeys.amap: AMapHomePage(),
//    RouterKeys.calendar: CalendarPage(),
//    RouterKeys.face: FaceAuthPage(),
  };
}

class RouterKeys {
  static const login = "login";
  static const register = "register";
  static const article = "article";

  //入口类
  static const applicaiton = "application";

  //首页
  static const home = "home";

  //知识体系
  static const knowledge = "knowledge";

  //知识体系下文章页
  static const knowledge_article = "knowledge_article";

  //webview
  static const webView = "webView";

  //搜索
  static const search = "search";

  //搜索结果
  static const search_result = "search_result";

  //收藏
  static const collect = "collect";

  //天气
  static const weather = "weather";

  //天气列表
  static const weather_segment = "weather_segment";

  //地图
  static const amap = "amap";

  //日历
  static const calendar = "calendar";

  //人脸识别
  static const face = "face_auth";
}
