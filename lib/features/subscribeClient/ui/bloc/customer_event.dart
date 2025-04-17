part of 'customer_bloc.dart';

sealed class CustomerEvent extends Equatable {
  const CustomerEvent();

  @override
  List<Object?> get props => [];
}

final class Init extends CustomerEvent {}

final class SubscribeCustomer extends CustomerEvent {
  final String? name;
  final String? phone;
  final String? email;
  final List<LoyaltyProgramEntity>? programs;

  const SubscribeCustomer({
    this.name,
    this.phone,
    this.email,
    this.programs,
  });

  @override
  List<Object?> get props => [name, phone, email, programs];
}
