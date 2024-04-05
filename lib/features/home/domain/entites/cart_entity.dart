import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_entity.g.dart';
part 'cart_entity.freezed.dart';

@freezed
class CartEntity with _$CartEntity {
  const factory CartEntity(
      {required String id,
      required int count,
      required String service}) = _CartEntity;

  factory CartEntity.fromJson(Map<String, dynamic> json) =>
      _$CartEntityFromJson(json);
}
