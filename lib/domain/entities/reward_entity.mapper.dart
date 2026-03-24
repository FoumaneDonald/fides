// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'reward_entity.dart';

class RewardEntityMapper extends ClassMapperBase<RewardEntity> {
  RewardEntityMapper._();

  static RewardEntityMapper? _instance;
  static RewardEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RewardEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'RewardEntity';

  static String _$rewardId(RewardEntity v) => v.rewardId;
  static const Field<RewardEntity, String> _f$rewardId = Field(
    'rewardId',
    _$rewardId,
  );
  static RewardType _$type(RewardEntity v) => v.type;
  static const Field<RewardEntity, RewardType> _f$type = Field('type', _$type);
  static int _$unlockThreshold(RewardEntity v) => v.unlockThreshold;
  static const Field<RewardEntity, int> _f$unlockThreshold = Field(
    'unlockThreshold',
    _$unlockThreshold,
  );
  static int? _$discountValue(RewardEntity v) => v.discountValue;
  static const Field<RewardEntity, int> _f$discountValue = Field(
    'discountValue',
    _$discountValue,
    opt: true,
  );
  static DiscountType? _$discountType(RewardEntity v) => v.discountType;
  static const Field<RewardEntity, DiscountType> _f$discountType = Field(
    'discountType',
    _$discountType,
    opt: true,
  );
  static String _$item(RewardEntity v) => v.item;
  static const Field<RewardEntity, String> _f$item = Field('item', _$item);
  static String _$imagePath(RewardEntity v) => v.imagePath;
  static const Field<RewardEntity, String> _f$imagePath = Field(
    'imagePath',
    _$imagePath,
  );
  static String _$description(RewardEntity v) => v.description;
  static const Field<RewardEntity, String> _f$description = Field(
    'description',
    _$description,
  );
  static int? _$minimumPurchase(RewardEntity v) => v.minimumPurchase;
  static const Field<RewardEntity, int> _f$minimumPurchase = Field(
    'minimumPurchase',
    _$minimumPurchase,
    opt: true,
  );
  static List<Object?> _$props(RewardEntity v) => v.props;
  static const Field<RewardEntity, List<Object?>> _f$props = Field(
    'props',
    _$props,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<RewardEntity> fields = const {
    #rewardId: _f$rewardId,
    #type: _f$type,
    #unlockThreshold: _f$unlockThreshold,
    #discountValue: _f$discountValue,
    #discountType: _f$discountType,
    #item: _f$item,
    #imagePath: _f$imagePath,
    #description: _f$description,
    #minimumPurchase: _f$minimumPurchase,
    #props: _f$props,
  };

  static RewardEntity _instantiate(DecodingData data) {
    return RewardEntity(
      rewardId: data.dec(_f$rewardId),
      type: data.dec(_f$type),
      unlockThreshold: data.dec(_f$unlockThreshold),
      discountValue: data.dec(_f$discountValue),
      discountType: data.dec(_f$discountType),
      item: data.dec(_f$item),
      imagePath: data.dec(_f$imagePath),
      description: data.dec(_f$description),
      minimumPurchase: data.dec(_f$minimumPurchase),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static RewardEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RewardEntity>(map);
  }

  static RewardEntity fromJson(String json) {
    return ensureInitialized().decodeJson<RewardEntity>(json);
  }
}

mixin RewardEntityMappable {
  String toJson() {
    return RewardEntityMapper.ensureInitialized().encodeJson<RewardEntity>(
      this as RewardEntity,
    );
  }

  Map<String, dynamic> toMap() {
    return RewardEntityMapper.ensureInitialized().encodeMap<RewardEntity>(
      this as RewardEntity,
    );
  }

  RewardEntityCopyWith<RewardEntity, RewardEntity, RewardEntity> get copyWith =>
      _RewardEntityCopyWithImpl<RewardEntity, RewardEntity>(
        this as RewardEntity,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return RewardEntityMapper.ensureInitialized().stringifyValue(
      this as RewardEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return RewardEntityMapper.ensureInitialized().equalsValue(
      this as RewardEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return RewardEntityMapper.ensureInitialized().hashValue(
      this as RewardEntity,
    );
  }
}

extension RewardEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RewardEntity, $Out> {
  RewardEntityCopyWith<$R, RewardEntity, $Out> get $asRewardEntity =>
      $base.as((v, t, t2) => _RewardEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RewardEntityCopyWith<$R, $In extends RewardEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? rewardId,
    RewardType? type,
    int? unlockThreshold,
    int? discountValue,
    DiscountType? discountType,
    String? item,
    String? imagePath,
    String? description,
    int? minimumPurchase,
  });
  RewardEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RewardEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RewardEntity, $Out>
    implements RewardEntityCopyWith<$R, RewardEntity, $Out> {
  _RewardEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RewardEntity> $mapper =
      RewardEntityMapper.ensureInitialized();
  @override
  $R call({
    String? rewardId,
    RewardType? type,
    int? unlockThreshold,
    Object? discountValue = $none,
    Object? discountType = $none,
    String? item,
    String? imagePath,
    String? description,
    Object? minimumPurchase = $none,
  }) => $apply(
    FieldCopyWithData({
      if (rewardId != null) #rewardId: rewardId,
      if (type != null) #type: type,
      if (unlockThreshold != null) #unlockThreshold: unlockThreshold,
      if (discountValue != $none) #discountValue: discountValue,
      if (discountType != $none) #discountType: discountType,
      if (item != null) #item: item,
      if (imagePath != null) #imagePath: imagePath,
      if (description != null) #description: description,
      if (minimumPurchase != $none) #minimumPurchase: minimumPurchase,
    }),
  );
  @override
  RewardEntity $make(CopyWithData data) => RewardEntity(
    rewardId: data.get(#rewardId, or: $value.rewardId),
    type: data.get(#type, or: $value.type),
    unlockThreshold: data.get(#unlockThreshold, or: $value.unlockThreshold),
    discountValue: data.get(#discountValue, or: $value.discountValue),
    discountType: data.get(#discountType, or: $value.discountType),
    item: data.get(#item, or: $value.item),
    imagePath: data.get(#imagePath, or: $value.imagePath),
    description: data.get(#description, or: $value.description),
    minimumPurchase: data.get(#minimumPurchase, or: $value.minimumPurchase),
  );

  @override
  RewardEntityCopyWith<$R2, RewardEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _RewardEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

