import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/customer_entity.dart';
import '../../../../domain/entities/loyalty_program_entity.dart';
import '../../../../domain/repositories/loyalty_program_repository.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final LoyaltyProgramRepository loyaltyProgramRepository;
  CustomerBloc({required this.loyaltyProgramRepository}) : super(CustomerState.initial()) {
    on<Init>(_onInit);
    on<SubscribeCustomer>(_onSubscribeCustomer);
  }
  _onInit(Init event, Emitter<CustomerState> emit) {
    emit(state.copyWith(programStatus: ProgramStatus.loading));
    List<LoyaltyProgramEntity> programs = loyaltyProgramRepository.existingPrograms;
    emit(state.copyWith(programStatus: ProgramStatus.loaded, loyaltyPrograms: programs));
  }

  _onSubscribeCustomer(SubscribeCustomer event, Emitter<CustomerState> emit) {
    List<LoyaltyProgramEntity> selectedPrograms = [];
    final updatedCustomer = CustomerEntity(
      name: event.name,
      phone: event.phone,
      email: event.email,
    );

    if(event.programs != null) {
      selectedPrograms = List.from(event.programs!);
    }

    emit(state.copyWith(customerEntity: updatedCustomer, selectedPrograms: selectedPrograms));
  }
}
