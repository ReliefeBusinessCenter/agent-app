// import 'package:app/constants/customer-page/categories.dart';
// import 'package:app/model/broker.dart';

// class BrokersDataProvider {
//   BrokersDataProvider();

//   Future<List<Broker>> getBrokers(
//     int categoryId,
//     String search,
//   ) async {
    // late List<Broker> brokers_return = DUMMY_BROKERS;
//     if (categoryId == 0) {
//       List<Broker> filteredBrokers = [];
//       for (int i = 0; i < brokers_return.length; i++) {
//         if (brokers_return[i]
//             .name
//             .toLowerCase()
//             .contains(search.toLowerCase())) {
//           filteredBrokers.add(brokers_return[i]);
//         }
//       }
//       return filteredBrokers;
//     } else {
//       List<Broker> filteredBrokers = [];
//       for (int i = 0; i < brokers_return.length; i++) {
//         if (brokers_return[i].categoryId == categoryId) {
//           if (brokers_return[i]
//               .name
//               .toLowerCase()
//               .contains(search.toLowerCase())) {
//             filteredBrokers.add(brokers_return[i]);
//           }
//         }
//       }

//       return filteredBrokers;
//     }

//     return brokers_return;
//   }
// }
