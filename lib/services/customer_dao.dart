import 'package:result_dart/result_dart.dart';
import 'package:uuid/uuid.dart';

import '../data/models/customer_model.dart';
import '../objectbox.g.dart';
import 'object_box.dart';

class CustomerDao {
  // Inject the ObjectBox
  final ObjectBox _objectBox;

  CustomerDao(this._objectBox);

  Box<CustomerModel> get _customerBox => _objectBox.store.box<CustomerModel>();

  Future<ResultDart<CustomerModel, String>> createCustomer(CustomerModel customerModel) async{
    try {
      final result = await _customerBox.putAndGetAsync(customerModel);
      return Success(result);
    } on ObjectBoxException catch (error, stackTrace){
      return Failure('Name is already taken');
    } catch (error, stackTrace) {
      print('$error, $stackTrace');
      return Failure('Failed to create data');
    }
  }

  Future<Result<List<CustomerModel>>> getLatestCustomers(int limit) async{
    try{
      Query<CustomerModel> query = _customerBox.query().build()
      ..limit = limit;
      final result = query.find();
      query.close();
      return Success(result);
    }catch(error, stackTrace){
      print('$error, $stackTrace');
      return Failure(Exception('Unable to retrieve data'));
    }
  }
}
