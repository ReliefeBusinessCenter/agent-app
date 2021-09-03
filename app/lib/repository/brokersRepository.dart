
import 'package:app/data_provider/broker-data-provider.dart';
import 'package:app/model/broker/broker.dart';


class BrokersRepository {
  late final BrokerDataProvider brokerDataProvider;
  BrokersRepository({
    required this.brokerDataProvider,
  });

  Future<List<Broker>> getBrokers() async {
    List<Broker> data = await brokerDataProvider.getBrokers() as List<Broker>;
    print("Data arrived at the data provider $data");
    return data;
  }
}
