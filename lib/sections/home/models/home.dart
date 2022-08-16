import 'package:flutter/material.dart';
import 'package:flutter_music/models/common_model.dart';
import 'package:flutter_music/utils/colorUtils.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'home.g.dart';

@JsonSerializable()
class HomeMusicWrap extends CommonModel<MusicStage> {
  HomeMusicWrap();

  factory HomeMusicWrap.fromJson(Map<String, dynamic> json) =>
      _$HomeMusicWrapFromJson(json);

  toJson() => _$HomeMusicWrapToJson(this);
}

@JsonSerializable()
class MusicStage {
  MusicStage();

  bool? hasMore;
  List<MusicItem>? blocks;

  factory MusicStage.fromJson(Map<String, dynamic> json) =>
      _$MusicStageFromJson(json);

  toJson() => _$MusicStageToJson(this);
}

@JsonSerializable()
class MusicItem {
  MusicItem();

  String? blockCode;
  String? showType;
  int? dislikeShowType;
  bool? canClose;
  int? blockStyle;
  bool? canFeedback;
  //字典，数组
  dynamic extInfo;
  MusicUiElement? uiElement;
  List<CreativesItem>? creatives;

  @JsonKey(ignore: true)
  RefreshController controller = RefreshController();

  MusicExtInfo? getBannerInfo() {
    if (extInfo == null) {
      return null;
    }
    String runStr = extInfo.runtimeType.toString();
    if (runStr == "_InternalLinkedHashMap<String, dynamic>") {
      return MusicExtInfo.fromJson(Map<String, dynamic>.from(extInfo as Map));
    }
    return null;
  }

  List<ExtInfoItem>? getExtInfoList() {
    if (extInfo == null) {
      return null;
    }
    String runStr = extInfo.runtimeType.toString();
    if (runStr == "List<dynamic>") {
      return (extInfo as List<dynamic>)
          .map((e) => ExtInfoItem.fromJson(e))
          .toList();
    }
    return null;
  }

  factory MusicItem.fromJson(Map<String, dynamic> json) =>
      _$MusicItemFromJson(json);

  toJson() => _$MusicItemToJson(this);
}

@JsonSerializable()
class MusicExtInfo {
  MusicExtInfo();

  List<MusicBanner>? banners;

  factory MusicExtInfo.fromJson(Map<String, dynamic> json) =>
      _$MusicExtInfoFromJson(json);

  toJson() => _$MusicExtInfoToJson(this);
}

///banner
@JsonSerializable()
class MusicBanner {
  MusicBanner();

  String? bannerId;
  String? pic;
  String? titleColor;
  int? targetId;
//  @JsonKey(defaultValue: 2)
//  MusicBannerTargetType? targetType;
  int? targetType;
  String? typeTitle;
  String? encodeId;
  String? url;

  Color getBgColor() {
    if (titleColor != null) {
      if (ColorUtils.colorMap().containsKey(titleColor)) {
        return ColorUtils.colorMap()[titleColor]!;
      }
    }

    return Colors.red;
  }

  factory MusicBanner.fromJson(Map<String, dynamic> json) =>
      _$MusicBannerFromJson(json);

  toJson() => _$MusicBannerToJson(this);
}

enum MusicBannerTargetType {
  @JsonValue(1)
  musicOne,
  @JsonValue(10)
  musicTen,
  @JsonValue(1000)
  song,
  @JsonValue(3000)
  web
}

/// uiElement
@JsonSerializable()
class MusicUiElement {
  MusicUiElement();

  UiElementTitle? subTitle;
  UiElementTitle? mainTitle;
  UiElementButton? button;
  UiElementImage? image;
  UiElementLabelText? labelText;
  String? rcmdShowType;
  List<String>? labelTexts;
  String? labelType;

  factory MusicUiElement.fromJson(Map<String, dynamic> json) =>
      _$MusicUiElementFromJson(json);

  toJson() => _$MusicUiElementToJson(this);
}

@JsonSerializable()
class UiElementTitle {
  UiElementTitle();

  String? title;
  String? titleImgUrl;
  String? titleDesc;

  factory UiElementTitle.fromJson(Map<String, dynamic> json) =>
      _$UiElementTitleFromJson(json);

  toJson() => _$UiElementTitleToJson(this);
}

@JsonSerializable()
class UiElementButton {
  UiElementButton();

  String? action;
  String? actionType;
  String? text;
  String? iconUrl;

  factory UiElementButton.fromJson(Map<String, dynamic> json) =>
      _$UiElementButtonFromJson(json);

  toJson() => _$UiElementButtonToJson(this);
}

@JsonSerializable()
class UiElementLabelText {
  UiElementLabelText();

  String? textColor;
  String? text;

  factory UiElementLabelText.fromJson(Map<String, dynamic> json) =>
      _$UiElementLabelTextFromJson(json);

  toJson() => _$UiElementLabelTextToJson(this);
}

@JsonSerializable()
class UiElementImage {
  UiElementImage();

  String? imageUrl;

  factory UiElementImage.fromJson(Map<String, dynamic> json) =>
      _$UiElementImageFromJson(json);

  toJson() => _$UiElementImageToJson(this);
}

///creatives
@JsonSerializable()
class CreativesItem {
  CreativesItem();

  String? creativeType;
  String? creativeId;
  String? action;
  String? actionType;
  int? position;
//  String? logInfo;
  String? alg;
  MusicUiElement? uiElement;
  List<ResourcesItem>? resources;

  factory CreativesItem.fromJson(Map<String, dynamic> json) =>
      _$CreativesItemFromJson(json);

  toJson() => _$CreativesItemToJson(this);
}

///resources
@JsonSerializable()
class ResourcesItem {
  ResourcesItem();

  MusicUiElement? uiElement;
  String? resourceType;
  String? resourceId;
  String? resourceUrl;
  String? action;
  String? actionType;
  bool? valid;
  String? alg;
//  String? logInfo;
  ResourceExtInfo? resourceExtInfo;

  factory ResourcesItem.fromJson(Map<String, dynamic> json) =>
      _$ResourcesItemFromJson(json);

  toJson() => _$ResourcesItemToJson(this);
}

@JsonSerializable()
class ResourceExtInfo {
  ResourceExtInfo();

  double? startTime;
  double? endTime;
  int? playCount;
  bool? highQuality;
  int? specialType;
  String? alias;
  List<ResourceExtInfoArtists>? artists;
  ResourceExtInfoSongData? songData;

  factory ResourceExtInfo.fromJson(Map<String, dynamic> json) =>
      _$ResourceExtInfoFromJson(json);

  toJson() => _$ResourceExtInfoToJson(this);
}

///artists
@JsonSerializable()
class ResourceExtInfoArtists {
  ResourceExtInfoArtists();

  String? name;

  factory ResourceExtInfoArtists.fromJson(Map<String, dynamic> json) =>
      _$ResourceExtInfoArtistsFromJson(json);

  toJson() => _$ResourceExtInfoArtistsToJson(this);
}

///songData
@JsonSerializable()
class ResourceExtInfoSongData {
  ResourceExtInfoSongData();

  String? name;

  factory ResourceExtInfoSongData.fromJson(Map<String, dynamic> json) =>
      _$ResourceExtInfoSongDataFromJson(json);

  toJson() => _$ResourceExtInfoSongDataToJson(this);
}

///extInfo
@JsonSerializable()
class ExtInfoItem {
  ExtInfoItem();

  String? id;
  String? reason;
  int? mlogBaseDataType;
  int? type;
  ExtInfoItemResource? resource;

  factory ExtInfoItem.fromJson(Map<String, dynamic> json) =>
      _$ExtInfoItemFromJson(json);

  toJson() => _$ExtInfoItemToJson(this);
}

///extInfoResource
@JsonSerializable()
class ExtInfoItemResource {
  ExtInfoItemResource();

  String? shareUrl;
  String? reason;
  int? source;
  int? status;
  ResourceMlogBaseData? mlogBaseData;

  factory ExtInfoItemResource.fromJson(Map<String, dynamic> json) =>
      _$ExtInfoItemResourceFromJson(json);

  toJson() => _$ExtInfoItemResourceToJson(this);
}

///extInfoResourceMlogBaseData
@JsonSerializable()
class ResourceMlogBaseData {
  ResourceMlogBaseData();

  String? id;
  String? originalTitle;
  String? text;
  String? coverUrl;
  double? coverHeight;
  double? coverWidth;
  ResourceMlogBaseDataVideo? video;

  int? type;
  int? status;

  factory ResourceMlogBaseData.fromJson(Map<String, dynamic> json) =>
      _$ResourceMlogBaseDataFromJson(json);

  toJson() => _$ResourceMlogBaseDataToJson(this);
}

///extInfoResourceVideo
@JsonSerializable()
class ResourceMlogBaseDataVideo {
  ResourceMlogBaseDataVideo();

  String? videoKey;
  String? coverUrl;
  String? frameUrl;
  double? width;
  double? height;

  Color get bgColor => Colors.amber;

  factory ResourceMlogBaseDataVideo.fromJson(Map<String, dynamic> json) =>
      _$ResourceMlogBaseDataVideoFromJson(json);

  toJson() => _$ResourceMlogBaseDataVideoToJson(this);
}
