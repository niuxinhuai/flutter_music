import 'package:flutter_music/models/common_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recommend.g.dart';

@JsonSerializable()
class RecommendListWrap extends CommonModel<RecommendListData> {
  RecommendListWrap();

  factory RecommendListWrap.fromJson(Map<String, dynamic> json) =>
      _$RecommendListWrapFromJson(json);

  toJson() => _$RecommendListWrapToJson(this);
}

@JsonSerializable()
class RecommendListData {
  RecommendListData();

  List<DailySongItem>? dailySongs;
  List<RecommendReasonItem>? recommendReasons;

  factory RecommendListData.fromJson(Map<String, dynamic> json) =>
      _$RecommendListDataFromJson(json);

  toJson() => _$RecommendListDataToJson(this);
}

@JsonSerializable()
class DailySongItem {
  DailySongItem();

  String? name;
  int? id;
  List<DailyArItem>? ar;
  DailyAlItem? al;
  List<String>? alia;

  /// u64, 非零表示有MV ID
  int? mv;

  //为1时显示vip
  int? fee;

  //状态，小于25时显示SQ
  int? no;

  //1代表原唱
  int? originCoverType;

  List<String>? officialTags;

  NoCopyrightRcmd? noCopyrightRcmd;

  @JsonKey(ignore: true)
  String? reason;

  String getSongString() {
    if (ar == null || ar?.isEmpty == true) {
      return "";
    }
    String named = ar!.map((e) => e.name ?? "").join(" | ");
    if (noCopyrightRcmd != null && noCopyrightRcmd?.typeDesc != null) {
      named = noCopyrightRcmd!.typeDesc! + " | $named";
    }
    if (al?.name != null && al?.name?.isNotEmpty == true) {
      return named + " - ${al?.name ?? ""}";
    }
    return named;
  }

  String gettrackName() {
    if (alia != null && alia!.isNotEmpty == true) {
      return "(${alia!.join(" ")})";
    }
    return "";
  }

  ///是否可以显示vip 指示器
  bool canShowVipState() {
    if (fee == null) {
      return false;
    }
    return fee == 1;
  }

  ///是否可以显示SQ
  bool canShowSQ() {
    if (no == null) {
      return false;
    }
    return no! < 25;
  }

  ///是否可以显示原唱
  bool canShowAuthSinger() {
    if (originCoverType == null) {
      return false;
    }
    return originCoverType == 1;
  }

  ///是否可以显示试听
  bool canShowTryListening() {
    if (no == null) {
      return false;
    }
    return no! <= 5;
  }

  ///是否可以显示无音乐
  bool canShowNoRcmd() {
    if (noCopyrightRcmd != null && noCopyrightRcmd?.type != null) {
      return (noCopyrightRcmd?.type ?? 0) == 2;
    }
    return false;
  }

  ///是否存在mv
  bool hasMV() {
    if (mv == null || mv == 0) {
      return false;
    }
    return true;
  }

  factory DailySongItem.fromJson(Map<String, dynamic> json) =>
      _$DailySongItemFromJson(json);

  toJson() => _$DailySongItemToJson(this);
}

///作者
@JsonSerializable()
class DailyArItem {
  DailyArItem();

  int? id;
  String? name;

  factory DailyArItem.fromJson(Map<String, dynamic> json) =>
      _$DailyArItemFromJson(json);

  toJson() => _$DailyArItemToJson(this);
}

///来源
@JsonSerializable()
class DailyAlItem {
  DailyAlItem();

  int? id;
  String? name;
  String? picUrl;

  factory DailyAlItem.fromJson(Map<String, dynamic> json) =>
      _$DailyAlItemFromJson(json);

  toJson() => _$DailyAlItemToJson(this);
}

///reason
@JsonSerializable()
class RecommendReasonItem {
  RecommendReasonItem();

  int? songId;
  String? reason;

  factory RecommendReasonItem.fromJson(Map<String, dynamic> json) =>
      _$RecommendReasonItemFromJson(json);

  toJson() => _$RecommendReasonItemToJson(this);
}

@JsonSerializable()
class NoCopyrightRcmd {
  NoCopyrightRcmd();

  int? type;
  String? typeDesc;

  factory NoCopyrightRcmd.fromJson(Map<String, dynamic> json) =>
      _$NoCopyrightRcmdFromJson(json);

  toJson() => _$NoCopyrightRcmdToJson(this);
}
