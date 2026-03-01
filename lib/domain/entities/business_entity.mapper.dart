// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'business_entity.dart';

class BusinessEntityMapper extends ClassMapperBase<BusinessEntity> {
  BusinessEntityMapper._();

  static BusinessEntityMapper? _instance;
  static BusinessEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BusinessEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'BusinessEntity';

  static String _$businessId(BusinessEntity v) => v.businessId;
  static const Field<BusinessEntity, String> _f$businessId = Field(
    'businessId',
    _$businessId,
  );
  static String _$name(BusinessEntity v) => v.name;
  static const Field<BusinessEntity, String> _f$name = Field('name', _$name);
  static String _$email(BusinessEntity v) => v.email;
  static const Field<BusinessEntity, String> _f$email = Field('email', _$email);
  static int _$phoneNumber(BusinessEntity v) => v.phoneNumber;
  static const Field<BusinessEntity, int> _f$phoneNumber = Field(
    'phoneNumber',
    _$phoneNumber,
  );

  @override
  final MappableFields<BusinessEntity> fields = const {
    #businessId: _f$businessId,
    #name: _f$name,
    #email: _f$email,
    #phoneNumber: _f$phoneNumber,
  };

  static BusinessEntity _instantiate(DecodingData data) {
    return BusinessEntity(
      businessId: data.dec(_f$businessId),
      name: data.dec(_f$name),
      email: data.dec(_f$email),
      phoneNumber: data.dec(_f$phoneNumber),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static BusinessEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BusinessEntity>(map);
  }

  static BusinessEntity fromJson(String json) {
    return ensureInitialized().decodeJson<BusinessEntity>(json);
  }
}

mixin BusinessEntityMappable {
  String toJson() {
    return BusinessEntityMapper.ensureInitialized().encodeJson<BusinessEntity>(
      this as BusinessEntity,
    );
  }

  Map<String, dynamic> toMap() {
    return BusinessEntityMapper.ensureInitialized().encodeMap<BusinessEntity>(
      this as BusinessEntity,
    );
  }

  BusinessEntityCopyWith<BusinessEntity, BusinessEntity, BusinessEntity>
  get copyWith => _BusinessEntityCopyWithImpl<BusinessEntity, BusinessEntity>(
    this as BusinessEntity,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return BusinessEntityMapper.ensureInitialized().stringifyValue(
      this as BusinessEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return BusinessEntityMapper.ensureInitialized().equalsValue(
      this as BusinessEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return BusinessEntityMapper.ensureInitialized().hashValue(
      this as BusinessEntity,
    );
  }
}

extension BusinessEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BusinessEntity, $Out> {
  BusinessEntityCopyWith<$R, BusinessEntity, $Out> get $asBusinessEntity =>
      $base.as((v, t, t2) => _BusinessEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class BusinessEntityCopyWith<$R, $In extends BusinessEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? businessId, String? name, String? email, int? phoneNumber});
  BusinessEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _BusinessEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BusinessEntity, $Out>
    implements BusinessEntityCopyWith<$R, BusinessEntity, $Out> {
  _BusinessEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BusinessEntity> $mapper =
      BusinessEntityMapper.ensureInitialized();
  @override
  $R call({
    String? businessId,
    String? name,
    String? email,
    int? phoneNumber,
  }) => $apply(
    FieldCopyWithData({
      if (businessId != null) #businessId: businessId,
      if (name != null) #name: name,
      if (email != null) #email: email,
      if (phoneNumber != null) #phoneNumber: phoneNumber,
    }),
  );
  @override
  BusinessEntity $make(CopyWithData data) => BusinessEntity(
    businessId: data.get(#businessId, or: $value.businessId),
    name: data.get(#name, or: $value.name),
    email: data.get(#email, or: $value.email),
    phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber),
  );

  @override
  BusinessEntityCopyWith<$R2, BusinessEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _BusinessEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

