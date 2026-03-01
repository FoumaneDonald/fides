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
  static int _$numberHoles(ReturnEntity v) => v.numberHoles;
  static const Field<ReturnEntity, int> _f$numberHoles = Field(
    'numberHoles',
    _$numberHoles,
  );
  static List<int> _$winningNumbers(ReturnEntity v) => v.winningNumbers;
  static const Field<ReturnEntity, List<int>> _f$winningNumbers = Field(
    'winningNumbers',
    _$winningNumbers,
  );
  static List<RewardEntity> _$rewards(ReturnEntity v) => v.rewards;
  static const Field<ReturnEntity, List<RewardEntity>> _f$rewards = Field(
    'rewards',
    _$rewards,
  );
  static int _$lastingNumber(ReturnEntity v) => v.lastingNumber;
  static const Field<ReturnEntity, int> _f$lastingNumber = Field(
    'lastingNumber',
    _$lastingNumber,
  );
  static TimeUnit _$lastingPeriod(ReturnEntity v) => v.lastingPeriod;
  static const Field<ReturnEntity, TimeUnit> _f$lastingPeriod = Field(
    'lastingPeriod',
    _$lastingPeriod,
  );
  static DateTime? _$startingDate(ReturnEntity v) => v.startingDate;
  static const Field<ReturnEntity, DateTime> _f$startingDate = Field(
    'startingDate',
    _$startingDate,
    opt: true,
  );
  static DateTime? _$endDate(ReturnEntity v) => v.endDate;
  static const Field<ReturnEntity, DateTime> _f$endDate = Field(
    'endDate',
    _$endDate,
    opt: true,
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
    #lastingNumber: _f$lastingNumber,
    #lastingPeriod: _f$lastingPeriod,
    #startingDate: _f$startingDate,
    #endDate: _f$endDate,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #props: _f$props,
  };

  static ReturnEntity _instantiate(DecodingData data) {
    return ReturnEntity(
      programId: data.dec(_f$programId),
      name: data.dec(_f$name),
      numberHoles: data.dec(_f$numberHoles),
      winningNumbers: data.dec(_f$winningNumbers),
      rewards: data.dec(_f$rewards),
      lastingNumber: data.dec(_f$lastingNumber),
      lastingPeriod: data.dec(_f$lastingPeriod),
      startingDate: data.dec(_f$startingDate),
      endDate: data.dec(_f$endDate),
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
    int? lastingNumber,
    TimeUnit? lastingPeriod,
    DateTime? startingDate,
    DateTime? endDate,
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
        $value.winningNumbers,
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
    int? lastingNumber,
    TimeUnit? lastingPeriod,
    Object? startingDate = $none,
    Object? endDate = $none,
    Object? createdAt = $none,
    Object? updatedAt = $none,
  }) => $apply(
    FieldCopyWithData({
      if (programId != null) #programId: programId,
      if (name != null) #name: name,
      if (numberHoles != null) #numberHoles: numberHoles,
      if (winningNumbers != null) #winningNumbers: winningNumbers,
      if (rewards != null) #rewards: rewards,
      if (lastingNumber != null) #lastingNumber: lastingNumber,
      if (lastingPeriod != null) #lastingPeriod: lastingPeriod,
      if (startingDate != $none) #startingDate: startingDate,
      if (endDate != $none) #endDate: endDate,
      if (createdAt != $none) #createdAt: createdAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
    }),
  );
  @override
  ReturnEntity $make(CopyWithData data) => ReturnEntity(
    programId: data.get(#programId, or: $value.programId),
    name: data.get(#name, or: $value.name),
    numberHoles: data.get(#numberHoles, or: $value.numberHoles),
    winningNumbers: data.get(#winningNumbers, or: $value.winningNumbers),
    rewards: data.get(#rewards, or: $value.rewards),
    lastingNumber: data.get(#lastingNumber, or: $value.lastingNumber),
    lastingPeriod: data.get(#lastingPeriod, or: $value.lastingPeriod),
    startingDate: data.get(#startingDate, or: $value.startingDate),
    endDate: data.get(#endDate, or: $value.endDate),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
  );

  @override
  ReturnEntityCopyWith<$R2, ReturnEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ReturnEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

