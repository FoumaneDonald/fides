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
  error(message: 'Error:'),
  loaded(message: 'Programs loaded');

  const ProgramStatus({required this.message});

  final String message;
}

@MappableClass()
final class CustomerState with CustomerStateMappable {
  final CustomerStatus? status;
  final ProgramStatus? programStatus;
  final String? message;
  final List<LoyaltyProgramEntity>? listOfPrograms;
  final CustomerEntity? customerEntity;

  const CustomerState({
    this.status,
    this.programStatus,
    this.message,
    this.listOfPrograms,
    this.customerEntity,
  });

  factory CustomerState.initial() => CustomerState(
        status: CustomerStatus.initial,
        programStatus: ProgramStatus.loading,
        message: CustomerStatus.initial.message,
        listOfPrograms: const [],
        customerEntity: const CustomerEntity(name: '', loyaltyPrograms: []),
      );
}
