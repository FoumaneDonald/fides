import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../domain/entities/customer_entity.dart';
import '../../../../domain/entities/loyalty_program_entity.dart';
import '../../../../domain/repositories/customer_repository.dart';
import '../../../../domain/repositories/loyalty_program_repository.dart';
import '../../../../services/helpers/program_type_enum.dart';

part 'customer_event.dart';

part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final LoyaltyProgramRepository _loyaltyProgramRepository;
  final CustomerRepository _customerRepository;

  CustomerBloc({
    required LoyaltyProgramRepository loyaltyProgramRepository,
    required CustomerRepository customerRepository,
  })  : _loyaltyProgramRepository = loyaltyProgramRepository,
        _customerRepository = customerRepository,
        super(CustomerState.initial()) {
    on<Init>(_onInit);
    on<OnSelectProgram>(_onSelectProgram);
    on<SubscribeCustomer>(_onSubscribeCustomer);
  }

  _onInit(Init event, Emitter<CustomerState> emit) {
    emit(state.copyWith(programStatus: ProgramStatus.loading, message: ProgramStatus.loading.message));
    Map<ProgramType, List<LoyaltyProgramEntity>> programs = _loyaltyProgramRepository.existingPrograms;
    emit(state.copyWith(programStatus: ProgramStatus.loaded, message: ProgramStatus.loaded.message, loyaltyPrograms: programs.values.expand((program) => program).toList()));
  }

  _onSelectProgram(OnSelectProgram event, Emitter<CustomerState> emit) {
    List<LoyaltyProgramEntity> customerSelectedPrograms = state.customerEntity!.loyaltyPrograms!;
    customerSelectedPrograms = List.from(event.programs);
    emit(state.copyWith(customerEntity: state.customerEntity!.copyWith(loyaltyPrograms: customerSelectedPrograms)));
  }

  _onSubscribeCustomer(SubscribeCustomer event, Emitter<CustomerState> emit) async{
    emit(state.copyWith(status: CustomerStatus.loading, message: CustomerStatus.loading.message));

    final newCustomer = state.customerEntity!.copyWith(
      name: event.customer.name,
      phone: event.customer.phone,
      email: event.customer.email,
    );

    final result = await _customerRepository.createCustomer(customerEntity: newCustomer);

    result.fold(
      (success) => emit(state.copyWith(status: CustomerStatus.success, message: CustomerStatus.success.message, customerEntity: success)),
      (failure) => emit(state.copyWith(status: CustomerStatus.error, message: CustomerStatus.error.message + failure.toString())),
    );
  }
}
