// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimpleModel _$SimpleModelFromJson(Map json) => SimpleModel()
  ..message = json['message'] as String?
  ..code = json['code'] as int?
  ..data = json['data'];

Map<String, dynamic> _$SimpleModelToJson(SimpleModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };

IntSimpleModel _$IntSimpleModelFromJson(Map json) => IntSimpleModel()
  ..message = json['message'] as String?
  ..code = json['code'] as int?
  ..data = json['data'] as int?;

Map<String, dynamic> _$IntSimpleModelToJson(IntSimpleModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };

StringSimpleModel _$StringSimpleModelFromJson(Map json) => StringSimpleModel()
  ..message = json['message'] as String?
  ..code = json['code'] as int?
  ..data = json['data'] as String?;

Map<String, dynamic> _$StringSimpleModelToJson(StringSimpleModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
