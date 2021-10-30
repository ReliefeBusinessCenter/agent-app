import 'package:app/data_provider/categories_data_provider.dart';
import 'package:app/data_provider/customer-data-provider.dart';
import 'package:app/data_provider/deals_data_provider.dart';
import 'package:app/data_provider/delivery-data-provider.dart';
// import 'package:app/model/category.dart';
import 'package:app/model/customer/customer.dart';
import 'package:app/model/deals.dart';
import 'package:app/model/delivery.dart';

class DealsRepository {
  late final DealsDataProvider dealsDataProvider;
  DealsRepository({
    required this.dealsDataProvider,
  });

  Future<bool> createDeals(Deals deals) async {
    bool data = (await dealsDataProvider.createDeals(deals));
    print("Data arrived at the data provider $data");
    return data;
  }

   Future<bool> updateDeals(Deals deals) async {
    bool data = (await dealsDataProvider.updateDeals(deals));
    print("Data arrived at the data provider $data");
    return data;
  }

  Future<bool> deleteDeals(int id) async {
    bool deleted = await dealsDataProvider.deleteDeals(id);
    return deleted;
  }

}
