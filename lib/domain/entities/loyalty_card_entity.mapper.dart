// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'loyalty_card_entity.dart';

class LoyaltyCardEntityMapper extends ClassMapperBase<LoyaltyCardEntity> {
  LoyaltyCardEntityMapper._();

  static LoyaltyCardEntityMapper? _instance;
  static LoyaltyCardEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoyaltyCardEntityMapper._());
      CustomerEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LoyaltyCardEntity';

  static String _$cardId(LoyaltyCardEntity v) => v.cardId;
  static const Field<LoyaltyCardEntity, String> _f$cardId = Field(
    'cardId',
    _$cardId,
  );
  static int _$balance(LoyaltyCardEntity v) => v.balance;
  static const Field<LoyaltyCardEntity, int> _f$balance = Field(
    'balance',
    _$balance,
  );
  static CustomerEntity? _$customer(LoyaltyCardEntity v) => v.customer;
  static const Field<LoyaltyCardEntity, CustomerEntity> _f$customer = Field(
    'customer',
    _$customer,
    opt: true,
  );
  static LoyaltyProgramEntity<dynamic>? _$program(LoyaltyCardEntity v) =>
      v.program;
  static const Field<LoyaltyCardEntity, LoyaltyProgramEntity<dynamic>>
  _f$program = Field('program', _$program, opt: true);
  static DateTime _$startDate(LoyaltyCardEntity v) => v.startDate;
  static const Field<LoyaltyCardEntity, DateTime> _f$startDate = Field(
    'startDate',
    _$startDate,
  );
  static DateTime _$endDate(LoyaltyCardEntity v) => v.endDate;
  static const Field<LoyaltyCardEntity, DateTime> _f$endDate = Field(
    'endDate',
    _$endDate,
  );

  @override
  final MappableFields<LoyaltyCardEntity> fields = const {
    #cardId: _f$cardId,
    #balance: _f$balance,
    #customer: _f$customer,
    #program: _f$program,
    #startDate: _f$startDate,
    #endDate: _f$endDate,
  };

  static LoyaltyCardEntity _instantiate(DecodingData data) {
    return LoyaltyCardEntity(
      cardId: data.dec(_f$cardId),
      balance: data.dec(_f$balance),
      customer: data.dec(_f$customer),
      program: data.dec(_f$program),
      startDate: data.dec(_f$startDate),
      endDate: data.dec(_f$endDate),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static LoyaltyCardEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LoyaltyCardEntity>(map);
  }

  static LoyaltyCardEntity fromJson(String json) {
    return ensureInitialized().decodeJson<LoyaltyCardEntity>(json);
  }
}

mixin LoyaltyCardEntityMappable {
  String toJson() {
    return LoyaltyCardEntityMapper.ensureInitialized()
        .encodeJson<LoyaltyCardEntity>(this as LoyaltyCardEntity);
  }

  Map<String, dynamic> toMap() {
    return LoyaltyCardEntityMapper.ensureInitialized()
        .encodeMap<LoyaltyCardEntity>(this as LoyaltyCardEntity);
  }

  LoyaltyCardEntityCopyWith<
    LoyaltyCardEntity,
    LoyaltyCardEntity,
    LoyaltyCardEntity
  >
  get copyWith =>
      _LoyaltyCardEntityCopyWithImpl<LoyaltyCardEntity, LoyaltyCardEntity>(
        this as LoyaltyCardEntity,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return LoyaltyCardEntityMapper.ensureInitialized().stringifyValue(
      this as LoyaltyCardEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return LoyaltyCardEntityMapper.ensureInitialized().equalsValue(
      this as LoyaltyCardEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return LoyaltyCardEntityMapper.ensureInitialized().hashValue(
      this as LoyaltyCardEntity,
    );
  }
}

extension LoyaltyCardEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LoyaltyCardEntity, $Out> {
  LoyaltyCardEntityCopyWith<$R, LoyaltyCardEntity, $Out>
  get $asLoyaltyCardEntity => $base.as(
    (v, t, t2) => _LoyaltyCardEntityCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class LoyaltyCardEntityCopyWith<
  $R,
  $In extends LoyaltyCardEntity,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  CustomerEntityCopyWith<$R, CustomerEntity, CustomerEntity>? get customer;
  $R call({
    String? cardId,
    int? balance,
    CustomerEntity? customer,
    LoyaltyProgramEntity<dynamic>? program,
    DateTime? startDate,
    DateTime? endDate,
  });
  LoyaltyCardEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _LoyaltyCardEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LoyaltyCardEntity, $Out>
    implements LoyaltyCardEntityCopyWith<$R, LoyaltyCardEntity, $Out> {
  _LoyaltyCardEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LoyaltyCardEntity> $mapper =
      LoyaltyCardEntityMapper.ensureInitialized();
  @override
  CustomerEntityCopyWith<$R, CustomerEntity, CustomerEntity>? get customer =>
      $value.customer?.copyWith.$chain((v) => call(customer: v));
  @override
  $R call({
    String? cardId,
    int? balance,
    Object? customer = $none,
    Object? program = $none,
    DateTime? startDate,
    DateTime? endDate,
  }) => $apply(
    FieldCopyWithData({
      if (cardId != null) #cardId: cardId,
      if (balance != null) #balance: balance,
      if (customer != $none) #customer: customer,
      if (program != $none) #program: program,
      if (startDate != null) #startDate: startDate,
      if (endDate != null) #endDate: endDate,
    }),
  );
  @override
  LoyaltyCardEntity $make(CopyWithData data) => LoyaltyCardEntity(
    cardId: data.get(#cardId, or: $value.cardId),
    balance: data.get(#balance, or: $value.balance),
    customer: data.get(#customer, or: $value.customer),
    program: data.get(#program, or: $value.program),
    startDate: data.get(#startDate, or: $value.startDate),
    endDate: data.get(#endDate, or: $value.endDate),
  );

  @override
  LoyaltyCardEntityCopyWith<$R2, LoyaltyCardEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _LoyaltyCardEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

