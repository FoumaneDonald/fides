part of 'home_bloc.dart';

enum HomeStatus {
  initial(message: 'Initialisation'),
  loading(message: 'Loading'),
  error(message: 'Error: '),
  success(message: 'Data loaded');

  const HomeStatus({required this.message});

  final String message;
}

class HomeState extends Equatable {
  final HomeStatus? status;
  final String? message;
  final List<CustomerEntity>? listOfCustomers;

  const HomeState._({
    this.status,
    this.message,
    this.listOfCustomers,
  });

  factory HomeState.initial() => HomeState._(
        status: HomeStatus.initial,
        message: HomeStatus.initial.message,
        listOfCustomers: const [],
      );

  HomeState copyWith({
    HomeStatus? status,
    String? message,
    List<CustomerEntity>? listOfCustomers,
  }) {
    return HomeState._(
      status: status ?? this.status,
      message: message ?? this.message,
      listOfCustomers: listOfCustomers ?? this.listOfCustomers,
    );
  }

  @override
  List<Object?> get props => [status, message, listOfCustomers];
}
