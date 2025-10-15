// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'customer_bloc.dart';

class CustomerStateMapper extends ClassMapperBase<CustomerState> {
  CustomerStateMapper._();

  static CustomerStateMapper? _instance;
  static CustomerStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CustomerStateMapper._());
      CustomerEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CustomerState';

  static CustomerStatus? _$status(CustomerState v) => v.status;
  static const Field<CustomerState, CustomerStatus> _f$status = Field(
    'status',
    _$status,
    opt: true,
  );
  static ProgramStatus? _$programStatus(CustomerState v) => v.programStatus;
  static const Field<CustomerState, ProgramStatus> _f$programStatus = Field(
    'programStatus',
    _$programStatus,
    opt: true,
  );
  static String? _$message(CustomerState v) => v.message;
  static const Field<CustomerState, String> _f$message = Field(
    'message',
    _$message,
    opt: true,
  );
  static List<LoyaltyProgramEntity>? _$listOfPrograms(CustomerState v) =>
      v.listOfPrograms;
  static const Field<CustomerState, List<LoyaltyProgramEntity>>
  _f$listOfPrograms = Field('listOfPrograms', _$listOfPrograms, opt: true);
  static CustomerEntity? _$customerEntity(CustomerState v) => v.customerEntity;
  static const Field<CustomerState, CustomerEntity> _f$customerEntity = Field(
    'customerEntity',
    _$customerEntity,
    opt: true,
  );

  @override
  final MappableFields<CustomerState> fields = const {
    #status: _f$status,
    #programStatus: _f$programStatus,
    #message: _f$message,
    #listOfPrograms: _f$listOfPrograms,
    #customerEntity: _f$customerEntity,
  };

  static CustomerState _instantiate(DecodingData data) {
    return CustomerState(
      status: data.dec(_f$status),
      programStatus: data.dec(_f$programStatus),
      message: data.dec(_f$message),
      listOfPrograms: data.dec(_f$listOfPrograms),
      customerEntity: data.dec(_f$customerEntity),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CustomerState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CustomerState>(map);
  }

  static CustomerState fromJson(String json) {
    return ensureInitialized().decodeJson<CustomerState>(json);
  }
}

mixin CustomerStateMappable {
  String toJson() {
    return CustomerStateMapper.ensureInitialized().encodeJson<CustomerState>(
      this as CustomerState,
    );
  }

  Map<String, dynamic> toMap() {
    return CustomerStateMapper.ensureInitialized().encodeMap<CustomerState>(
      this as CustomerState,
    );
  }

  CustomerStateCopyWith<CustomerState, CustomerState, CustomerState>
  get copyWith => _CustomerStateCopyWithImpl<CustomerState, CustomerState>(
    this as CustomerState,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return CustomerStateMapper.ensureInitialized().stringifyValue(
      this as CustomerState,
    );
  }

  @override
  bool operator ==(Object other) {
    return CustomerStateMapper.ensureInitialized().equalsValue(
      this as CustomerState,
      other,
    );
  }

  @override
  int get hashCode {
    return CustomerStateMapper.ensureInitialized().hashValue(
      this as CustomerState,
    );
  }
}

extension CustomerStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CustomerState, $Out> {
  CustomerStateCopyWith<$R, CustomerState, $Out> get $asCustomerState =>
      $base.as((v, t, t2) => _CustomerStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CustomerStateCopyWith<$R, $In extends CustomerState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    LoyaltyProgramEntity,
    ObjectCopyWith<$R, LoyaltyProgramEntity, LoyaltyProgramEntity>
  >?
  get listOfPrograms;
  CustomerEntityCopyWith<$R, CustomerEntity, CustomerEntity>?
  get customerEntity;
  $R call({
    CustomerStatus? status,
    ProgramStatus? programStatus,
    String? message,
    List<LoyaltyProgramEntity>? listOfPrograms,
    CustomerEntity? customerEntity,
  });
  CustomerStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CustomerStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CustomerState, $Out>
    implements CustomerStateCopyWith<$R, CustomerState, $Out> {
  _CustomerStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CustomerState> $mapper =
      CustomerStateMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    LoyaltyProgramEntity,
    ObjectCopyWith<$R, LoyaltyProgramEntity, LoyaltyProgramEntity>
  >?
  get listOfPrograms => $value.listOfPrograms != null
      ? ListCopyWith(
          $value.listOfPrograms!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(listOfPrograms: v),
        )
      : null;
  @override
  CustomerEntityCopyWith<$R, CustomerEntity, CustomerEntity>?
  get customerEntity =>
      $value.customerEntity?.copyWith.$chain((v) => call(customerEntity: v));
  @override
  $R call({
    Object? status = $none,
    Object? programStatus = $none,
    Object? message = $none,
    Object? listOfPrograms = $none,
    Object? customerEntity = $none,
  }) => $apply(
    FieldCopyWithData({
      if (status != $none) #status: status,
      if (programStatus != $none) #programStatus: programStatus,
      if (message != $none) #message: message,
      if (listOfPrograms != $none) #listOfPrograms: listOfPrograms,
      if (customerEntity != $none) #customerEntity: customerEntity,
    }),
  );
  @override
  CustomerState $make(CopyWithData data) => CustomerState(
    status: data.get(#status, or: $value.status),
    programStatus: data.get(#programStatus, or: $value.programStatus),
    message: data.get(#message, or: $value.message),
    listOfPrograms: data.get(#listOfPrograms, or: $value.listOfPrograms),
    customerEntity: data.get(#customerEntity, or: $value.customerEntity),
  );

  @override
  CustomerStateCopyWith<$R2, CustomerState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CustomerStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

