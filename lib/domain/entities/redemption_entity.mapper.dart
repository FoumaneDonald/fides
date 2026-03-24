// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'redemption_entity.dart';

class RedemptionEntityMapper extends ClassMapperBase<RedemptionEntity> {
  RedemptionEntityMapper._();

  static RedemptionEntityMapper? _instance;
  static RedemptionEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RedemptionEntityMapper._());
      LoyaltyCardEntityMapper.ensureInitialized();
      RewardEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RedemptionEntity';

  static String _$redemptionId(RedemptionEntity v) => v.redemptionId;
  static const Field<RedemptionEntity, String> _f$redemptionId = Field(
    'redemptionId',
    _$redemptionId,
  );
  static DateTime _$date(RedemptionEntity v) => v.date;
  static const Field<RedemptionEntity, DateTime> _f$date = Field(
    'date',
    _$date,
  );
  static int _$pointsSpent(RedemptionEntity v) => v.pointsSpent;
  static const Field<RedemptionEntity, int> _f$pointsSpent = Field(
    'pointsSpent',
    _$pointsSpent,
  );
  static LoyaltyCardEntity _$card(RedemptionEntity v) => v.card;
  static const Field<RedemptionEntity, LoyaltyCardEntity> _f$card = Field(
    'card',
    _$card,
  );
  static RewardEntity _$reward(RedemptionEntity v) => v.reward;
  static const Field<RedemptionEntity, RewardEntity> _f$reward = Field(
    'reward',
    _$reward,
  );

  @override
  final MappableFields<RedemptionEntity> fields = const {
    #redemptionId: _f$redemptionId,
    #date: _f$date,
    #pointsSpent: _f$pointsSpent,
    #card: _f$card,
    #reward: _f$reward,
  };

  static RedemptionEntity _instantiate(DecodingData data) {
    return RedemptionEntity(
      redemptionId: data.dec(_f$redemptionId),
      date: data.dec(_f$date),
      pointsSpent: data.dec(_f$pointsSpent),
      card: data.dec(_f$card),
      reward: data.dec(_f$reward),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static RedemptionEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RedemptionEntity>(map);
  }

  static RedemptionEntity fromJson(String json) {
    return ensureInitialized().decodeJson<RedemptionEntity>(json);
  }
}

mixin RedemptionEntityMappable {
  String toJson() {
    return RedemptionEntityMapper.ensureInitialized()
        .encodeJson<RedemptionEntity>(this as RedemptionEntity);
  }

  Map<String, dynamic> toMap() {
    return RedemptionEntityMapper.ensureInitialized()
        .encodeMap<RedemptionEntity>(this as RedemptionEntity);
  }

  RedemptionEntityCopyWith<RedemptionEntity, RedemptionEntity, RedemptionEntity>
  get copyWith =>
      _RedemptionEntityCopyWithImpl<RedemptionEntity, RedemptionEntity>(
        this as RedemptionEntity,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return RedemptionEntityMapper.ensureInitialized().stringifyValue(
      this as RedemptionEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return RedemptionEntityMapper.ensureInitialized().equalsValue(
      this as RedemptionEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return RedemptionEntityMapper.ensureInitialized().hashValue(
      this as RedemptionEntity,
    );
  }
}

extension RedemptionEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RedemptionEntity, $Out> {
  RedemptionEntityCopyWith<$R, RedemptionEntity, $Out>
  get $asRedemptionEntity =>
      $base.as((v, t, t2) => _RedemptionEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RedemptionEntityCopyWith<$R, $In extends RedemptionEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  LoyaltyCardEntityCopyWith<$R, LoyaltyCardEntity, LoyaltyCardEntity> get card;
  RewardEntityCopyWith<$R, RewardEntity, RewardEntity> get reward;
  $R call({
    String? redemptionId,
    DateTime? date,
    int? pointsSpent,
    LoyaltyCardEntity? card,
    RewardEntity? reward,
  });
  RedemptionEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _RedemptionEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RedemptionEntity, $Out>
    implements RedemptionEntityCopyWith<$R, RedemptionEntity, $Out> {
  _RedemptionEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RedemptionEntity> $mapper =
      RedemptionEntityMapper.ensureInitialized();
  @override
  LoyaltyCardEntityCopyWith<$R, LoyaltyCardEntity, LoyaltyCardEntity>
  get card => $value.card.copyWith.$chain((v) => call(card: v));
  @override
  RewardEntityCopyWith<$R, RewardEntity, RewardEntity> get reward =>
      $value.reward.copyWith.$chain((v) => call(reward: v));
  @override
  $R call({
    String? redemptionId,
    DateTime? date,
    int? pointsSpent,
    LoyaltyCardEntity? card,
    RewardEntity? reward,
  }) => $apply(
    FieldCopyWithData({
      if (redemptionId != null) #redemptionId: redemptionId,
      if (date != null) #date: date,
      if (pointsSpent != null) #pointsSpent: pointsSpent,
      if (card != null) #card: card,
      if (reward != null) #reward: reward,
    }),
  );
  @override
  RedemptionEntity $make(CopyWithData data) => RedemptionEntity(
    redemptionId: data.get(#redemptionId, or: $value.redemptionId),
    date: data.get(#date, or: $value.date),
    pointsSpent: data.get(#pointsSpent, or: $value.pointsSpent),
    card: data.get(#card, or: $value.card),
    reward: data.get(#reward, or: $value.reward),
  );

  @override
  RedemptionEntityCopyWith<$R2, RedemptionEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _RedemptionEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

