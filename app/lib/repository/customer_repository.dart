import 'package:app/data_provider/customer-data-provider.dart';
// import 'package:app/model/category.dart';
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

  Future<Customer?> getCustomerByEmail(String email) async {
    Customer? data = await customerDataProvider.getCustomerByEmail(email);
    print("Customer arrived at the repository: ${data!.toJson()}");
    return data;
  }

  Future<List<Customer>> getCustomers() async {
    List<Customer> data = await customerDataProvider.getCustomers() as List<Customer>;
    print("Data arrived at the data provider ${data.map((e) => e.toJson())}");
    return data;
  }
  Future<bool> deleteCustomer(int id) async {
    bool deleted = await customerDataProvider.deleteCustomer(id);
    return deleted;
  }
  
}
