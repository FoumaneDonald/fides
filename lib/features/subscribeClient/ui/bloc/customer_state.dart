part of 'customer_bloc.dart';

enum CustomerStateStatus { initial, loading, error, success }

enum ProgramStatus { loading, error, loaded }

final class CustomerState extends Equatable {
  final CustomerStateStatus? status;
  final ProgramStatus? programStatus;
  final String? message;
  final List<LoyaltyProgramEntity>? loyaltyPrograms;
  final List<LoyaltyProgramEntity>? selectedPrograms;
  final CustomerEntity? customerEntity;

  const CustomerState({
    this.status,
    this.programStatus,
    this.message,
    this.loyaltyPrograms,
    this.selectedPrograms,
    this.customerEntity,
  });

  factory CustomerState.initial() => CustomerState(
        status: CustomerStateStatus.initial,
        programStatus: ProgramStatus.loading,
        message: '',
        loyaltyPrograms: const [],
        selectedPrograms: const [],
        customerEntity: const CustomerEntity(loyaltyPrograms: []),
      );

  CustomerState copyWith({
    CustomerStateStatus? status,
    ProgramStatus? programStatus,
    String? message,
    List<LoyaltyProgramEntity>? loyaltyPrograms,
    List<LoyaltyProgramEntity>? selectedPrograms,
    CustomerEntity? customerEntity,
  }) {
    return CustomerState(
      status: status ?? this.status,
      programStatus: programStatus ?? this.programStatus,
      message: message ?? this.message,
      loyaltyPrograms: loyaltyPrograms ?? this.loyaltyPrograms,
      selectedPrograms: selectedPrograms ?? this.selectedPrograms,
      customerEntity: customerEntity ?? this.customerEntity,
    );
  }

  @override
  List<Object?> get props => [status, programStatus, message, 'loyaltyPrograms', selectedPrograms, customerEntity];
}
