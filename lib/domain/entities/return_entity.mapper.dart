// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'return_entity.dart';

class ReturnEntityMapper extends ClassMapperBase<ReturnEntity> {
  ReturnEntityMapper._();

  static ReturnEntityMapper? _instance;
  static ReturnEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ReturnEntityMapper._());
      RewardEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ReturnEntity';

  static String _$programId(ReturnEntity v) => v.programId;
  static const Field<ReturnEntity, String> _f$programId = Field(
    'programId',
    _$programId,
  );
  static String _$name(ReturnEntity v) => v.name;
  static const Field<ReturnEntity, String> _f$name = Field('name', _$name);
  static int _$numberHoles(ReturnEntity v) => v.totalReturns;
  static const Field<ReturnEntity, int> _f$numberHoles = Field(
    'numberHoles',
    _$numberHoles,
  );
  static List<int> _$winningNumbers(ReturnEntity v) => v.rewardingReturns;
  static const Field<ReturnEntity, List<int>> _f$winningNumbers = Field(
    'winningNumbers',
    _$winningNumbers,
  );
  static List<RewardEntity> _$rewards(ReturnEntity v) => v.rewards;
  static const Field<ReturnEntity, List<RewardEntity>> _f$rewards = Field(
    'rewards',
    _$rewards,
  );
  static int _$validityMonth(ReturnEntity v) => v.validityMonth;
  static const Field<ReturnEntity, int> _f$validityMonth = Field(
    'validityMonth',
    _$validityMonth,
  );
  static DateTime? _$createdAt(ReturnEntity v) => v.createdAt;
  static const Field<ReturnEntity, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    opt: true,
  );
  static DateTime? _$updatedAt(ReturnEntity v) => v.updatedAt;
  static const Field<ReturnEntity, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    opt: true,
  );
  static List<Object?> _$props(ReturnEntity v) => v.props;
  static const Field<ReturnEntity, List<Object?>> _f$props = Field(
    'props',
    _$props,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<ReturnEntity> fields = const {
    #programId: _f$programId,
    #name: _f$name,
    #numberHoles: _f$numberHoles,
    #winningNumbers: _f$winningNumbers,
    #rewards: _f$rewards,
    #validityMonth: _f$validityMonth,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #props: _f$props,
  };

  static ReturnEntity _instantiate(DecodingData data) {
    return ReturnEntity(
      programId: data.dec(_f$programId),
      name: data.dec(_f$name),
      totalReturns: data.dec(_f$numberHoles),
      rewardingReturns: data.dec(_f$winningNumbers),
      rewards: data.dec(_f$rewards),
      validityMonth: data.dec(_f$validityMonth),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ReturnEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ReturnEntity>(map);
  }

  static ReturnEntity fromJson(String json) {
    return ensureInitialized().decodeJson<ReturnEntity>(json);
  }
}

mixin ReturnEntityMappable {
  String toJson() {
    return ReturnEntityMapper.ensureInitialized().encodeJson<ReturnEntity>(
      this as ReturnEntity,
    );
  }

  Map<String, dynamic> toMap() {
    return ReturnEntityMapper.ensureInitialized().encodeMap<ReturnEntity>(
      this as ReturnEntity,
    );
  }

  ReturnEntityCopyWith<ReturnEntity, ReturnEntity, ReturnEntity> get copyWith =>
      _ReturnEntityCopyWithImpl<ReturnEntity, ReturnEntity>(
        this as ReturnEntity,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ReturnEntityMapper.ensureInitialized().stringifyValue(
      this as ReturnEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return ReturnEntityMapper.ensureInitialized().equalsValue(
      this as ReturnEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return ReturnEntityMapper.ensureInitialized().hashValue(
      this as ReturnEntity,
    );
  }
}

extension ReturnEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ReturnEntity, $Out> {
  ReturnEntityCopyWith<$R, ReturnEntity, $Out> get $asReturnEntity =>
      $base.as((v, t, t2) => _ReturnEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ReturnEntityCopyWith<$R, $In extends ReturnEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get winningNumbers;
  ListCopyWith<
    $R,
    RewardEntity,
    RewardEntityCopyWith<$R, RewardEntity, RewardEntity>
  >
  get rewards;
  $R call({
    String? programId,
    String? name,
    int? numberHoles,
    List<int>? winningNumbers,
    List<RewardEntity>? rewards,
    int? validityMonth,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  ReturnEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ReturnEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ReturnEntity, $Out>
    implements ReturnEntityCopyWith<$R, ReturnEntity, $Out> {
  _ReturnEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ReturnEntity> $mapper =
      ReturnEntityMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get winningNumbers =>
      ListCopyWith(
        $value.rewardingReturns,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(winningNumbers: v),
      );
  @override
  ListCopyWith<
    $R,
    RewardEntity,
    RewardEntityCopyWith<$R, RewardEntity, RewardEntity>
  >
  get rewards => ListCopyWith(
    $value.rewards,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(rewards: v),
  );
  @override
  $R call({
    String? programId,
    String? name,
    int? numberHoles,
    List<int>? winningNumbers,
    List<RewardEntity>? rewards,
    int? validityMonth,
    Object? createdAt = $none,
    Object? updatedAt = $none,
  }) => $apply(
    FieldCopyWithData({
      if (programId != null) #programId: programId,
      if (name != null) #name: name,
      if (numberHoles != null) #numberHoles: numberHoles,
      if (winningNumbers != null) #winningNumbers: winningNumbers,
      if (rewards != null) #rewards: rewards,
      if (validityMonth != null) #validityMonth: validityMonth,
      if (createdAt != $none) #createdAt: createdAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
    }),
  );
  @override
  ReturnEntity $make(CopyWithData data) => ReturnEntity(
    programId: data.get(#programId, or: $value.programId),
    name: data.get(#name, or: $value.name),
    totalReturns: data.get(#numberHoles, or: $value.totalReturns),
    rewardingReturns: data.get(#winningNumbers, or: $value.rewardingReturns),
    rewards: data.get(#rewards, or: $value.rewards),
    validityMonth: data.get(#validityMonth, or: $value.validityMonth),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
  );

  @override
  ReturnEntityCopyWith<$R2, ReturnEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ReturnEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

