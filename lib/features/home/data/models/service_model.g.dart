// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceModelImpl _$$ServiceModelImplFromJson(Map<String, dynamic> json) =>
    _$ServiceModelImpl(
      id: json['id'] as String,
      service: json['service'] as String,
      price: json['price'] as num,
    );

Map<String, dynamic> _$$ServiceModelImplToJson(_$ServiceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'service': instance.service,
      'price': instance.price,
    };
