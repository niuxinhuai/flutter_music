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

class SearchSingerCategoryUtils {
  ///type

  ///全部
  static const int total_type = -1;

  ///男歌手
  static const int man = 1;

  ///女歌手
  static const int women = 2;

  ///乐队
  static const int band = 3;

  static const Map<String, int> typeMap = {"男": man, "女": women, "乐队/组合": band};

  ///area

  ///全部
  static const int area_total = -1;

  ///华语
  static const int chinese = 7;

  ///欧美
  static const int us = 96;

  ///日本
  static const int japan = 8;

  ///韩国
  static const int korea = 16;

  ///其他
  static const int other = 0;

  static const Map<String, int> areaMap = {
    "华语": chinese,
    "欧美": us,
    "日本": japan,
    "韩国": korea,
    "其他": other
  };
}
