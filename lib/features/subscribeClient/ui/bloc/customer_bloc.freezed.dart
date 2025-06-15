// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerState {
  CustomerStatus? get status;
  ProgramStatus? get programStatus;
  String? get message;
  List<LoyaltyProgramEntity>? get listOfPrograms;
  CustomerEntity? get customerEntity;

  /// Create a copy of CustomerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomerStateCopyWith<CustomerState> get copyWith =>
      _$CustomerStateCopyWithImpl<CustomerState>(
          this as CustomerState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomerState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.programStatus, programStatus) ||
                other.programStatus == programStatus) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other.listOfPrograms, listOfPrograms) &&
            (identical(other.customerEntity, customerEntity) ||
                other.customerEntity == customerEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, programStatus, message,
      const DeepCollectionEquality().hash(listOfPrograms), customerEntity);

  @override
  String toString() {
    return 'CustomerState(status: $status, programStatus: $programStatus, message: $message, listOfPrograms: $listOfPrograms, customerEntity: $customerEntity)';
  }
}

/// @nodoc
abstract mixin class $CustomerStateCopyWith<$Res> {
  factory $CustomerStateCopyWith(
          CustomerState value, $Res Function(CustomerState) _then) =
      _$CustomerStateCopyWithImpl;
  @useResult
  $Res call(
      {CustomerStatus? status,
      ProgramStatus? programStatus,
      String? message,
      List<LoyaltyProgramEntity>? listOfPrograms,
      CustomerEntity? customerEntity});

  $CustomerEntityCopyWith<$Res>? get customerEntity;
}

/// @nodoc
class _$CustomerStateCopyWithImpl<$Res>
    implements $CustomerStateCopyWith<$Res> {
  _$CustomerStateCopyWithImpl(this._self, this._then);

  final CustomerState _self;
  final $Res Function(CustomerState) _then;

  /// Create a copy of CustomerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? programStatus = freezed,
    Object? message = freezed,
    Object? listOfPrograms = freezed,
    Object? customerEntity = freezed,
  }) {
    return _then(_self.copyWith(
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CustomerStatus?,
      programStatus: freezed == programStatus
          ? _self.programStatus
          : programStatus // ignore: cast_nullable_to_non_nullable
              as ProgramStatus?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      listOfPrograms: freezed == listOfPrograms
          ? _self.listOfPrograms
          : listOfPrograms // ignore: cast_nullable_to_non_nullable
              as List<LoyaltyProgramEntity>?,
      customerEntity: freezed == customerEntity
          ? _self.customerEntity
          : customerEntity // ignore: cast_nullable_to_non_nullable
              as CustomerEntity?,
    ));
  }

  /// Create a copy of CustomerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerEntityCopyWith<$Res>? get customerEntity {
    if (_self.customerEntity == null) {
      return null;
    }

    return $CustomerEntityCopyWith<$Res>(_self.customerEntity!, (value) {
      return _then(_self.copyWith(customerEntity: value));
    });
  }
}

/// @nodoc

class _CustomerState extends CustomerState {
  const _CustomerState(
      {this.status,
      this.programStatus,
      this.message,
      final List<LoyaltyProgramEntity>? listOfPrograms,
      this.customerEntity})
      : _listOfPrograms = listOfPrograms,
        super._();

  @override
  final CustomerStatus? status;
  @override
  final ProgramStatus? programStatus;
  @override
  final String? message;
  final List<LoyaltyProgramEntity>? _listOfPrograms;
  @override
  List<LoyaltyProgramEntity>? get listOfPrograms {
    final value = _listOfPrograms;
    if (value == null) return null;
    if (_listOfPrograms is EqualUnmodifiableListView) return _listOfPrograms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final CustomerEntity? customerEntity;

  /// Create a copy of CustomerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomerStateCopyWith<_CustomerState> get copyWith =>
      __$CustomerStateCopyWithImpl<_CustomerState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomerState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.programStatus, programStatus) ||
                other.programStatus == programStatus) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._listOfPrograms, _listOfPrograms) &&
            (identical(other.customerEntity, customerEntity) ||
                other.customerEntity == customerEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, programStatus, message,
      const DeepCollectionEquality().hash(_listOfPrograms), customerEntity);

  @override
  String toString() {
    return 'CustomerState(status: $status, programStatus: $programStatus, message: $message, listOfPrograms: $listOfPrograms, customerEntity: $customerEntity)';
  }
}

/// @nodoc
abstract mixin class _$CustomerStateCopyWith<$Res>
    implements $CustomerStateCopyWith<$Res> {
  factory _$CustomerStateCopyWith(
          _CustomerState value, $Res Function(_CustomerState) _then) =
      __$CustomerStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {CustomerStatus? status,
      ProgramStatus? programStatus,
      String? message,
      List<LoyaltyProgramEntity>? listOfPrograms,
      CustomerEntity? customerEntity});

  @override
  $CustomerEntityCopyWith<$Res>? get customerEntity;
}

/// @nodoc
class __$CustomerStateCopyWithImpl<$Res>
    implements _$CustomerStateCopyWith<$Res> {
  __$CustomerStateCopyWithImpl(this._self, this._then);

  final _CustomerState _self;
  final $Res Function(_CustomerState) _then;

  /// Create a copy of CustomerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = freezed,
    Object? programStatus = freezed,
    Object? message = freezed,
    Object? listOfPrograms = freezed,
    Object? customerEntity = freezed,
  }) {
    return _then(_CustomerState(
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CustomerStatus?,
      programStatus: freezed == programStatus
          ? _self.programStatus
          : programStatus // ignore: cast_nullable_to_non_nullable
              as ProgramStatus?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      listOfPrograms: freezed == listOfPrograms
          ? _self._listOfPrograms
          : listOfPrograms // ignore: cast_nullable_to_non_nullable
              as List<LoyaltyProgramEntity>?,
      customerEntity: freezed == customerEntity
          ? _self.customerEntity
          : customerEntity // ignore: cast_nullable_to_non_nullable
              as CustomerEntity?,
    ));
  }

  /// Create a copy of CustomerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerEntityCopyWith<$Res>? get customerEntity {
    if (_self.customerEntity == null) {
      return null;
    }

    return $CustomerEntityCopyWith<$Res>(_self.customerEntity!, (value) {
      return _then(_self.copyWith(customerEntity: value));
    });
  }
}

// dart format on
