// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceEntityImpl _$$ServiceEntityImplFromJson(Map<String, dynamic> json) =>
    _$ServiceEntityImpl(
      id: json['id'] as String,
      service: json['service'] as String,
      price: json['price'] as num,
      count: json['count'] as int,
    );

Map<String, dynamic> _$$ServiceEntityImplToJson(_$ServiceEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'service': instance.service,
      'price': instance.price,
      'count': instance.count,
    };
