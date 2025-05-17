import '../../services/helpers/program_type_enum.dart';

abstract class LoyaltyProgramEntity  {
  String? get name;
  ProgramType? get type;
}
