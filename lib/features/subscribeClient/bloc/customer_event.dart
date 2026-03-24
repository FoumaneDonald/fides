part of 'customer_bloc.dart';

sealed class CustomerEvent extends Equatable {
  const CustomerEvent();

  @override
  List<Object?> get props => [];
}

final class Init extends CustomerEvent {}

final class OnSelectProgram extends CustomerEvent {
  final List<Object> programs;

  const OnSelectProgram(this.programs);

  @override
  List<Object?> get props => [programs];
}

final class SubscribeCustomer extends CustomerEvent {
  final CustomerEntity customer;

  const SubscribeCustomer(this.customer);

  @override
  List<Object?> get props => [customer];
}
