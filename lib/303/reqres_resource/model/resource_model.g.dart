// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceModel _$ResourceModelFromJson(Map<String, dynamic> json) =>
    ResourceModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResourceModelToJson(ResourceModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as int?,
      name: json['name'] as String?,
      year: json['year'] as int?,
      color: json['color'] as String?,
      pantoneValue: json['pantoneValue'] as String?,
      price: json['price'] as String?,
      statusCode: $enumDecodeNullable(_$StatusCodeEnumMap, json['statusCode']),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'year': instance.year,
      'color': instance.color,
      'pantoneValue': instance.pantoneValue,
      'price': instance.price,
      'statusCode': _$StatusCodeEnumMap[instance.statusCode],
    };

const _$StatusCodeEnumMap = {
  StatusCode.success: 200,
  StatusCode.weird: 500,
};
