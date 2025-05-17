import 'package:uuid/uuid.dart';

import '../data/models/customer_model.dart';
import '../data/models/loyalty_program_model.dart';
import '../objectbox.g.dart';
import 'object_box.dart';

class CustomerDao {
  // Inject the ObjectBox
  final ObjectBox _objectBox;

  CustomerDao(this._objectBox);

  Box<LoyaltyProgramModel> get _loyaltyProgramBox => _objectBox.store.box<LoyaltyProgramModel>();

  Box<CustomerModel> get _customerBox => _objectBox.store.box<CustomerModel>();

  createCustomer(CustomerModel customerModel, LoyaltyProgramModel loyaltyProgramModel) {
    try {
      String customerUid = const Uuid().v4();

      final customer = customerModel.copyWith(uid: customerUid);

      // customer.loyaltyPrograms.add(loyaltyProgramModel);

      _customerBox.put(customer);
      return customer;
    } catch (error, stackTrace) {
      print('$error, $stackTrace');
      throw Exception('Failed to create data');
    }
  }
}
