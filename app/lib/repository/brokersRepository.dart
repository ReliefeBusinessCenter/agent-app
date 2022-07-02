import 'package:app/data_provider/broker-data-provider.dart';
import 'package:app/model/broker/broker.dart';

class BrokersRepository {
  late final BrokerDataProvider brokerDataProvider;
  BrokersRepository({
    required this.brokerDataProvider,
  });

  Future<List<Broker>> getBrokers() async {
    List<Broker> data = await brokerDataProvider.getBrokers() as List<Broker>;
    print("Data arrived at the data provider ${data.map((e) => e.toJson())}");
    return data;
  }

  Future<bool> createBroker(Broker broker) async {
    bool data = (await brokerDataProvider.createBroker(broker));
    print("Data arrived at the data provider $data");
    return data;
  }

  Future<Broker?> getBrokerById(int id) async {
    Broker data = await brokerDataProvider.getBrokerById(id) as Broker;
    print("Data arrived at the Repository  $data");
    return data;
  }

  Future<Broker?> getBrokerByEmail(String email) async {
    Broker? data = await brokerDataProvider.getBrokerByPhone(email);
    // print("Broker arrived at the repository: ${data!.toJson()}");
    return data;
  }

  Future<bool> deleteBroker(int id) async {
    return await brokerDataProvider.deleteBrokerEvent(id);
  }

  // update broker
  Future<Broker> updateBroker(Broker broker, bool status) async {
    return await brokerDataProvider.updateBroker(broker, status);
  }

  // update broker profile
  Future<Broker> updateBrokerProfile(Broker broker, bool imageChanged) async {
    return await brokerDataProvider.updateBrokerProfile(broker, imageChanged);
  }
}
