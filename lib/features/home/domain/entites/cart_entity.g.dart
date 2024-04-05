// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartEntityImpl _$$CartEntityImplFromJson(Map<String, dynamic> json) =>
    _$CartEntityImpl(
      id: json['id'] as String,
      count: json['count'] as int,
      service: json['service'] as String,
    );

Map<String, dynamic> _$$CartEntityImplToJson(_$CartEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'count': instance.count,
      'service': instance.service,
    };
