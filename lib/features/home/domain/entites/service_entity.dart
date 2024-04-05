import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_entity.g.dart';
part 'service_entity.freezed.dart';

@freezed
class ServiceEntity with _$ServiceEntity {
  const factory ServiceEntity({
    required String id,
    required String service,
    required num price,
    required int count,
  }) = _ServiceEntity;

  factory ServiceEntity.fromJson(Map<String, dynamic> json) =>
      _$ServiceEntityFromJson(json);
}
