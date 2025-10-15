// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'customer_entity.dart';

class CustomerEntityMapper extends ClassMapperBase<CustomerEntity> {
  CustomerEntityMapper._();

  static CustomerEntityMapper? _instance;
  static CustomerEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CustomerEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CustomerEntity';

  static int? _$id(CustomerEntity v) => v.id;
  static const Field<CustomerEntity, int> _f$id = Field('id', _$id, opt: true);
  static String _$name(CustomerEntity v) => v.name;
  static const Field<CustomerEntity, String> _f$name = Field('name', _$name);
  static String? _$phone(CustomerEntity v) => v.phone;
  static const Field<CustomerEntity, String> _f$phone = Field(
    'phone',
    _$phone,
    opt: true,
  );
  static String? _$email(CustomerEntity v) => v.email;
  static const Field<CustomerEntity, String> _f$email = Field(
    'email',
    _$email,
    opt: true,
  );
  static List<LoyaltyProgramEntity> _$loyaltyPrograms(CustomerEntity v) =>
      v.loyaltyPrograms;
  static const Field<CustomerEntity, List<LoyaltyProgramEntity>>
  _f$loyaltyPrograms = Field('loyaltyPrograms', _$loyaltyPrograms);

  @override
  final MappableFields<CustomerEntity> fields = const {
    #id: _f$id,
    #name: _f$name,
    #phone: _f$phone,
    #email: _f$email,
    #loyaltyPrograms: _f$loyaltyPrograms,
  };

  static CustomerEntity _instantiate(DecodingData data) {
    return CustomerEntity(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      phone: data.dec(_f$phone),
      email: data.dec(_f$email),
      loyaltyPrograms: data.dec(_f$loyaltyPrograms),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CustomerEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CustomerEntity>(map);
  }

  static CustomerEntity fromJson(String json) {
    return ensureInitialized().decodeJson<CustomerEntity>(json);
  }
}

mixin CustomerEntityMappable {
  String toJson() {
    return CustomerEntityMapper.ensureInitialized().encodeJson<CustomerEntity>(
      this as CustomerEntity,
    );
  }

  Map<String, dynamic> toMap() {
    return CustomerEntityMapper.ensureInitialized().encodeMap<CustomerEntity>(
      this as CustomerEntity,
    );
  }

  CustomerEntityCopyWith<CustomerEntity, CustomerEntity, CustomerEntity>
  get copyWith => _CustomerEntityCopyWithImpl<CustomerEntity, CustomerEntity>(
    this as CustomerEntity,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return CustomerEntityMapper.ensureInitialized().stringifyValue(
      this as CustomerEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return CustomerEntityMapper.ensureInitialized().equalsValue(
      this as CustomerEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return CustomerEntityMapper.ensureInitialized().hashValue(
      this as CustomerEntity,
    );
  }
}

extension CustomerEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CustomerEntity, $Out> {
  CustomerEntityCopyWith<$R, CustomerEntity, $Out> get $asCustomerEntity =>
      $base.as((v, t, t2) => _CustomerEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CustomerEntityCopyWith<$R, $In extends CustomerEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    LoyaltyProgramEntity,
    ObjectCopyWith<$R, LoyaltyProgramEntity, LoyaltyProgramEntity>
  >
  get loyaltyPrograms;
  $R call({
    int? id,
    String? name,
    String? phone,
    String? email,
    List<LoyaltyProgramEntity>? loyaltyPrograms,
  });
  CustomerEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _CustomerEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CustomerEntity, $Out>
    implements CustomerEntityCopyWith<$R, CustomerEntity, $Out> {
  _CustomerEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CustomerEntity> $mapper =
      CustomerEntityMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    LoyaltyProgramEntity,
    ObjectCopyWith<$R, LoyaltyProgramEntity, LoyaltyProgramEntity>
  >
  get loyaltyPrograms => ListCopyWith(
    $value.loyaltyPrograms,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(loyaltyPrograms: v),
  );
  @override
  $R call({
    Object? id = $none,
    String? name,
    Object? phone = $none,
    Object? email = $none,
    List<LoyaltyProgramEntity>? loyaltyPrograms,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (name != null) #name: name,
      if (phone != $none) #phone: phone,
      if (email != $none) #email: email,
      if (loyaltyPrograms != null) #loyaltyPrograms: loyaltyPrograms,
    }),
  );
  @override
  CustomerEntity $make(CopyWithData data) => CustomerEntity(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    phone: data.get(#phone, or: $value.phone),
    email: data.get(#email, or: $value.email),
    loyaltyPrograms: data.get(#loyaltyPrograms, or: $value.loyaltyPrograms),
  );

  @override
  CustomerEntityCopyWith<$R2, CustomerEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CustomerEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

