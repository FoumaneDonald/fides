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

@freezed
abstract class CustomerState with _$CustomerState {
  const CustomerState._();

  const factory CustomerState({
    CustomerStatus? status,
    ProgramStatus? programStatus,
    String? message,
    List<LoyaltyProgramEntity>? listOfPrograms,
    CustomerEntity? customerEntity,
  }) = _CustomerState;

  factory CustomerState.initial() => CustomerState(
        status: CustomerStatus.initial,
        programStatus: ProgramStatus.loading,
        message: CustomerStatus.initial.message,
        listOfPrograms: const [],
        customerEntity: const CustomerEntity(name: '', loyaltyPrograms: []),
      );
}
