import 'package:equatable/equatable.dart';

import '../../services/helpers/program_type_enum.dart';

abstract class LoyaltyProgramEntity extends Equatable  {
  String? get name;
  ProgramType get type;

  LoyaltyProgramEntity copyWith({
    String? name,
    ProgramType? type,
  });

  @override
  List<Object?> get props => [type, name];
}
