// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loyalty_program_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoyaltyProgramState {
  Status? get status;
  RewardStatus? get rewardStatus;
  String? get message;
  ProgramType? get selectedProgramType;
  ProgramType? get selectedFilterProgram;
  bool? get allFilter;
  LoyaltyProgramEntity? get loyaltyProgramEntity;
  Map<ProgramType, List<LoyaltyProgramEntity>>? get listOfPrograms;
  List<LoyaltyProgramEntity>? get listOfSelectedProgram;
  int? get stampReward;

  /// Create a copy of LoyaltyProgramState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoyaltyProgramStateCopyWith<LoyaltyProgramState> get copyWith =>
      _$LoyaltyProgramStateCopyWithImpl<LoyaltyProgramState>(
          this as LoyaltyProgramState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoyaltyProgramState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.rewardStatus, rewardStatus) ||
                other.rewardStatus == rewardStatus) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.selectedProgramType, selectedProgramType) ||
                other.selectedProgramType == selectedProgramType) &&
            (identical(other.selectedFilterProgram, selectedFilterProgram) ||
                other.selectedFilterProgram == selectedFilterProgram) &&
            (identical(other.allFilter, allFilter) ||
                other.allFilter == allFilter) &&
            (identical(other.loyaltyProgramEntity, loyaltyProgramEntity) ||
                other.loyaltyProgramEntity == loyaltyProgramEntity) &&
            const DeepCollectionEquality()
                .equals(other.listOfPrograms, listOfPrograms) &&
            const DeepCollectionEquality()
                .equals(other.listOfSelectedProgram, listOfSelectedProgram) &&
            (identical(other.stampReward, stampReward) ||
                other.stampReward == stampReward));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      rewardStatus,
      message,
      selectedProgramType,
      selectedFilterProgram,
      allFilter,
      loyaltyProgramEntity,
      const DeepCollectionEquality().hash(listOfPrograms),
      const DeepCollectionEquality().hash(listOfSelectedProgram),
      stampReward);

  @override
  String toString() {
    return 'LoyaltyProgramState(status: $status, rewardStatus: $rewardStatus, message: $message, selectedProgramType: $selectedProgramType, selectedFilterProgram: $selectedFilterProgram, allFilter: $allFilter, loyaltyProgramEntity: $loyaltyProgramEntity, listOfPrograms: $listOfPrograms, listOfSelectedProgram: $listOfSelectedProgram, stampReward: $stampReward)';
  }
}

/// @nodoc
abstract mixin class $LoyaltyProgramStateCopyWith<$Res> {
  factory $LoyaltyProgramStateCopyWith(
          LoyaltyProgramState value, $Res Function(LoyaltyProgramState) _then) =
      _$LoyaltyProgramStateCopyWithImpl;
  @useResult
  $Res call(
      {Status? status,
      RewardStatus? rewardStatus,
      String? message,
      ProgramType? selectedProgramType,
      ProgramType? selectedFilterProgram,
      bool? allFilter,
      LoyaltyProgramEntity? loyaltyProgramEntity,
      Map<ProgramType, List<LoyaltyProgramEntity>>? listOfPrograms,
      List<LoyaltyProgramEntity>? listOfSelectedProgram,
      int? stampReward});
}

/// @nodoc
class _$LoyaltyProgramStateCopyWithImpl<$Res>
    implements $LoyaltyProgramStateCopyWith<$Res> {
  _$LoyaltyProgramStateCopyWithImpl(this._self, this._then);

  final LoyaltyProgramState _self;
  final $Res Function(LoyaltyProgramState) _then;

  /// Create a copy of LoyaltyProgramState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? rewardStatus = freezed,
    Object? message = freezed,
    Object? selectedProgramType = freezed,
    Object? selectedFilterProgram = freezed,
    Object? allFilter = freezed,
    Object? loyaltyProgramEntity = freezed,
    Object? listOfPrograms = freezed,
    Object? listOfSelectedProgram = freezed,
    Object? stampReward = freezed,
  }) {
    return _then(_self.copyWith(
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status?,
      rewardStatus: freezed == rewardStatus
          ? _self.rewardStatus
          : rewardStatus // ignore: cast_nullable_to_non_nullable
              as RewardStatus?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedProgramType: freezed == selectedProgramType
          ? _self.selectedProgramType
          : selectedProgramType // ignore: cast_nullable_to_non_nullable
              as ProgramType?,
      selectedFilterProgram: freezed == selectedFilterProgram
          ? _self.selectedFilterProgram
          : selectedFilterProgram // ignore: cast_nullable_to_non_nullable
              as ProgramType?,
      allFilter: freezed == allFilter
          ? _self.allFilter
          : allFilter // ignore: cast_nullable_to_non_nullable
              as bool?,
      loyaltyProgramEntity: freezed == loyaltyProgramEntity
          ? _self.loyaltyProgramEntity
          : loyaltyProgramEntity // ignore: cast_nullable_to_non_nullable
              as LoyaltyProgramEntity?,
      listOfPrograms: freezed == listOfPrograms
          ? _self.listOfPrograms
          : listOfPrograms // ignore: cast_nullable_to_non_nullable
              as Map<ProgramType, List<LoyaltyProgramEntity>>?,
      listOfSelectedProgram: freezed == listOfSelectedProgram
          ? _self.listOfSelectedProgram
          : listOfSelectedProgram // ignore: cast_nullable_to_non_nullable
              as List<LoyaltyProgramEntity>?,
      stampReward: freezed == stampReward
          ? _self.stampReward
          : stampReward // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _LoyaltyProgramState extends LoyaltyProgramState {
  const _LoyaltyProgramState(
      {this.status,
      this.rewardStatus,
      this.message,
      this.selectedProgramType,
      this.selectedFilterProgram,
      this.allFilter,
      this.loyaltyProgramEntity,
      final Map<ProgramType, List<LoyaltyProgramEntity>>? listOfPrograms,
      final List<LoyaltyProgramEntity>? listOfSelectedProgram,
      this.stampReward})
      : _listOfPrograms = listOfPrograms,
        _listOfSelectedProgram = listOfSelectedProgram,
        super._();

  @override
  final Status? status;
  @override
  final RewardStatus? rewardStatus;
  @override
  final String? message;
  @override
  final ProgramType? selectedProgramType;
  @override
  final ProgramType? selectedFilterProgram;
  @override
  final bool? allFilter;
  @override
  final LoyaltyProgramEntity? loyaltyProgramEntity;
  final Map<ProgramType, List<LoyaltyProgramEntity>>? _listOfPrograms;
  @override
  Map<ProgramType, List<LoyaltyProgramEntity>>? get listOfPrograms {
    final value = _listOfPrograms;
    if (value == null) return null;
    if (_listOfPrograms is EqualUnmodifiableMapView) return _listOfPrograms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<LoyaltyProgramEntity>? _listOfSelectedProgram;
  @override
  List<LoyaltyProgramEntity>? get listOfSelectedProgram {
    final value = _listOfSelectedProgram;
    if (value == null) return null;
    if (_listOfSelectedProgram is EqualUnmodifiableListView)
      return _listOfSelectedProgram;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? stampReward;

  /// Create a copy of LoyaltyProgramState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoyaltyProgramStateCopyWith<_LoyaltyProgramState> get copyWith =>
      __$LoyaltyProgramStateCopyWithImpl<_LoyaltyProgramState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoyaltyProgramState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.rewardStatus, rewardStatus) ||
                other.rewardStatus == rewardStatus) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.selectedProgramType, selectedProgramType) ||
                other.selectedProgramType == selectedProgramType) &&
            (identical(other.selectedFilterProgram, selectedFilterProgram) ||
                other.selectedFilterProgram == selectedFilterProgram) &&
            (identical(other.allFilter, allFilter) ||
                other.allFilter == allFilter) &&
            (identical(other.loyaltyProgramEntity, loyaltyProgramEntity) ||
                other.loyaltyProgramEntity == loyaltyProgramEntity) &&
            const DeepCollectionEquality()
                .equals(other._listOfPrograms, _listOfPrograms) &&
            const DeepCollectionEquality()
                .equals(other._listOfSelectedProgram, _listOfSelectedProgram) &&
            (identical(other.stampReward, stampReward) ||
                other.stampReward == stampReward));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      rewardStatus,
      message,
      selectedProgramType,
      selectedFilterProgram,
      allFilter,
      loyaltyProgramEntity,
      const DeepCollectionEquality().hash(_listOfPrograms),
      const DeepCollectionEquality().hash(_listOfSelectedProgram),
      stampReward);

  @override
  String toString() {
    return 'LoyaltyProgramState(status: $status, rewardStatus: $rewardStatus, message: $message, selectedProgramType: $selectedProgramType, selectedFilterProgram: $selectedFilterProgram, allFilter: $allFilter, loyaltyProgramEntity: $loyaltyProgramEntity, listOfPrograms: $listOfPrograms, listOfSelectedProgram: $listOfSelectedProgram, stampReward: $stampReward)';
  }
}

/// @nodoc
abstract mixin class _$LoyaltyProgramStateCopyWith<$Res>
    implements $LoyaltyProgramStateCopyWith<$Res> {
  factory _$LoyaltyProgramStateCopyWith(_LoyaltyProgramState value,
          $Res Function(_LoyaltyProgramState) _then) =
      __$LoyaltyProgramStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Status? status,
      RewardStatus? rewardStatus,
      String? message,
      ProgramType? selectedProgramType,
      ProgramType? selectedFilterProgram,
      bool? allFilter,
      LoyaltyProgramEntity? loyaltyProgramEntity,
      Map<ProgramType, List<LoyaltyProgramEntity>>? listOfPrograms,
      List<LoyaltyProgramEntity>? listOfSelectedProgram,
      int? stampReward});
}

/// @nodoc
class __$LoyaltyProgramStateCopyWithImpl<$Res>
    implements _$LoyaltyProgramStateCopyWith<$Res> {
  __$LoyaltyProgramStateCopyWithImpl(this._self, this._then);

  final _LoyaltyProgramState _self;
  final $Res Function(_LoyaltyProgramState) _then;

  /// Create a copy of LoyaltyProgramState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = freezed,
    Object? rewardStatus = freezed,
    Object? message = freezed,
    Object? selectedProgramType = freezed,
    Object? selectedFilterProgram = freezed,
    Object? allFilter = freezed,
    Object? loyaltyProgramEntity = freezed,
    Object? listOfPrograms = freezed,
    Object? listOfSelectedProgram = freezed,
    Object? stampReward = freezed,
  }) {
    return _then(_LoyaltyProgramState(
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status?,
      rewardStatus: freezed == rewardStatus
          ? _self.rewardStatus
          : rewardStatus // ignore: cast_nullable_to_non_nullable
              as RewardStatus?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedProgramType: freezed == selectedProgramType
          ? _self.selectedProgramType
          : selectedProgramType // ignore: cast_nullable_to_non_nullable
              as ProgramType?,
      selectedFilterProgram: freezed == selectedFilterProgram
          ? _self.selectedFilterProgram
          : selectedFilterProgram // ignore: cast_nullable_to_non_nullable
              as ProgramType?,
      allFilter: freezed == allFilter
          ? _self.allFilter
          : allFilter // ignore: cast_nullable_to_non_nullable
              as bool?,
      loyaltyProgramEntity: freezed == loyaltyProgramEntity
          ? _self.loyaltyProgramEntity
          : loyaltyProgramEntity // ignore: cast_nullable_to_non_nullable
              as LoyaltyProgramEntity?,
      listOfPrograms: freezed == listOfPrograms
          ? _self._listOfPrograms
          : listOfPrograms // ignore: cast_nullable_to_non_nullable
              as Map<ProgramType, List<LoyaltyProgramEntity>>?,
      listOfSelectedProgram: freezed == listOfSelectedProgram
          ? _self._listOfSelectedProgram
          : listOfSelectedProgram // ignore: cast_nullable_to_non_nullable
              as List<LoyaltyProgramEntity>?,
      stampReward: freezed == stampReward
          ? _self.stampReward
          : stampReward // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
