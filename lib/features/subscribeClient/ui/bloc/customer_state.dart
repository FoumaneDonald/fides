part of 'customer_bloc.dart';

enum CustomerStatus {
  initial(message: 'Initialisation'),
  loading(message: 'Creating a customer'),
  error(message: 'Error: '),
  success(message: 'Successfully created a customer');

  const CustomerStatus({required this.message});

  final String message;
}

enum ProgramStatus {
  loading(message: 'Loading programs'),
  error(message: 'Error: '),
  loaded(message: 'Programs loaded');

  const ProgramStatus({required this.message});

  final String message;
}

final class CustomerState extends Equatable {
  final CustomerStatus? status;
  final ProgramStatus? programStatus;
  final String? message;
  final List<LoyaltyProgramEntity>? loyaltyPrograms;
  final CustomerEntity? customerEntity;

  const CustomerState({
    this.status,
    this.programStatus,
    this.message,
    this.loyaltyPrograms,
    this.customerEntity,
  });

  factory CustomerState.initial() => CustomerState(
        status: CustomerStatus.initial,
        programStatus: ProgramStatus.loading,
        message: CustomerStatus.initial.message,
        loyaltyPrograms: const [],
        customerEntity: const CustomerEntity(loyaltyPrograms: []),
      );

  CustomerState copyWith({
    CustomerStatus? status,
    ProgramStatus? programStatus,
    String? message,
    List<LoyaltyProgramEntity>? loyaltyPrograms,
    CustomerEntity? customerEntity,
  }) {
    return CustomerState(
      status: status ?? this.status,
      programStatus: programStatus ?? this.programStatus,
      message: message ?? this.message,
      loyaltyPrograms: loyaltyPrograms ?? this.loyaltyPrograms,
      customerEntity: customerEntity ?? this.customerEntity,
    );
  }

  @override
  List<Object?> get props => [status, programStatus, message, 'loyaltyPrograms', customerEntity];
}
