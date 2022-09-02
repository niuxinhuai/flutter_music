import 'package:json_annotation/json_annotation.dart';

part 'info.g.dart';

@JsonSerializable()
class VideoDetailInfoWrap {
  VideoDetailInfoWrap();

  int? code;
  int? likedCount;
  int? shareCount;
  int? commentCount;
  bool? liked;

  factory VideoDetailInfoWrap.fromJson(Map<String, dynamic> json) =>
      _$VideoDetailInfoWrapFromJson(json);

  toJson() => _$VideoDetailInfoWrapToJson(this);
}

@JsonSerializable()
class VideoUrlItem {
  VideoUrlItem();

  String? id;
  String? url;
  int? size;
  int? validityTime;
  bool? needPay;
  double? r;

  factory VideoUrlItem.fromJson(Map<String, dynamic> json) =>
      _$VideoUrlItemFromJson(json);

  toJson() => _$VideoUrlItemToJson(this);
}
