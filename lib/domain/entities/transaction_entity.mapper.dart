// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'transaction_entity.dart';

class TransactionEntityMapper extends ClassMapperBase<TransactionEntity> {
  TransactionEntityMapper._();

  static TransactionEntityMapper? _instance;
  static TransactionEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TransactionEntityMapper._());
      LoyaltyCardEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TransactionEntity';

  static String _$transactionId(TransactionEntity v) => v.transactionId;
  static const Field<TransactionEntity, String> _f$transactionId = Field(
    'transactionId',
    _$transactionId,
  );
  static double _$amount(TransactionEntity v) => v.amount;
  static const Field<TransactionEntity, double> _f$amount = Field(
    'amount',
    _$amount,
  );
  static DateTime _$date(TransactionEntity v) => v.date;
  static const Field<TransactionEntity, DateTime> _f$date = Field(
    'date',
    _$date,
  );
  static LoyaltyCardEntity _$card(TransactionEntity v) => v.card;
  static const Field<TransactionEntity, LoyaltyCardEntity> _f$card = Field(
    'card',
    _$card,
  );

  @override
  final MappableFields<TransactionEntity> fields = const {
    #transactionId: _f$transactionId,
    #amount: _f$amount,
    #date: _f$date,
    #card: _f$card,
  };

  static TransactionEntity _instantiate(DecodingData data) {
    return TransactionEntity(
      transactionId: data.dec(_f$transactionId),
      amount: data.dec(_f$amount),
      date: data.dec(_f$date),
      card: data.dec(_f$card),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TransactionEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TransactionEntity>(map);
  }

  static TransactionEntity fromJson(String json) {
    return ensureInitialized().decodeJson<TransactionEntity>(json);
  }
}

mixin TransactionEntityMappable {
  String toJson() {
    return TransactionEntityMapper.ensureInitialized()
        .encodeJson<TransactionEntity>(this as TransactionEntity);
  }

  Map<String, dynamic> toMap() {
    return TransactionEntityMapper.ensureInitialized()
        .encodeMap<TransactionEntity>(this as TransactionEntity);
  }

  TransactionEntityCopyWith<
    TransactionEntity,
    TransactionEntity,
    TransactionEntity
  >
  get copyWith =>
      _TransactionEntityCopyWithImpl<TransactionEntity, TransactionEntity>(
        this as TransactionEntity,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return TransactionEntityMapper.ensureInitialized().stringifyValue(
      this as TransactionEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return TransactionEntityMapper.ensureInitialized().equalsValue(
      this as TransactionEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return TransactionEntityMapper.ensureInitialized().hashValue(
      this as TransactionEntity,
    );
  }
}

extension TransactionEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TransactionEntity, $Out> {
  TransactionEntityCopyWith<$R, TransactionEntity, $Out>
  get $asTransactionEntity => $base.as(
    (v, t, t2) => _TransactionEntityCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class TransactionEntityCopyWith<
  $R,
  $In extends TransactionEntity,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  LoyaltyCardEntityCopyWith<$R, LoyaltyCardEntity, LoyaltyCardEntity> get card;
  $R call({
    String? transactionId,
    double? amount,
    DateTime? date,
    LoyaltyCardEntity? card,
  });
  TransactionEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _TransactionEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TransactionEntity, $Out>
    implements TransactionEntityCopyWith<$R, TransactionEntity, $Out> {
  _TransactionEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TransactionEntity> $mapper =
      TransactionEntityMapper.ensureInitialized();
  @override
  LoyaltyCardEntityCopyWith<$R, LoyaltyCardEntity, LoyaltyCardEntity>
  get card => $value.card.copyWith.$chain((v) => call(card: v));
  @override
  $R call({
    String? transactionId,
    double? amount,
    DateTime? date,
    LoyaltyCardEntity? card,
  }) => $apply(
    FieldCopyWithData({
      if (transactionId != null) #transactionId: transactionId,
      if (amount != null) #amount: amount,
      if (date != null) #date: date,
      if (card != null) #card: card,
    }),
  );
  @override
  TransactionEntity $make(CopyWithData data) => TransactionEntity(
    transactionId: data.get(#transactionId, or: $value.transactionId),
    amount: data.get(#amount, or: $value.amount),
    date: data.get(#date, or: $value.date),
    card: data.get(#card, or: $value.card),
  );

  @override
  TransactionEntityCopyWith<$R2, TransactionEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _TransactionEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

