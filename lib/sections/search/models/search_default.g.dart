// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_default.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchDefaultWrap _$SearchDefaultWrapFromJson(Map json) => SearchDefaultWrap()
  ..message = json['message'] as String?
  ..code = json['code'] as int?
  ..data = json['data'] == null
      ? null
      : SearchDefaultData.fromJson(
          Map<String, dynamic>.from(json['data'] as Map));

Map<String, dynamic> _$SearchDefaultWrapToJson(SearchDefaultWrap instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };

SearchDefaultData _$SearchDefaultDataFromJson(Map json) => SearchDefaultData()
  ..showKeyword = json['showKeyword'] as String?
  ..realkeyword = json['realkeyword'] as String?
  ..searchType = json['searchType'] as int?;

Map<String, dynamic> _$SearchDefaultDataToJson(SearchDefaultData instance) =>
    <String, dynamic>{
      'showKeyword': instance.showKeyword,
      'realkeyword': instance.realkeyword,
      'searchType': instance.searchType,
    };
