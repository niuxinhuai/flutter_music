import 'package:json_annotation/json_annotation.dart';
part 'login.g.dart';

@JsonSerializable()
class VerifyPhoneModel {
  VerifyPhoneModel();

  int? code;
  String? nickname;
  bool? hasPassword;
  String? avatarUrl;
  String? cellphone;

  factory VerifyPhoneModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyPhoneModelFromJson(json);

  toJson() => _$VerifyPhoneModelToJson(this);
}

@JsonSerializable()
class EmailLoginMode {
  EmailLoginMode();

  int? loginType;
  int? code;
  String? token;
  String? cookie;
  AccountModel? account;

  factory EmailLoginMode.fromJson(Map<String, dynamic> json) =>
      _$EmailLoginModeFromJson(json);

  toJson() => _$EmailLoginModeToJson(this);
}

@JsonSerializable()
class AccountModel {
  AccountModel();

  int? id;
  String? userName;

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);

  toJson() => _$AccountModelToJson(this);
}
