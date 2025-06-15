import 'package:result_dart/result_dart.dart';

import '../entities/customer_entity.dart';
import '../entities/loyalty_program_entity.dart';

abstract class CustomerRepository {
  Future<ResultDart<CustomerEntity, String>> createCustomer({required CustomerEntity customerEntity});
  Future<Result<List<CustomerEntity>>> fetchLatestCustomer({int limit});
  }