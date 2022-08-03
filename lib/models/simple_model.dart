import 'package:json_annotation/json_annotation.dart';

import 'common_model.dart';

part 'simple_model.g.dart';

@JsonSerializable()
class SimpleModel extends CommonModel {
  SimpleModel();

  factory SimpleModel.fromJson(Map<String, dynamic> json) =>
      _$SimpleModelFromJson(json);

  toJson() => _$SimpleModelToJson(this);
}

@JsonSerializable()
class IntSimpleModel extends CommonModel<int> {
  IntSimpleModel();

  factory IntSimpleModel.fromJson(Map<String, dynamic> json) =>
      _$IntSimpleModelFromJson(json);

  toJson() => _$IntSimpleModelToJson(this);
}

@JsonSerializable()
class StringSimpleModel extends CommonModel<String> {
  StringSimpleModel();

  factory StringSimpleModel.fromJson(Map<String, dynamic> json) =>
      _$StringSimpleModelFromJson(json);

  toJson() => _$StringSimpleModelToJson(this);
}
