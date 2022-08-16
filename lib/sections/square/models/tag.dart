import 'package:json_annotation/json_annotation.dart';

part 'tag.g.dart';

///精品歌单分类下的内容
@JsonSerializable()
class HighqualityTagsWrap {
  HighqualityTagsWrap();

  int? code;
  List<Tag>? tags;

  factory HighqualityTagsWrap.fromJson(Map<String, dynamic> json) =>
      _$HighqualityTagsWrapFromJson(json);

  toJson() => _$HighqualityTagsWrapToJson(this);
}

@JsonSerializable()
class Tag {
  Tag();

  int? id;
  String? name;
  int? type;
  int? category;
  bool? hot;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  toJson() => _$TagToJson(this);
}
