// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'loyalty_program_bloc.dart';

class LoyaltyProgramStateMapper extends ClassMapperBase<LoyaltyProgramState> {
  LoyaltyProgramStateMapper._();

  static LoyaltyProgramStateMapper? _instance;
  static LoyaltyProgramStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoyaltyProgramStateMapper._());
      LoyaltyProgramInitialMapper.ensureInitialized();
      LoyaltyProgramLoadingMapper.ensureInitialized();
      LoyaltyProgramLoadedMapper.ensureInitialized();
      LoyaltyProgramEditingMapper.ensureInitialized();
      RewardAddedMapper.ensureInitialized();
      LoyaltyProgramErrorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LoyaltyProgramState';

  @override
  final MappableFields<LoyaltyProgramState> fields = const {};

  static LoyaltyProgramState _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('LoyaltyProgramState');
  }

  @override
  final Function instantiate = _instantiate;

  static LoyaltyProgramState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LoyaltyProgramState>(map);
  }

  static LoyaltyProgramState fromJson(String json) {
    return ensureInitialized().decodeJson<LoyaltyProgramState>(json);
  }
}

mixin LoyaltyProgramStateMappable {
  String toJson();
  Map<String, dynamic> toMap();
  LoyaltyProgramStateCopyWith<
    LoyaltyProgramState,
    LoyaltyProgramState,
    LoyaltyProgramState
  >
  get copyWith;
}

abstract class LoyaltyProgramStateCopyWith<
  $R,
  $In extends LoyaltyProgramState,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  LoyaltyProgramStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class LoyaltyProgramInitialMapper
    extends ClassMapperBase<LoyaltyProgramInitial> {
  LoyaltyProgramInitialMapper._();

  static LoyaltyProgramInitialMapper? _instance;
  static LoyaltyProgramInitialMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoyaltyProgramInitialMapper._());
      LoyaltyProgramStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LoyaltyProgramInitial';

  @override
  final MappableFields<LoyaltyProgramInitial> fields = const {};

  static LoyaltyProgramInitial _instantiate(DecodingData data) {
    return LoyaltyProgramInitial();
  }

  @override
  final Function instantiate = _instantiate;

  static LoyaltyProgramInitial fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LoyaltyProgramInitial>(map);
  }

  static LoyaltyProgramInitial fromJson(String json) {
    return ensureInitialized().decodeJson<LoyaltyProgramInitial>(json);
  }
}

mixin LoyaltyProgramInitialMappable {
  String toJson() {
    return LoyaltyProgramInitialMapper.ensureInitialized()
        .encodeJson<LoyaltyProgramInitial>(this as LoyaltyProgramInitial);
  }

  Map<String, dynamic> toMap() {
    return LoyaltyProgramInitialMapper.ensureInitialized()
        .encodeMap<LoyaltyProgramInitial>(this as LoyaltyProgramInitial);
  }

  LoyaltyProgramInitialCopyWith<
    LoyaltyProgramInitial,
    LoyaltyProgramInitial,
    LoyaltyProgramInitial
  >
  get copyWith =>
      _LoyaltyProgramInitialCopyWithImpl<
        LoyaltyProgramInitial,
        LoyaltyProgramInitial
      >(this as LoyaltyProgramInitial, $identity, $identity);
  @override
  String toString() {
    return LoyaltyProgramInitialMapper.ensureInitialized().stringifyValue(
      this as LoyaltyProgramInitial,
    );
  }

  @override
  bool operator ==(Object other) {
    return LoyaltyProgramInitialMapper.ensureInitialized().equalsValue(
      this as LoyaltyProgramInitial,
      other,
    );
  }

  @override
  int get hashCode {
    return LoyaltyProgramInitialMapper.ensureInitialized().hashValue(
      this as LoyaltyProgramInitial,
    );
  }
}

extension LoyaltyProgramInitialValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LoyaltyProgramInitial, $Out> {
  LoyaltyProgramInitialCopyWith<$R, LoyaltyProgramInitial, $Out>
  get $asLoyaltyProgramInitial => $base.as(
    (v, t, t2) => _LoyaltyProgramInitialCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class LoyaltyProgramInitialCopyWith<
  $R,
  $In extends LoyaltyProgramInitial,
  $Out
>
    implements LoyaltyProgramStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  LoyaltyProgramInitialCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _LoyaltyProgramInitialCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LoyaltyProgramInitial, $Out>
    implements LoyaltyProgramInitialCopyWith<$R, LoyaltyProgramInitial, $Out> {
  _LoyaltyProgramInitialCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LoyaltyProgramInitial> $mapper =
      LoyaltyProgramInitialMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  LoyaltyProgramInitial $make(CopyWithData data) => LoyaltyProgramInitial();

  @override
  LoyaltyProgramInitialCopyWith<$R2, LoyaltyProgramInitial, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _LoyaltyProgramInitialCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class LoyaltyProgramLoadingMapper
    extends ClassMapperBase<LoyaltyProgramLoading> {
  LoyaltyProgramLoadingMapper._();

  static LoyaltyProgramLoadingMapper? _instance;
  static LoyaltyProgramLoadingMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoyaltyProgramLoadingMapper._());
      LoyaltyProgramStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LoyaltyProgramLoading';

  @override
  final MappableFields<LoyaltyProgramLoading> fields = const {};

  static LoyaltyProgramLoading _instantiate(DecodingData data) {
    return LoyaltyProgramLoading();
  }

  @override
  final Function instantiate = _instantiate;

  static LoyaltyProgramLoading fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LoyaltyProgramLoading>(map);
  }

  static LoyaltyProgramLoading fromJson(String json) {
    return ensureInitialized().decodeJson<LoyaltyProgramLoading>(json);
  }
}

mixin LoyaltyProgramLoadingMappable {
  String toJson() {
    return LoyaltyProgramLoadingMapper.ensureInitialized()
        .encodeJson<LoyaltyProgramLoading>(this as LoyaltyProgramLoading);
  }

  Map<String, dynamic> toMap() {
    return LoyaltyProgramLoadingMapper.ensureInitialized()
        .encodeMap<LoyaltyProgramLoading>(this as LoyaltyProgramLoading);
  }

  LoyaltyProgramLoadingCopyWith<
    LoyaltyProgramLoading,
    LoyaltyProgramLoading,
    LoyaltyProgramLoading
  >
  get copyWith =>
      _LoyaltyProgramLoadingCopyWithImpl<
        LoyaltyProgramLoading,
        LoyaltyProgramLoading
      >(this as LoyaltyProgramLoading, $identity, $identity);
  @override
  String toString() {
    return LoyaltyProgramLoadingMapper.ensureInitialized().stringifyValue(
      this as LoyaltyProgramLoading,
    );
  }

  @override
  bool operator ==(Object other) {
    return LoyaltyProgramLoadingMapper.ensureInitialized().equalsValue(
      this as LoyaltyProgramLoading,
      other,
    );
  }

  @override
  int get hashCode {
    return LoyaltyProgramLoadingMapper.ensureInitialized().hashValue(
      this as LoyaltyProgramLoading,
    );
  }
}

extension LoyaltyProgramLoadingValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LoyaltyProgramLoading, $Out> {
  LoyaltyProgramLoadingCopyWith<$R, LoyaltyProgramLoading, $Out>
  get $asLoyaltyProgramLoading => $base.as(
    (v, t, t2) => _LoyaltyProgramLoadingCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class LoyaltyProgramLoadingCopyWith<
  $R,
  $In extends LoyaltyProgramLoading,
  $Out
>
    implements LoyaltyProgramStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  LoyaltyProgramLoadingCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _LoyaltyProgramLoadingCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LoyaltyProgramLoading, $Out>
    implements LoyaltyProgramLoadingCopyWith<$R, LoyaltyProgramLoading, $Out> {
  _LoyaltyProgramLoadingCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LoyaltyProgramLoading> $mapper =
      LoyaltyProgramLoadingMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  LoyaltyProgramLoading $make(CopyWithData data) => LoyaltyProgramLoading();

  @override
  LoyaltyProgramLoadingCopyWith<$R2, LoyaltyProgramLoading, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _LoyaltyProgramLoadingCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class LoyaltyProgramLoadedMapper extends ClassMapperBase<LoyaltyProgramLoaded> {
  LoyaltyProgramLoadedMapper._();

  static LoyaltyProgramLoadedMapper? _instance;
  static LoyaltyProgramLoadedMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoyaltyProgramLoadedMapper._());
      LoyaltyProgramStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LoyaltyProgramLoaded';

  static Map<ProgramType, List<LoyaltyProgramEntity>> _$listOfPrograms(
    LoyaltyProgramLoaded v,
  ) => v.listOfPrograms;
  static const Field<
    LoyaltyProgramLoaded,
    Map<ProgramType, List<LoyaltyProgramEntity>>
  >
  _f$listOfPrograms = Field('listOfPrograms', _$listOfPrograms);
  static List<LoyaltyProgramEntity> _$selectedPrograms(
    LoyaltyProgramLoaded v,
  ) => v.selectedPrograms;
  static const Field<LoyaltyProgramLoaded, List<LoyaltyProgramEntity>>
  _f$selectedPrograms = Field('selectedPrograms', _$selectedPrograms);
  static ProgramType? _$selectedFilterProgram(LoyaltyProgramLoaded v) =>
      v.selectedFilterProgram;
  static const Field<LoyaltyProgramLoaded, ProgramType>
  _f$selectedFilterProgram = Field(
    'selectedFilterProgram',
    _$selectedFilterProgram,
    opt: true,
  );
  static bool _$allFilter(LoyaltyProgramLoaded v) => v.allFilter;
  static const Field<LoyaltyProgramLoaded, bool> _f$allFilter = Field(
    'allFilter',
    _$allFilter,
    opt: true,
    def: true,
  );

  @override
  final MappableFields<LoyaltyProgramLoaded> fields = const {
    #listOfPrograms: _f$listOfPrograms,
    #selectedPrograms: _f$selectedPrograms,
    #selectedFilterProgram: _f$selectedFilterProgram,
    #allFilter: _f$allFilter,
  };

  static LoyaltyProgramLoaded _instantiate(DecodingData data) {
    return LoyaltyProgramLoaded(
      listOfPrograms: data.dec(_f$listOfPrograms),
      selectedPrograms: data.dec(_f$selectedPrograms),
      selectedFilterProgram: data.dec(_f$selectedFilterProgram),
      allFilter: data.dec(_f$allFilter),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static LoyaltyProgramLoaded fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LoyaltyProgramLoaded>(map);
  }

  static LoyaltyProgramLoaded fromJson(String json) {
    return ensureInitialized().decodeJson<LoyaltyProgramLoaded>(json);
  }
}

mixin LoyaltyProgramLoadedMappable {
  String toJson() {
    return LoyaltyProgramLoadedMapper.ensureInitialized()
        .encodeJson<LoyaltyProgramLoaded>(this as LoyaltyProgramLoaded);
  }

  Map<String, dynamic> toMap() {
    return LoyaltyProgramLoadedMapper.ensureInitialized()
        .encodeMap<LoyaltyProgramLoaded>(this as LoyaltyProgramLoaded);
  }

  LoyaltyProgramLoadedCopyWith<
    LoyaltyProgramLoaded,
    LoyaltyProgramLoaded,
    LoyaltyProgramLoaded
  >
  get copyWith =>
      _LoyaltyProgramLoadedCopyWithImpl<
        LoyaltyProgramLoaded,
        LoyaltyProgramLoaded
      >(this as LoyaltyProgramLoaded, $identity, $identity);
  @override
  String toString() {
    return LoyaltyProgramLoadedMapper.ensureInitialized().stringifyValue(
      this as LoyaltyProgramLoaded,
    );
  }

  @override
  bool operator ==(Object other) {
    return LoyaltyProgramLoadedMapper.ensureInitialized().equalsValue(
      this as LoyaltyProgramLoaded,
      other,
    );
  }

  @override
  int get hashCode {
    return LoyaltyProgramLoadedMapper.ensureInitialized().hashValue(
      this as LoyaltyProgramLoaded,
    );
  }
}

extension LoyaltyProgramLoadedValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LoyaltyProgramLoaded, $Out> {
  LoyaltyProgramLoadedCopyWith<$R, LoyaltyProgramLoaded, $Out>
  get $asLoyaltyProgramLoaded => $base.as(
    (v, t, t2) => _LoyaltyProgramLoadedCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class LoyaltyProgramLoadedCopyWith<
  $R,
  $In extends LoyaltyProgramLoaded,
  $Out
>
    implements LoyaltyProgramStateCopyWith<$R, $In, $Out> {
  MapCopyWith<
    $R,
    ProgramType,
    List<LoyaltyProgramEntity>,
    ObjectCopyWith<$R, List<LoyaltyProgramEntity>, List<LoyaltyProgramEntity>>
  >
  get listOfPrograms;
  ListCopyWith<
    $R,
    LoyaltyProgramEntity,
    ObjectCopyWith<$R, LoyaltyProgramEntity, LoyaltyProgramEntity>
  >
  get selectedPrograms;
  @override
  $R call({
    Map<ProgramType, List<LoyaltyProgramEntity>>? listOfPrograms,
    List<LoyaltyProgramEntity>? selectedPrograms,
    ProgramType? selectedFilterProgram,
    bool? allFilter,
  });
  LoyaltyProgramLoadedCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _LoyaltyProgramLoadedCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LoyaltyProgramLoaded, $Out>
    implements LoyaltyProgramLoadedCopyWith<$R, LoyaltyProgramLoaded, $Out> {
  _LoyaltyProgramLoadedCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LoyaltyProgramLoaded> $mapper =
      LoyaltyProgramLoadedMapper.ensureInitialized();
  @override
  MapCopyWith<
    $R,
    ProgramType,
    List<LoyaltyProgramEntity>,
    ObjectCopyWith<$R, List<LoyaltyProgramEntity>, List<LoyaltyProgramEntity>>
  >
  get listOfPrograms => MapCopyWith(
    $value.listOfPrograms,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(listOfPrograms: v),
  );
  @override
  ListCopyWith<
    $R,
    LoyaltyProgramEntity,
    ObjectCopyWith<$R, LoyaltyProgramEntity, LoyaltyProgramEntity>
  >
  get selectedPrograms => ListCopyWith(
    $value.selectedPrograms,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(selectedPrograms: v),
  );
  @override
  $R call({
    Map<ProgramType, List<LoyaltyProgramEntity>>? listOfPrograms,
    List<LoyaltyProgramEntity>? selectedPrograms,
    Object? selectedFilterProgram = $none,
    bool? allFilter,
  }) => $apply(
    FieldCopyWithData({
      if (listOfPrograms != null) #listOfPrograms: listOfPrograms,
      if (selectedPrograms != null) #selectedPrograms: selectedPrograms,
      if (selectedFilterProgram != $none)
        #selectedFilterProgram: selectedFilterProgram,
      if (allFilter != null) #allFilter: allFilter,
    }),
  );
  @override
  LoyaltyProgramLoaded $make(CopyWithData data) => LoyaltyProgramLoaded(
    listOfPrograms: data.get(#listOfPrograms, or: $value.listOfPrograms),
    selectedPrograms: data.get(#selectedPrograms, or: $value.selectedPrograms),
    selectedFilterProgram: data.get(
      #selectedFilterProgram,
      or: $value.selectedFilterProgram,
    ),
    allFilter: data.get(#allFilter, or: $value.allFilter),
  );

  @override
  LoyaltyProgramLoadedCopyWith<$R2, LoyaltyProgramLoaded, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _LoyaltyProgramLoadedCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class LoyaltyProgramEditingMapper
    extends ClassMapperBase<LoyaltyProgramEditing> {
  LoyaltyProgramEditingMapper._();

  static LoyaltyProgramEditingMapper? _instance;
  static LoyaltyProgramEditingMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoyaltyProgramEditingMapper._());
      LoyaltyProgramStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LoyaltyProgramEditing';

  static ProgramType _$programType(LoyaltyProgramEditing v) => v.programType;
  static const Field<LoyaltyProgramEditing, ProgramType> _f$programType = Field(
    'programType',
    _$programType,
  );
  static LoyaltyProgramEntity _$program(LoyaltyProgramEditing v) => v.program;
  static const Field<LoyaltyProgramEditing, LoyaltyProgramEntity> _f$program =
      Field('program', _$program);
  static int? _$selectReturnNumber(LoyaltyProgramEditing v) =>
      v.selectReturnNumber;
  static const Field<LoyaltyProgramEditing, int> _f$selectReturnNumber = Field(
    'selectReturnNumber',
    _$selectReturnNumber,
    opt: true,
  );
  static bool _$loading(LoyaltyProgramEditing v) => v.loading;
  static const Field<LoyaltyProgramEditing, bool> _f$loading = Field(
    'loading',
    _$loading,
    opt: true,
    def: false,
  );
  static Status _$status(LoyaltyProgramEditing v) => v.status;
  static const Field<LoyaltyProgramEditing, Status> _f$status = Field(
    'status',
    _$status,
    opt: true,
    def: Status.idle,
  );
  static RewardStatus _$rewardStatus(LoyaltyProgramEditing v) => v.rewardStatus;
  static const Field<LoyaltyProgramEditing, RewardStatus> _f$rewardStatus =
      Field(
        'rewardStatus',
        _$rewardStatus,
        opt: true,
        def: RewardStatus.initial,
      );
  static String? _$message(LoyaltyProgramEditing v) => v.message;
  static const Field<LoyaltyProgramEditing, String> _f$message = Field(
    'message',
    _$message,
    opt: true,
  );

  @override
  final MappableFields<LoyaltyProgramEditing> fields = const {
    #programType: _f$programType,
    #program: _f$program,
    #selectReturnNumber: _f$selectReturnNumber,
    #loading: _f$loading,
    #status: _f$status,
    #rewardStatus: _f$rewardStatus,
    #message: _f$message,
  };

  static LoyaltyProgramEditing _instantiate(DecodingData data) {
    return LoyaltyProgramEditing(
      programType: data.dec(_f$programType),
      program: data.dec(_f$program),
      selectReturnNumber: data.dec(_f$selectReturnNumber),
      loading: data.dec(_f$loading),
      status: data.dec(_f$status),
      rewardStatus: data.dec(_f$rewardStatus),
      message: data.dec(_f$message),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static LoyaltyProgramEditing fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LoyaltyProgramEditing>(map);
  }

  static LoyaltyProgramEditing fromJson(String json) {
    return ensureInitialized().decodeJson<LoyaltyProgramEditing>(json);
  }
}

mixin LoyaltyProgramEditingMappable {
  String toJson() {
    return LoyaltyProgramEditingMapper.ensureInitialized()
        .encodeJson<LoyaltyProgramEditing>(this as LoyaltyProgramEditing);
  }

  Map<String, dynamic> toMap() {
    return LoyaltyProgramEditingMapper.ensureInitialized()
        .encodeMap<LoyaltyProgramEditing>(this as LoyaltyProgramEditing);
  }

  LoyaltyProgramEditingCopyWith<
    LoyaltyProgramEditing,
    LoyaltyProgramEditing,
    LoyaltyProgramEditing
  >
  get copyWith =>
      _LoyaltyProgramEditingCopyWithImpl<
        LoyaltyProgramEditing,
        LoyaltyProgramEditing
      >(this as LoyaltyProgramEditing, $identity, $identity);
  @override
  String toString() {
    return LoyaltyProgramEditingMapper.ensureInitialized().stringifyValue(
      this as LoyaltyProgramEditing,
    );
  }

  @override
  bool operator ==(Object other) {
    return LoyaltyProgramEditingMapper.ensureInitialized().equalsValue(
      this as LoyaltyProgramEditing,
      other,
    );
  }

  @override
  int get hashCode {
    return LoyaltyProgramEditingMapper.ensureInitialized().hashValue(
      this as LoyaltyProgramEditing,
    );
  }
}

extension LoyaltyProgramEditingValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LoyaltyProgramEditing, $Out> {
  LoyaltyProgramEditingCopyWith<$R, LoyaltyProgramEditing, $Out>
  get $asLoyaltyProgramEditing => $base.as(
    (v, t, t2) => _LoyaltyProgramEditingCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class LoyaltyProgramEditingCopyWith<
  $R,
  $In extends LoyaltyProgramEditing,
  $Out
>
    implements LoyaltyProgramStateCopyWith<$R, $In, $Out> {
  @override
  $R call({
    ProgramType? programType,
    LoyaltyProgramEntity? program,
    int? selectReturnNumber,
    bool? loading,
    Status? status,
    RewardStatus? rewardStatus,
    String? message,
  });
  LoyaltyProgramEditingCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _LoyaltyProgramEditingCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LoyaltyProgramEditing, $Out>
    implements LoyaltyProgramEditingCopyWith<$R, LoyaltyProgramEditing, $Out> {
  _LoyaltyProgramEditingCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LoyaltyProgramEditing> $mapper =
      LoyaltyProgramEditingMapper.ensureInitialized();
  @override
  $R call({
    ProgramType? programType,
    LoyaltyProgramEntity? program,
    Object? selectReturnNumber = $none,
    bool? loading,
    Status? status,
    RewardStatus? rewardStatus,
    Object? message = $none,
  }) => $apply(
    FieldCopyWithData({
      if (programType != null) #programType: programType,
      if (program != null) #program: program,
      if (selectReturnNumber != $none) #selectReturnNumber: selectReturnNumber,
      if (loading != null) #loading: loading,
      if (status != null) #status: status,
      if (rewardStatus != null) #rewardStatus: rewardStatus,
      if (message != $none) #message: message,
    }),
  );
  @override
  LoyaltyProgramEditing $make(CopyWithData data) => LoyaltyProgramEditing(
    programType: data.get(#programType, or: $value.programType),
    program: data.get(#program, or: $value.program),
    selectReturnNumber: data.get(
      #selectReturnNumber,
      or: $value.selectReturnNumber,
    ),
    loading: data.get(#loading, or: $value.loading),
    status: data.get(#status, or: $value.status),
    rewardStatus: data.get(#rewardStatus, or: $value.rewardStatus),
    message: data.get(#message, or: $value.message),
  );

  @override
  LoyaltyProgramEditingCopyWith<$R2, LoyaltyProgramEditing, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _LoyaltyProgramEditingCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class RewardAddedMapper extends ClassMapperBase<RewardAdded> {
  RewardAddedMapper._();

  static RewardAddedMapper? _instance;
  static RewardAddedMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RewardAddedMapper._());
      LoyaltyProgramStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RewardAdded';

  static LoyaltyProgramEntity _$updatedProgram(RewardAdded v) =>
      v.updatedProgram;
  static const Field<RewardAdded, LoyaltyProgramEntity> _f$updatedProgram =
      Field('updatedProgram', _$updatedProgram);

  @override
  final MappableFields<RewardAdded> fields = const {
    #updatedProgram: _f$updatedProgram,
  };

  static RewardAdded _instantiate(DecodingData data) {
    return RewardAdded(data.dec(_f$updatedProgram));
  }

  @override
  final Function instantiate = _instantiate;

  static RewardAdded fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RewardAdded>(map);
  }

  static RewardAdded fromJson(String json) {
    return ensureInitialized().decodeJson<RewardAdded>(json);
  }
}

mixin RewardAddedMappable {
  String toJson() {
    return RewardAddedMapper.ensureInitialized().encodeJson<RewardAdded>(
      this as RewardAdded,
    );
  }

  Map<String, dynamic> toMap() {
    return RewardAddedMapper.ensureInitialized().encodeMap<RewardAdded>(
      this as RewardAdded,
    );
  }

  RewardAddedCopyWith<RewardAdded, RewardAdded, RewardAdded> get copyWith =>
      _RewardAddedCopyWithImpl<RewardAdded, RewardAdded>(
        this as RewardAdded,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return RewardAddedMapper.ensureInitialized().stringifyValue(
      this as RewardAdded,
    );
  }

  @override
  bool operator ==(Object other) {
    return RewardAddedMapper.ensureInitialized().equalsValue(
      this as RewardAdded,
      other,
    );
  }

  @override
  int get hashCode {
    return RewardAddedMapper.ensureInitialized().hashValue(this as RewardAdded);
  }
}

extension RewardAddedValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RewardAdded, $Out> {
  RewardAddedCopyWith<$R, RewardAdded, $Out> get $asRewardAdded =>
      $base.as((v, t, t2) => _RewardAddedCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RewardAddedCopyWith<$R, $In extends RewardAdded, $Out>
    implements LoyaltyProgramStateCopyWith<$R, $In, $Out> {
  @override
  $R call({LoyaltyProgramEntity? updatedProgram});
  RewardAddedCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RewardAddedCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RewardAdded, $Out>
    implements RewardAddedCopyWith<$R, RewardAdded, $Out> {
  _RewardAddedCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RewardAdded> $mapper =
      RewardAddedMapper.ensureInitialized();
  @override
  $R call({LoyaltyProgramEntity? updatedProgram}) => $apply(
    FieldCopyWithData({
      if (updatedProgram != null) #updatedProgram: updatedProgram,
    }),
  );
  @override
  RewardAdded $make(CopyWithData data) =>
      RewardAdded(data.get(#updatedProgram, or: $value.updatedProgram));

  @override
  RewardAddedCopyWith<$R2, RewardAdded, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _RewardAddedCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class LoyaltyProgramErrorMapper extends ClassMapperBase<LoyaltyProgramError> {
  LoyaltyProgramErrorMapper._();

  static LoyaltyProgramErrorMapper? _instance;
  static LoyaltyProgramErrorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoyaltyProgramErrorMapper._());
      LoyaltyProgramStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LoyaltyProgramError';

  static String _$message(LoyaltyProgramError v) => v.message;
  static const Field<LoyaltyProgramError, String> _f$message = Field(
    'message',
    _$message,
  );

  @override
  final MappableFields<LoyaltyProgramError> fields = const {
    #message: _f$message,
  };

  static LoyaltyProgramError _instantiate(DecodingData data) {
    return LoyaltyProgramError(data.dec(_f$message));
  }

  @override
  final Function instantiate = _instantiate;

  static LoyaltyProgramError fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LoyaltyProgramError>(map);
  }

  static LoyaltyProgramError fromJson(String json) {
    return ensureInitialized().decodeJson<LoyaltyProgramError>(json);
  }
}

mixin LoyaltyProgramErrorMappable {
  String toJson() {
    return LoyaltyProgramErrorMapper.ensureInitialized()
        .encodeJson<LoyaltyProgramError>(this as LoyaltyProgramError);
  }

  Map<String, dynamic> toMap() {
    return LoyaltyProgramErrorMapper.ensureInitialized()
        .encodeMap<LoyaltyProgramError>(this as LoyaltyProgramError);
  }

  LoyaltyProgramErrorCopyWith<
    LoyaltyProgramError,
    LoyaltyProgramError,
    LoyaltyProgramError
  >
  get copyWith =>
      _LoyaltyProgramErrorCopyWithImpl<
        LoyaltyProgramError,
        LoyaltyProgramError
      >(this as LoyaltyProgramError, $identity, $identity);
  @override
  String toString() {
    return LoyaltyProgramErrorMapper.ensureInitialized().stringifyValue(
      this as LoyaltyProgramError,
    );
  }

  @override
  bool operator ==(Object other) {
    return LoyaltyProgramErrorMapper.ensureInitialized().equalsValue(
      this as LoyaltyProgramError,
      other,
    );
  }

  @override
  int get hashCode {
    return LoyaltyProgramErrorMapper.ensureInitialized().hashValue(
      this as LoyaltyProgramError,
    );
  }
}

extension LoyaltyProgramErrorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LoyaltyProgramError, $Out> {
  LoyaltyProgramErrorCopyWith<$R, LoyaltyProgramError, $Out>
  get $asLoyaltyProgramError => $base.as(
    (v, t, t2) => _LoyaltyProgramErrorCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class LoyaltyProgramErrorCopyWith<
  $R,
  $In extends LoyaltyProgramError,
  $Out
>
    implements LoyaltyProgramStateCopyWith<$R, $In, $Out> {
  @override
  $R call({String? message});
  LoyaltyProgramErrorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _LoyaltyProgramErrorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LoyaltyProgramError, $Out>
    implements LoyaltyProgramErrorCopyWith<$R, LoyaltyProgramError, $Out> {
  _LoyaltyProgramErrorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LoyaltyProgramError> $mapper =
      LoyaltyProgramErrorMapper.ensureInitialized();
  @override
  $R call({String? message}) =>
      $apply(FieldCopyWithData({if (message != null) #message: message}));
  @override
  LoyaltyProgramError $make(CopyWithData data) =>
      LoyaltyProgramError(data.get(#message, or: $value.message));

  @override
  LoyaltyProgramErrorCopyWith<$R2, LoyaltyProgramError, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _LoyaltyProgramErrorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

