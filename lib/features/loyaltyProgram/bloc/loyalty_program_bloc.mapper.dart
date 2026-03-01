// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'loyalty_program_bloc.dart';

class LoyaltyProgramLoadedMapper extends ClassMapperBase<LoyaltyProgramLoaded> {
  LoyaltyProgramLoadedMapper._();

  static LoyaltyProgramLoadedMapper? _instance;
  static LoyaltyProgramLoadedMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoyaltyProgramLoadedMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LoyaltyProgramLoaded';

  static Map<ProgramType, List<LoyaltyProgramEntity<dynamic>>> _$listOfPrograms(
    LoyaltyProgramLoaded v,
  ) => v.listOfPrograms;
  static const Field<
    LoyaltyProgramLoaded,
    Map<ProgramType, List<LoyaltyProgramEntity<dynamic>>>
  >
  _f$listOfPrograms = Field('listOfPrograms', _$listOfPrograms);
  static List<LoyaltyProgramEntity<dynamic>> _$selectedPrograms(
    LoyaltyProgramLoaded v,
  ) => v.selectedPrograms;
  static const Field<LoyaltyProgramLoaded, List<LoyaltyProgramEntity<dynamic>>>
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
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<
    $R,
    ProgramType,
    List<LoyaltyProgramEntity<dynamic>>,
    ObjectCopyWith<
      $R,
      List<LoyaltyProgramEntity<dynamic>>,
      List<LoyaltyProgramEntity<dynamic>>
    >
  >
  get listOfPrograms;
  ListCopyWith<
    $R,
    LoyaltyProgramEntity<dynamic>,
    ObjectCopyWith<
      $R,
      LoyaltyProgramEntity<dynamic>,
      LoyaltyProgramEntity<dynamic>
    >
  >
  get selectedPrograms;
  $R call({
    Map<ProgramType, List<LoyaltyProgramEntity<dynamic>>>? listOfPrograms,
    List<LoyaltyProgramEntity<dynamic>>? selectedPrograms,
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
    List<LoyaltyProgramEntity<dynamic>>,
    ObjectCopyWith<
      $R,
      List<LoyaltyProgramEntity<dynamic>>,
      List<LoyaltyProgramEntity<dynamic>>
    >
  >
  get listOfPrograms => MapCopyWith(
    $value.listOfPrograms,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(listOfPrograms: v),
  );
  @override
  ListCopyWith<
    $R,
    LoyaltyProgramEntity<dynamic>,
    ObjectCopyWith<
      $R,
      LoyaltyProgramEntity<dynamic>,
      LoyaltyProgramEntity<dynamic>
    >
  >
  get selectedPrograms => ListCopyWith(
    $value.selectedPrograms,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(selectedPrograms: v),
  );
  @override
  $R call({
    Map<ProgramType, List<LoyaltyProgramEntity<dynamic>>>? listOfPrograms,
    List<LoyaltyProgramEntity<dynamic>>? selectedPrograms,
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

