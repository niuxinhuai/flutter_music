class PodcastUtils {
  ///banner
  static const int dj_banner = 990;

  ///每日优选
  static const int dj_perfered = 991;

  ///情感
  static const int dj_emotion_category = 3;

  ///音乐推荐
  static const int dj_music_category = 2;

  ///二次元
  static const int dj_dimensional_category = 3001;

  ///有声书
  static const int dj_book_category = 10001;

  ///脱口秀
  static const int dj_show_category = 8;

  ///侃侃而谈
  static const int dj_talk_category = 5;

  ///创作翻唱
  static const int dj_cover_category = 2001;

  ///电音
  static const int dj_electronic_category = 10002;

  ///生活
  static const int dj_life_category = 6;

  ///明星专区
  static const int dj_star_category = 14;

  ///亲子
  static const int dj_child_category = 13;

  ///知识
  static const int dj_knowledge_category = 11;

  static const List<int> otherItems = [
    PodcastUtils.dj_cover_category,
    PodcastUtils.dj_life_category,
    PodcastUtils.dj_emotion_category,
  ];

  static const List<int> gridItems = [
    PodcastUtils.dj_show_category,
    PodcastUtils.dj_music_category,
    PodcastUtils.dj_dimensional_category,
    PodcastUtils.dj_electronic_category,
    PodcastUtils.dj_child_category,
    PodcastUtils.dj_knowledge_category,
    PodcastUtils.dj_book_category,
    PodcastUtils.dj_star_category,
    PodcastUtils.dj_talk_category,
  ];
}
