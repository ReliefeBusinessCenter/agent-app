import 'package:app/data_provider/categories_data_provider.dart';
import 'package:app/data_provider/customer-data-provider.dart';
import 'package:app/data_provider/delivery-data-provider.dart';
import 'package:app/model/category.dart';
import 'package:app/model/customer/customer.dart';
import 'package:app/model/delivery.dart';


class DeliveryRepository {
  late final DeliveryDataProvider  deliveryDataProvider;
  DeliveryRepository({
    required this.deliveryDataProvider,
  });

  Future<bool> createDelivery(Delivery delivery) async {
    bool data = (await deliveryDataProvider.createDelivery(delivery));
    print("Data arrived at the data provider $data");
    return data;
  }

 
}
