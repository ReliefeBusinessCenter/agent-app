import 'package:app/data_provider/brokersDataProvider.dart';
import 'package:app/model/broker.dart';

class BrokersRepository {
  late final BrokersDataProvider brokerDataProvider;
  BrokersRepository({
    required this.brokerDataProvider,
  });

  Future<List<Broker>> getBrokers(int categoryId, String search) async {
    List<Broker> data = await brokerDataProvider.getBrokers(categoryId, search);
    print("Data arrived at the data provider $data");
    return data;
  }
}
