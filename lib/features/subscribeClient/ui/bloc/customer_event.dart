part of 'customer_bloc.dart';

sealed class CustomerEvent extends Equatable {
  const CustomerEvent();

  @override
  List<Object?> get props => [];
}

final class Init extends CustomerEvent {}

final class OnSelectProgram extends CustomerEvent {
  final List<LoyaltyProgramEntity> programs;

  const OnSelectProgram(this.programs);

  @override
  List<Object?> get props => [programs];
}

final class SubscribeCustomer extends CustomerEvent {
  final String? name;
  final String? phone;
  final String? email;

  const SubscribeCustomer({
    this.name,
    this.phone,
    this.email,
  });

  @override
  List<Object?> get props => [name, phone, email];
}
