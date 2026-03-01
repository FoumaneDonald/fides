// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'spend_entity.dart';

class SpendEntityMapper extends ClassMapperBase<SpendEntity> {
  SpendEntityMapper._();

  static SpendEntityMapper? _instance;
  static SpendEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SpendEntityMapper._());
      RewardEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SpendEntity';

  static String _$programId(SpendEntity v) => v.programId;
  static const Field<SpendEntity, String> _f$programId = Field(
    'programId',
    _$programId,
  );
  static String _$name(SpendEntity v) => v.name;
  static const Field<SpendEntity, String> _f$name = Field('name', _$name);
  static double? _$points(SpendEntity v) => v.points;
  static const Field<SpendEntity, double> _f$points = Field(
    'points',
    _$points,
    opt: true,
  );
  static double? _$minimumSpent(SpendEntity v) => v.minimumSpent;
  static const Field<SpendEntity, double> _f$minimumSpent = Field(
    'minimumSpent',
    _$minimumSpent,
    opt: true,
  );
  static String _$currencyCode(SpendEntity v) => v.currencyCode;
  static const Field<SpendEntity, String> _f$currencyCode = Field(
    'currencyCode',
    _$currencyCode,
  );
  static List<RewardEntity> _$rewards(SpendEntity v) => v.rewards;
  static const Field<SpendEntity, List<RewardEntity>> _f$rewards = Field(
    'rewards',
    _$rewards,
  );
  static int _$lastingNumber(SpendEntity v) => v.lastingNumber;
  static const Field<SpendEntity, int> _f$lastingNumber = Field(
    'lastingNumber',
    _$lastingNumber,
  );
  static TimeUnit _$lastingPeriod(SpendEntity v) => v.lastingPeriod;
  static const Field<SpendEntity, TimeUnit> _f$lastingPeriod = Field(
    'lastingPeriod',
    _$lastingPeriod,
  );
  static DateTime? _$startingDate(SpendEntity v) => v.startingDate;
  static const Field<SpendEntity, DateTime> _f$startingDate = Field(
    'startingDate',
    _$startingDate,
    opt: true,
  );
  static DateTime? _$endDate(SpendEntity v) => v.endDate;
  static const Field<SpendEntity, DateTime> _f$endDate = Field(
    'endDate',
    _$endDate,
    opt: true,
  );
  static DateTime? _$createdAt(SpendEntity v) => v.createdAt;
  static const Field<SpendEntity, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    opt: true,
  );
  static DateTime? _$updatedAt(SpendEntity v) => v.updatedAt;
  static const Field<SpendEntity, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    opt: true,
  );
  static List<Object?> _$props(SpendEntity v) => v.props;
  static const Field<SpendEntity, List<Object?>> _f$props = Field(
    'props',
    _$props,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<SpendEntity> fields = const {
    #programId: _f$programId,
    #name: _f$name,
    #points: _f$points,
    #minimumSpent: _f$minimumSpent,
    #currencyCode: _f$currencyCode,
    #rewards: _f$rewards,
    #lastingNumber: _f$lastingNumber,
    #lastingPeriod: _f$lastingPeriod,
    #startingDate: _f$startingDate,
    #endDate: _f$endDate,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #props: _f$props,
  };

  static SpendEntity _instantiate(DecodingData data) {
    return SpendEntity(
      programId: data.dec(_f$programId),
      name: data.dec(_f$name),
      points: data.dec(_f$points),
      minimumSpent: data.dec(_f$minimumSpent),
      currencyCode: data.dec(_f$currencyCode),
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

  static SpendEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SpendEntity>(map);
  }

  static SpendEntity fromJson(String json) {
    return ensureInitialized().decodeJson<SpendEntity>(json);
  }
}

mixin SpendEntityMappable {
  String toJson() {
    return SpendEntityMapper.ensureInitialized().encodeJson<SpendEntity>(
      this as SpendEntity,
    );
  }

  Map<String, dynamic> toMap() {
    return SpendEntityMapper.ensureInitialized().encodeMap<SpendEntity>(
      this as SpendEntity,
    );
  }

  SpendEntityCopyWith<SpendEntity, SpendEntity, SpendEntity> get copyWith =>
      _SpendEntityCopyWithImpl<SpendEntity, SpendEntity>(
        this as SpendEntity,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return SpendEntityMapper.ensureInitialized().stringifyValue(
      this as SpendEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return SpendEntityMapper.ensureInitialized().equalsValue(
      this as SpendEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return SpendEntityMapper.ensureInitialized().hashValue(this as SpendEntity);
  }
}

extension SpendEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SpendEntity, $Out> {
  SpendEntityCopyWith<$R, SpendEntity, $Out> get $asSpendEntity =>
      $base.as((v, t, t2) => _SpendEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SpendEntityCopyWith<$R, $In extends SpendEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    RewardEntity,
    RewardEntityCopyWith<$R, RewardEntity, RewardEntity>
  >
  get rewards;
  $R call({
    String? programId,
    String? name,
    double? points,
    double? minimumSpent,
    String? currencyCode,
    List<RewardEntity>? rewards,
    int? lastingNumber,
    TimeUnit? lastingPeriod,
    DateTime? startingDate,
    DateTime? endDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  SpendEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SpendEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SpendEntity, $Out>
    implements SpendEntityCopyWith<$R, SpendEntity, $Out> {
  _SpendEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SpendEntity> $mapper =
      SpendEntityMapper.ensureInitialized();
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
    Object? points = $none,
    Object? minimumSpent = $none,
    String? currencyCode,
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
      if (points != $none) #points: points,
      if (minimumSpent != $none) #minimumSpent: minimumSpent,
      if (currencyCode != null) #currencyCode: currencyCode,
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
  SpendEntity $make(CopyWithData data) => SpendEntity(
    programId: data.get(#programId, or: $value.programId),
    name: data.get(#name, or: $value.name),
    points: data.get(#points, or: $value.points),
    minimumSpent: data.get(#minimumSpent, or: $value.minimumSpent),
    currencyCode: data.get(#currencyCode, or: $value.currencyCode),
    rewards: data.get(#rewards, or: $value.rewards),
    lastingNumber: data.get(#lastingNumber, or: $value.lastingNumber),
    lastingPeriod: data.get(#lastingPeriod, or: $value.lastingPeriod),
    startingDate: data.get(#startingDate, or: $value.startingDate),
    endDate: data.get(#endDate, or: $value.endDate),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
  );

  @override
  SpendEntityCopyWith<$R2, SpendEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SpendEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

