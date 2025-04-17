import 'package:result_dart/result_dart.dart';

import '../../domain/entities/customer_entity.dart';
import '../../domain/entities/loyalty_program_entity.dart';
import '../../domain/repositories/customer_repository.dart';
import '../../services/customer_dao.dart';

class CustomerRepoImpl implements CustomerRepository{
  final CustomerDao customerDao;

  const CustomerRepoImpl(this.customerDao);

  @override
  Future<Result<CustomerEntity>> createCustomer({required CustomerEntity customerEntity, required LoyaltyProgramEntity loyaltyProgramEntity}) {
    // TODO: implement createCustomer
    throw UnimplementedError();
  }

}