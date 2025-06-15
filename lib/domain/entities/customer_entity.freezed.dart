// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerEntity {
  int? get id;
  String get name;
  String? get phone;
  String? get email;
  List<LoyaltyProgramEntity> get loyaltyPrograms;

  /// Create a copy of CustomerEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomerEntityCopyWith<CustomerEntity> get copyWith =>
      _$CustomerEntityCopyWithImpl<CustomerEntity>(
          this as CustomerEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomerEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality()
                .equals(other.loyaltyPrograms, loyaltyPrograms));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, phone, email,
      const DeepCollectionEquality().hash(loyaltyPrograms));

  @override
  String toString() {
    return 'CustomerEntity(id: $id, name: $name, phone: $phone, email: $email, loyaltyPrograms: $loyaltyPrograms)';
  }
}

/// @nodoc
abstract mixin class $CustomerEntityCopyWith<$Res> {
  factory $CustomerEntityCopyWith(
          CustomerEntity value, $Res Function(CustomerEntity) _then) =
      _$CustomerEntityCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String name,
      String? phone,
      String? email,
      List<LoyaltyProgramEntity> loyaltyPrograms});
}

/// @nodoc
class _$CustomerEntityCopyWithImpl<$Res>
    implements $CustomerEntityCopyWith<$Res> {
  _$CustomerEntityCopyWithImpl(this._self, this._then);

  final CustomerEntity _self;
  final $Res Function(CustomerEntity) _then;

  /// Create a copy of CustomerEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? phone = freezed,
    Object? email = freezed,
    Object? loyaltyPrograms = null,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      loyaltyPrograms: null == loyaltyPrograms
          ? _self.loyaltyPrograms
          : loyaltyPrograms // ignore: cast_nullable_to_non_nullable
              as List<LoyaltyProgramEntity>,
    ));
  }
}

/// @nodoc

class _CustomerEntity extends CustomerEntity {
  const _CustomerEntity(
      {this.id,
      this.name = '',
      this.phone,
      this.email,
      final List<LoyaltyProgramEntity> loyaltyPrograms = const []})
      : _loyaltyPrograms = loyaltyPrograms,
        super._();

  @override
  final int? id;
  @override
  @JsonKey()
  final String name;
  @override
  final String? phone;
  @override
  final String? email;
  final List<LoyaltyProgramEntity> _loyaltyPrograms;
  @override
  @JsonKey()
  List<LoyaltyProgramEntity> get loyaltyPrograms {
    if (_loyaltyPrograms is EqualUnmodifiableListView) return _loyaltyPrograms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_loyaltyPrograms);
  }

  /// Create a copy of CustomerEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomerEntityCopyWith<_CustomerEntity> get copyWith =>
      __$CustomerEntityCopyWithImpl<_CustomerEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomerEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality()
                .equals(other._loyaltyPrograms, _loyaltyPrograms));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, phone, email,
      const DeepCollectionEquality().hash(_loyaltyPrograms));

  @override
  String toString() {
    return 'CustomerEntity(id: $id, name: $name, phone: $phone, email: $email, loyaltyPrograms: $loyaltyPrograms)';
  }
}

/// @nodoc
abstract mixin class _$CustomerEntityCopyWith<$Res>
    implements $CustomerEntityCopyWith<$Res> {
  factory _$CustomerEntityCopyWith(
          _CustomerEntity value, $Res Function(_CustomerEntity) _then) =
      __$CustomerEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String name,
      String? phone,
      String? email,
      List<LoyaltyProgramEntity> loyaltyPrograms});
}

/// @nodoc
class __$CustomerEntityCopyWithImpl<$Res>
    implements _$CustomerEntityCopyWith<$Res> {
  __$CustomerEntityCopyWithImpl(this._self, this._then);

  final _CustomerEntity _self;
  final $Res Function(_CustomerEntity) _then;

  /// Create a copy of CustomerEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? phone = freezed,
    Object? email = freezed,
    Object? loyaltyPrograms = null,
  }) {
    return _then(_CustomerEntity(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      loyaltyPrograms: null == loyaltyPrograms
          ? _self._loyaltyPrograms
          : loyaltyPrograms // ignore: cast_nullable_to_non_nullable
              as List<LoyaltyProgramEntity>,
    ));
  }
}

// dart format on
