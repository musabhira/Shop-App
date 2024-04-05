// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServiceEntity _$ServiceEntityFromJson(Map<String, dynamic> json) {
  return _ServiceEntity.fromJson(json);
}

/// @nodoc
mixin _$ServiceEntity {
  String get id => throw _privateConstructorUsedError;
  String get service => throw _privateConstructorUsedError;
  num get price => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceEntityCopyWith<ServiceEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceEntityCopyWith<$Res> {
  factory $ServiceEntityCopyWith(
          ServiceEntity value, $Res Function(ServiceEntity) then) =
      _$ServiceEntityCopyWithImpl<$Res, ServiceEntity>;
  @useResult
  $Res call({String id, String service, num price, int count});
}

/// @nodoc
class _$ServiceEntityCopyWithImpl<$Res, $Val extends ServiceEntity>
    implements $ServiceEntityCopyWith<$Res> {
  _$ServiceEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? service = null,
    Object? price = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceEntityImplCopyWith<$Res>
    implements $ServiceEntityCopyWith<$Res> {
  factory _$$ServiceEntityImplCopyWith(
          _$ServiceEntityImpl value, $Res Function(_$ServiceEntityImpl) then) =
      __$$ServiceEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String service, num price, int count});
}

/// @nodoc
class __$$ServiceEntityImplCopyWithImpl<$Res>
    extends _$ServiceEntityCopyWithImpl<$Res, _$ServiceEntityImpl>
    implements _$$ServiceEntityImplCopyWith<$Res> {
  __$$ServiceEntityImplCopyWithImpl(
      _$ServiceEntityImpl _value, $Res Function(_$ServiceEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? service = null,
    Object? price = null,
    Object? count = null,
  }) {
    return _then(_$ServiceEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceEntityImpl implements _ServiceEntity {
  const _$ServiceEntityImpl(
      {required this.id,
      required this.service,
      required this.price,
      required this.count});

  factory _$ServiceEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String service;
  @override
  final num price;
  @override
  final int count;

  @override
  String toString() {
    return 'ServiceEntity(id: $id, service: $service, price: $price, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, service, price, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceEntityImplCopyWith<_$ServiceEntityImpl> get copyWith =>
      __$$ServiceEntityImplCopyWithImpl<_$ServiceEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceEntityImplToJson(
      this,
    );
  }
}

abstract class _ServiceEntity implements ServiceEntity {
  const factory _ServiceEntity(
      {required final String id,
      required final String service,
      required final num price,
      required final int count}) = _$ServiceEntityImpl;

  factory _ServiceEntity.fromJson(Map<String, dynamic> json) =
      _$ServiceEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get service;
  @override
  num get price;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$ServiceEntityImplCopyWith<_$ServiceEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
