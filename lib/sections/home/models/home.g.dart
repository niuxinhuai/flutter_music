// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeMusicWrap _$HomeMusicWrapFromJson(Map json) => HomeMusicWrap()
  ..message = json['message'] as String?
  ..code = json['code'] as int?
  ..data = json['data'] == null
      ? null
      : MusicStage.fromJson(Map<String, dynamic>.from(json['data'] as Map));

Map<String, dynamic> _$HomeMusicWrapToJson(HomeMusicWrap instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };

MusicStage _$MusicStageFromJson(Map json) => MusicStage()
  ..hasMore = json['hasMore'] as bool?
  ..blocks = (json['blocks'] as List<dynamic>?)
      ?.map((e) => MusicItem.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();

Map<String, dynamic> _$MusicStageToJson(MusicStage instance) =>
    <String, dynamic>{
      'hasMore': instance.hasMore,
      'blocks': instance.blocks,
    };

MusicItem _$MusicItemFromJson(Map json) => MusicItem()
  ..blockCode = json['blockCode'] as String?
  ..showType = json['showType'] as String?
  ..dislikeShowType = json['dislikeShowType'] as int?
  ..canClose = json['canClose'] as bool?
  ..blockStyle = json['blockStyle'] as int?
  ..canFeedback = json['canFeedback'] as bool?
  ..extInfo = json['extInfo']
  ..uiElement = json['uiElement'] == null
      ? null
      : MusicUiElement.fromJson(
          Map<String, dynamic>.from(json['uiElement'] as Map))
  ..creatives = (json['creatives'] as List<dynamic>?)
      ?.map((e) => CreativesItem.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();

Map<String, dynamic> _$MusicItemToJson(MusicItem instance) => <String, dynamic>{
      'blockCode': instance.blockCode,
      'showType': instance.showType,
      'dislikeShowType': instance.dislikeShowType,
      'canClose': instance.canClose,
      'blockStyle': instance.blockStyle,
      'canFeedback': instance.canFeedback,
      'extInfo': instance.extInfo,
      'uiElement': instance.uiElement,
      'creatives': instance.creatives,
    };

MusicExtInfo _$MusicExtInfoFromJson(Map json) => MusicExtInfo()
  ..banners = (json['banners'] as List<dynamic>?)
      ?.map((e) => MusicBanner.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();

Map<String, dynamic> _$MusicExtInfoToJson(MusicExtInfo instance) =>
    <String, dynamic>{
      'banners': instance.banners,
    };

MusicBanner _$MusicBannerFromJson(Map json) => MusicBanner()
  ..bannerId = json['bannerId'] as String?
  ..pic = json['pic'] as String?
  ..titleColor = json['titleColor'] as String?
  ..targetId = json['targetId'] as int?
  ..targetType = json['targetType'] as int?
  ..typeTitle = json['typeTitle'] as String?
  ..encodeId = json['encodeId'] as String?
  ..url = json['url'] as String?;

Map<String, dynamic> _$MusicBannerToJson(MusicBanner instance) =>
    <String, dynamic>{
      'bannerId': instance.bannerId,
      'pic': instance.pic,
      'titleColor': instance.titleColor,
      'targetId': instance.targetId,
      'targetType': instance.targetType,
      'typeTitle': instance.typeTitle,
      'encodeId': instance.encodeId,
      'url': instance.url,
    };

MusicUiElement _$MusicUiElementFromJson(Map json) => MusicUiElement()
  ..subTitle = json['subTitle'] == null
      ? null
      : UiElementTitle.fromJson(
          Map<String, dynamic>.from(json['subTitle'] as Map))
  ..mainTitle = json['mainTitle'] == null
      ? null
      : UiElementTitle.fromJson(
          Map<String, dynamic>.from(json['mainTitle'] as Map))
  ..button = json['button'] == null
      ? null
      : UiElementButton.fromJson(
          Map<String, dynamic>.from(json['button'] as Map))
  ..image = json['image'] == null
      ? null
      : UiElementImage.fromJson(Map<String, dynamic>.from(json['image'] as Map))
  ..rcmdShowType = json['rcmdShowType'] as String?
  ..labelTexts =
      (json['labelTexts'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..labelType = json['labelType'] as String?;

Map<String, dynamic> _$MusicUiElementToJson(MusicUiElement instance) =>
    <String, dynamic>{
      'subTitle': instance.subTitle,
      'mainTitle': instance.mainTitle,
      'button': instance.button,
      'image': instance.image,
      'rcmdShowType': instance.rcmdShowType,
      'labelTexts': instance.labelTexts,
      'labelType': instance.labelType,
    };

UiElementTitle _$UiElementTitleFromJson(Map json) => UiElementTitle()
  ..title = json['title'] as String?
  ..titleImgUrl = json['titleImgUrl'] as String?;

Map<String, dynamic> _$UiElementTitleToJson(UiElementTitle instance) =>
    <String, dynamic>{
      'title': instance.title,
      'titleImgUrl': instance.titleImgUrl,
    };

UiElementButton _$UiElementButtonFromJson(Map json) => UiElementButton()
  ..action = json['action'] as String?
  ..actionType = json['actionType'] as String?
  ..text = json['text'] as String?
  ..iconUrl = json['iconUrl'] as String?;

Map<String, dynamic> _$UiElementButtonToJson(UiElementButton instance) =>
    <String, dynamic>{
      'action': instance.action,
      'actionType': instance.actionType,
      'text': instance.text,
      'iconUrl': instance.iconUrl,
    };

UiElementImage _$UiElementImageFromJson(Map json) =>
    UiElementImage()..imageUrl = json['imageUrl'] as String?;

Map<String, dynamic> _$UiElementImageToJson(UiElementImage instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
    };

CreativesItem _$CreativesItemFromJson(Map json) => CreativesItem()
  ..creativeType = json['creativeType'] as String?
  ..creativeId = json['creativeId'] as String?
  ..action = json['action'] as String?
  ..actionType = json['actionType'] as String?
  ..position = json['position'] as int?
  ..logInfo = json['logInfo'] as String?
  ..alg = json['alg'] as String?
  ..uiElement = json['uiElement'] == null
      ? null
      : MusicUiElement.fromJson(
          Map<String, dynamic>.from(json['uiElement'] as Map))
  ..resources = (json['resources'] as List<dynamic>?)
      ?.map((e) => ResourcesItem.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();

Map<String, dynamic> _$CreativesItemToJson(CreativesItem instance) =>
    <String, dynamic>{
      'creativeType': instance.creativeType,
      'creativeId': instance.creativeId,
      'action': instance.action,
      'actionType': instance.actionType,
      'position': instance.position,
      'logInfo': instance.logInfo,
      'alg': instance.alg,
      'uiElement': instance.uiElement,
      'resources': instance.resources,
    };

ResourcesItem _$ResourcesItemFromJson(Map json) => ResourcesItem()
  ..uiElement = json['uiElement'] == null
      ? null
      : MusicUiElement.fromJson(
          Map<String, dynamic>.from(json['uiElement'] as Map))
  ..resourceType = json['resourceType'] as String?
  ..resourceId = json['resourceId'] as String?
  ..resourceUrl = json['resourceUrl'] as String?
  ..action = json['action'] as String?
  ..actionType = json['actionType'] as String?
  ..valid = json['valid'] as bool?
  ..alg = json['alg'] as String?
  ..logInfo = json['logInfo'] as String?
  ..resourceExtInfo = json['resourceExtInfo'] == null
      ? null
      : ResourceExtInfo.fromJson(
          Map<String, dynamic>.from(json['resourceExtInfo'] as Map));

Map<String, dynamic> _$ResourcesItemToJson(ResourcesItem instance) =>
    <String, dynamic>{
      'uiElement': instance.uiElement,
      'resourceType': instance.resourceType,
      'resourceId': instance.resourceId,
      'resourceUrl': instance.resourceUrl,
      'action': instance.action,
      'actionType': instance.actionType,
      'valid': instance.valid,
      'alg': instance.alg,
      'logInfo': instance.logInfo,
      'resourceExtInfo': instance.resourceExtInfo,
    };

ResourceExtInfo _$ResourceExtInfoFromJson(Map json) => ResourceExtInfo()
  ..startTime = (json['startTime'] as num?)?.toDouble()
  ..endTime = (json['endTime'] as num?)?.toDouble()
  ..playCount = json['playCount'] as int?
  ..highQuality = json['highQuality'] as bool?
  ..specialType = json['specialType'] as int?
  ..alias = json['alias'] as String?
  ..artists = (json['artists'] as List<dynamic>?)
      ?.map((e) =>
          ResourceExtInfoArtists.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList()
  ..songData = json['songData'] == null
      ? null
      : ResourceExtInfoSongData.fromJson(
          Map<String, dynamic>.from(json['songData'] as Map));

Map<String, dynamic> _$ResourceExtInfoToJson(ResourceExtInfo instance) =>
    <String, dynamic>{
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'playCount': instance.playCount,
      'highQuality': instance.highQuality,
      'specialType': instance.specialType,
      'alias': instance.alias,
      'artists': instance.artists,
      'songData': instance.songData,
    };

ResourceExtInfoArtists _$ResourceExtInfoArtistsFromJson(Map json) =>
    ResourceExtInfoArtists()..name = json['name'] as String?;

Map<String, dynamic> _$ResourceExtInfoArtistsToJson(
        ResourceExtInfoArtists instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

ResourceExtInfoSongData _$ResourceExtInfoSongDataFromJson(Map json) =>
    ResourceExtInfoSongData()..name = json['name'] as String?;

Map<String, dynamic> _$ResourceExtInfoSongDataToJson(
        ResourceExtInfoSongData instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

ExtInfoItem _$ExtInfoItemFromJson(Map json) => ExtInfoItem()
  ..id = json['id'] as String?
  ..reason = json['reason'] as String?
  ..mlogBaseDataType = json['mlogBaseDataType'] as int?
  ..type = json['type'] as int?
  ..resource = json['resource'] == null
      ? null
      : ExtInfoItemResource.fromJson(
          Map<String, dynamic>.from(json['resource'] as Map));

Map<String, dynamic> _$ExtInfoItemToJson(ExtInfoItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reason': instance.reason,
      'mlogBaseDataType': instance.mlogBaseDataType,
      'type': instance.type,
      'resource': instance.resource,
    };

ExtInfoItemResource _$ExtInfoItemResourceFromJson(Map json) =>
    ExtInfoItemResource()
      ..shareUrl = json['shareUrl'] as String?
      ..reason = json['reason'] as String?
      ..source = json['source'] as int?
      ..status = json['status'] as int?
      ..mlogBaseData = json['mlogBaseData'] == null
          ? null
          : ResourceMlogBaseData.fromJson(
              Map<String, dynamic>.from(json['mlogBaseData'] as Map));

Map<String, dynamic> _$ExtInfoItemResourceToJson(
        ExtInfoItemResource instance) =>
    <String, dynamic>{
      'shareUrl': instance.shareUrl,
      'reason': instance.reason,
      'source': instance.source,
      'status': instance.status,
      'mlogBaseData': instance.mlogBaseData,
    };

ResourceMlogBaseData _$ResourceMlogBaseDataFromJson(Map json) =>
    ResourceMlogBaseData()
      ..id = json['id'] as String?
      ..originalTitle = json['originalTitle'] as String?
      ..text = json['text'] as String?
      ..coverUrl = json['coverUrl'] as String?
      ..coverHeight = (json['coverHeight'] as num?)?.toDouble()
      ..coverWidth = (json['coverWidth'] as num?)?.toDouble()
      ..video = json['video'] == null
          ? null
          : ResourceMlogBaseDataVideo.fromJson(
              Map<String, dynamic>.from(json['video'] as Map))
      ..type = json['type'] as int?
      ..status = json['status'] as int?;

Map<String, dynamic> _$ResourceMlogBaseDataToJson(
        ResourceMlogBaseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'originalTitle': instance.originalTitle,
      'text': instance.text,
      'coverUrl': instance.coverUrl,
      'coverHeight': instance.coverHeight,
      'coverWidth': instance.coverWidth,
      'video': instance.video,
      'type': instance.type,
      'status': instance.status,
    };

ResourceMlogBaseDataVideo _$ResourceMlogBaseDataVideoFromJson(Map json) =>
    ResourceMlogBaseDataVideo()
      ..videoKey = json['videoKey'] as String?
      ..coverUrl = json['coverUrl'] as String?
      ..frameUrl = json['frameUrl'] as String?
      ..width = (json['width'] as num?)?.toDouble()
      ..height = (json['height'] as num?)?.toDouble();

Map<String, dynamic> _$ResourceMlogBaseDataVideoToJson(
        ResourceMlogBaseDataVideo instance) =>
    <String, dynamic>{
      'videoKey': instance.videoKey,
      'coverUrl': instance.coverUrl,
      'frameUrl': instance.frameUrl,
      'width': instance.width,
      'height': instance.height,
    };
