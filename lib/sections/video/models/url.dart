import 'package:json_annotation/json_annotation.dart';

part 'url.g.dart';

@JsonSerializable()
class VideoUrlWrap {
  VideoUrlWrap();

  int? code;
  List<VideoUrlItem>? urls;

  factory VideoUrlWrap.fromJson(Map<String, dynamic> json) =>
      _$VideoUrlWrapFromJson(json);

  toJson() => _$VideoUrlWrapToJson(this);
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
