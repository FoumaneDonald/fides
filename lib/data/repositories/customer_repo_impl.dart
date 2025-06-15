import 'package:result_dart/result_dart.dart';

import '../../domain/entities/customer_entity.dart';
import '../../domain/entities/loyalty_program_entity.dart';
import '../../domain/repositories/customer_repository.dart';
import '../../services/customer_dao.dart';
import '../models/customer_model.dart';

class CustomerRepoImpl implements CustomerRepository {
  final CustomerDao _customerDao;

  CustomerRepoImpl(CustomerDao customerDao) : _customerDao = customerDao;

  @override
  Future<ResultDart<CustomerEntity, String>> createCustomer({required CustomerEntity customerEntity}) async {
    final ResultDart<CustomerModel, String> result = await _customerDao.createCustomer(CustomerModel.fromEntity(customerEntity));

    return result.fold(
      (customer) => Success(CustomerEntity.fromModel(customer)),
      (failure) => Failure(failure),
    );
  }

  @override
  Future<Result<List<CustomerEntity>>> fetchLatestCustomer({int limit = 8}) async {
    final result = await _customerDao.getLatestCustomers(limit);

    return result.fold(
      (List<CustomerModel> customerList) => Success(CustomerEntity.fromModelList(customerList)),
      (failure) => Failure(failure),
    );
  }
}
