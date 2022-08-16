// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyPhoneModel _$VerifyPhoneModelFromJson(Map json) => VerifyPhoneModel()
  ..code = json['code'] as int?
  ..nickname = json['nickname'] as String?
  ..hasPassword = json['hasPassword'] as bool?
  ..avatarUrl = json['avatarUrl'] as String?
  ..cellphone = json['cellphone'] as String?;

Map<String, dynamic> _$VerifyPhoneModelToJson(VerifyPhoneModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'nickname': instance.nickname,
      'hasPassword': instance.hasPassword,
      'avatarUrl': instance.avatarUrl,
      'cellphone': instance.cellphone,
    };

EmailLoginMode _$EmailLoginModeFromJson(Map json) => EmailLoginMode()
  ..loginType = json['loginType'] as int?
  ..code = json['code'] as int?
  ..token = json['token'] as String?
  ..cookie = json['cookie'] as String?
  ..account = json['account'] == null
      ? null
      : AccountModel.fromJson(
          Map<String, dynamic>.from(json['account'] as Map));

Map<String, dynamic> _$EmailLoginModeToJson(EmailLoginMode instance) =>
    <String, dynamic>{
      'loginType': instance.loginType,
      'code': instance.code,
      'token': instance.token,
      'cookie': instance.cookie,
      'account': instance.account,
    };

AccountModel _$AccountModelFromJson(Map json) => AccountModel()
  ..id = json['id'] as int?
  ..userName = json['userName'] as String?;

Map<String, dynamic> _$AccountModelToJson(AccountModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
    };
