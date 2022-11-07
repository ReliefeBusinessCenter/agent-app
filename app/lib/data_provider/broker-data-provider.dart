import 'dart:convert';
import 'package:app/Service/fireabse_service.dart';
import 'package:app/ip/ip.dart';
import 'package:app/model/broker/broker.dart';
import 'package:app/preferences/user_preference_data.dart';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class BrokerDataProvider {
  final _baseUrl = '${Ip.ip}/api/brokers';
  final http.Client httpClient;
  final UserPreferences userPreferences;
  late String? token;
  BrokerDataProvider({required this.httpClient, required this.userPreferences});

  Future<void> initState() async {
    token = await userPreferences.getUserToken();
  }

// get broker data
  Future<List<Broker>?> getBrokers() async {
    print("I am on get broker method: ");
    initState();
    try {
      final url = Uri.parse('$_baseUrl');

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final extractedData = json.decode(response.body) as List;
        return extractedData.map((broker) => Broker.fromJson(broker)).toList();
      } else {
        print(response.body);
        throw Exception('Failed to Load Broker Data');
      }
    } catch (e) {
      print("Exception thrown $e");
      throw Exception(e);
    }
  }

// get broker by phone
  Future<Broker?> getBrokerByPhone(String phone) async {
    initState();
    try {
      final url = Uri.parse('$_baseUrl/$phone');
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final extractedData = json.decode(response.body);
        final data = extractedData;
        return Broker.fromJson(data);
      } else {
        throw Exception('Failed to get broker by phone');
      }
    } catch (e) {
      print("Exception throuwn $e");
    }
    return null;
  }

// get broker by Id
  Future<Broker?> getBrokerById(int id) async {
    initState();
    try {
      final url = Uri.parse('$_baseUrl/$id');
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final extractedData = json.decode(response.body);
        final data = extractedData;
        return Broker.fromJson(data);
      } else {
        throw Exception('Failed to load courses');
      }
    } catch (e) {
      print("Exception throuwn $e");
    }
    // return broker_return;
  }

  Future<bool> createBroker(Broker? broker) async {
    initState();
    try {
      final url = Uri.parse('$_baseUrl');
      // var request = http.MultipartRequest(
      //     'POST', Uri.parse('${Ip.ip}/api/users/uploadfileg'));
      // var request2 = http.MultipartRequest(
      //     'POST', Uri.parse('${Ip.ip}/api/users/uploadfileg'));

      // request.files.add(await http.MultipartFile.fromPath(
      //     'file', broker?.user!.picture as String));

      // var res = await http.Response.fromStream(await request.send());

      // request2.files.add(await http.MultipartFile.fromPath(
      //     'file', broker?.user!.identificationCard as String));

      // var resId = await http.Response.fromStream(await request2.send());
      try {
        if (broker?.user!.picture == null)
          throw new Exception("Profile picture is required");
        if (broker?.user!.identificationCard == null)
          throw new Exception("Broker Identification card is required");
        String? piPath;
        // String? iPath;
        String picturePath =
          await   FirebaseService.uploadFile((broker!.user!.picture), "users/")
              .then((value) => {
                 piPath = value
                 
              })
              .toString();
        

        String idPath =  FirebaseService.uploadFile(
                broker.user!.identificationCard, "IdentificationCard/")
                // .then((value) => {
                //   iPath = value
                // })
            .toString();
        
        print("w d i iss : ${broker.skills!.workDone} Identification path is :  ${idPath}");
        final response = await http.post(url,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            },
            body: jsonEncode({
              "portfolios": [],
              "deliveries": [],
              "deals": [],
              "reviews": [],
              "skills": {
                "communicationSkill": broker.skills!.communicationSkill,
                "brokingSkill": broker.skills!.brokingSkill,
                "workDone": broker.skills!.workDone,
                "workInProgress": broker.skills!.workInProgress?.toDouble(),
                //  "about": broker.skills!.about.toString(),
              },
              "about":broker.about,
              "categoryId":broker.categoryId,
             
             "category": {
                    "categoryId": broker.category!.categoryId?.toInt(),
                    "catigoryName":"",
             },
              // "category": {
              //   // "categoryId"
              //   // "catigoryName": broker.category!.catigory
              //   // "categoryId": 2,
              //   "catigoryName": "Bussiness1  Broker"
              // },
              "user": {
                "fullName": broker.user!.fullName,
                "email": "Someone@gmail.com",
                "password": broker.user!.password,
                "phone": broker.user!.phone,
                // "address": "Ethiopia/Dessie",
                "picture": "dentificationCard/image_picker846259987.jpg",
                "city": broker.user!.city,
                "subcity": broker.user!.subCity,
                "kebele": broker.user!.kebele,
                "sex": broker.user!.sex,
                "identificationCard":
                    "dentificationCard/image_picker846259987.jpg",
                "role": broker.user!.role,
                "buys": null,
                "latitude": broker.user!.latitude,
                "longtiude": broker.user!.longitude
              }
            }));
        if (response.statusCode == 200) {
          return true;
        } else {
          print(response.body);
          print("Picture path: ${picturePath} Identification path:  ${idPath}   and about done is ${broker.about}");
          throw Exception('Failed to load courses');
        }
      } catch (e) {
        
        print("Error occured: $e");
      }
    } catch (e) {
      print("Exception throuwn $e");
    }
    return false;
  }

// delete Broker
  Future<bool> deleteBrokerEvent(int id) async {
    initState();
    try {
      final url = Uri.parse('$_baseUrl/$id');
      final response = await http.delete(
        url,
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to Delete Broker');
      }
    } catch (e) {
      print("Exception throuwn $e");
    }
    return false;
  }

// Update Broker
  Future<Broker> updateBroker(Broker broker, bool status) async {
    initState();
    try {
      final url = Uri.parse('$_baseUrl/${broker.brokerId}');
      final _response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(
          {
            "brokerId": broker.brokerId,
            "portfolio": broker.portfolios,
            "delivery": broker.delivery,
            "deals": broker.deals,
            "review": broker.reviews,
            "sales": [],
            "skills": broker.skills,
            "categoryId": broker.category!.categoryId,
            "category": {
              "categoryId": broker.category!.categoryId,
              "catigoryName": broker.category!.catigoryName,
            },
            "approved": status,
            "about": null,
            "user": broker.user!.toJson()
          },
        ),
      );
      if (_response.statusCode == 200) {
        return Broker.fromJson(jsonDecode(_response.body));
      } else {
        throw Exception(_response.body);
      }
    } catch (e) {
      throw Exception("Something went wrong");
    }
  }

// update broker profile
  Future<Broker> updateBrokerProfile(Broker broker, bool imageChanged) async {
    initState();
    try {
      if (!imageChanged) {
        final url = Uri.parse('$_baseUrl/${broker.brokerId}');
        final _response = await http.put(
          url,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(
            {
              "brokerId": broker.brokerId,
              "portfolio": broker.portfolios,
              "delivery": broker.delivery,
              "deals": broker.deals,
              "review": broker.reviews,
              "sales": [],
              "skills": broker.skills,
              "categoryId": broker.category!.categoryId,
              "category": {
                "categoryId": broker.category!.categoryId,
                "catigoryName": broker.category!.catigoryName,
              },
              "approved": broker.approved,
              "about": null,
              "user": broker.user!.toJson()
            },
          ),
        );
        if (_response.statusCode == 200) {
          return Broker.fromJson(jsonDecode(_response.body));
        } else {
          throw Exception(_response.body);
        }
      } else {
        var request = http.MultipartRequest(
            'POST', Uri.parse('${Ip.ip}/api/users/uploadfileg'));

        request.files.add(await http.MultipartFile.fromPath(
            'file', broker.user!.picture as String));

        var res = await http.Response.fromStream(await request.send());
        if (res.statusCode == 200) {
          final url = Uri.parse('${Ip.ip}/api/brokers/${broker.brokerId}');
          final _response = await http.put(
            url,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            },
            body: jsonEncode(
              {
                "brokerId": broker.brokerId,
                "portfolio": broker.portfolios,
                "delivery": broker.delivery,
                "deals": broker.deals,
                "review": broker.reviews,
                "sales": [],
                "skills": broker.skills,
                "categoryId": broker.category!.categoryId,
                "category": {
                  "categoryId": broker.category!.categoryId,
                  "catigoryName": broker.category!.catigoryName,
                },
                "approved": broker.approved,
                "about": null,
                "user": {
                  "userId": broker.user!.userId,
                  "fullName": broker.user!.fullName,
                  "email": broker.user!.password,
                  "password": broker.user!.password,
                  "phone": broker.user!.phone,
                  "city": broker.user!.city,
                  "subcity": broker.user!.subCity,
                  "kebele": broker.user!.kebele,
                  "picture": res.body.toString(),
                  "identificationCard": null,
                  "sex": broker.user!.sex,
                  "role": broker.user!.role,
                  "buys": null
                }
              },
            ),
          );

          if (_response.statusCode == 200) {
            return Broker.fromJson(jsonDecode(_response.body));
          } else {
            throw Exception(_response.body);
          }
        } else {
          throw Exception(res.body);
        }
      }
    } catch (e) {
      throw Exception("Something went wrong");
    }
  }
}
