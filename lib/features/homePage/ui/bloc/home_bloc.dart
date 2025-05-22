import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../domain/entities/customer_entity.dart';
import '../../../../domain/entities/loyalty_program_entity.dart';
import '../../../../domain/repositories/customer_repository.dart';
import '../../../../domain/repositories/loyalty_program_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CustomerRepository _customerRepository;

  HomeBloc(CustomerRepository customerRepository)
      : _customerRepository = customerRepository,
        super(HomeState.initial()) {
    on<LatestCustomer>(_onLatestCustomer);
  }

  _onLatestCustomer(LatestCustomer event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.loading, message: HomeStatus.loading.message));

    final Result<List<CustomerEntity>> result = await _customerRepository.fetchLatestCustomer();

    result.fold(
      (customerList) => emit(state.copyWith(status: HomeStatus.success, message: HomeStatus.success.message, listOfCustomers: customerList)),
      (failure) => emit(state.copyWith(status: HomeStatus.error, message: HomeStatus.error.message)),
    );
  }
}
