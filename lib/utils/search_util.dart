class SearchUtils {
  ///综合
  static const int total = 1018;

  ///单曲
  static const int single = 1;

  ///专辑
  static const int album = 10;

  ///歌手
  static const int singer = 100;

  ///歌单
  static const int song_list = 1000;

  ///用户
  static const int user = 1002;

  ///MV,
  static const int mv = 1004;

  ///歌词
  static const int lyric = 1006;

  ///电台
  static const int dj = 1009;

  ///视频
  static const int video = 1014;

  ///声音
  static const int voice = 2000;

  static const Map<String, int> map = {
    "综合": total,
    "单曲": single,
    "专辑": album,
    "歌手": singer,
    "歌单": song_list,
    "用户": user,
    "播客": mv,
    "歌词": lyric,
    "电台": dj,
    "视频": video,
    "声音": voice,
  };
}
