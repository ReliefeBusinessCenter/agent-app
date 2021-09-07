import 'package:app/data_provider/categories_data_provider.dart';
import 'package:app/data_provider/customer-data-provider.dart';
import 'package:app/model/category.dart';
import 'package:app/model/customer/customer.dart';


class CustomerRepository {
  late final CustomerDataProvider customerDataProvider;
  CustomerRepository({
    required this.customerDataProvider,
  });

  Future<bool> createCustomers(Customer customer) async {
    bool data = (await customerDataProvider.createCustomer(customer));
    print("Data arrived at the data provider $data");
    return data;
  }
}
