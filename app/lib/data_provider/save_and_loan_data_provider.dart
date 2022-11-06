import 'dart:convert';

import 'package:app/ip/ip.dart';
import 'package:app/model/save_loan.dart';
import 'package:http/http.dart' as http;

class SaveLoanDataProvider {
  final http.Client httpClient;
  final _baseURL = 'http://broker-service-api.herokuapp.com/api/saving';
  SaveLoanDataProvider({
    required this.httpClient,
  });

  // fetch saveloan
  Future<List<SaveLoan>> getAllSaveLoans() async {
    try {
      final _response = await httpClient.get(Uri.parse(_baseURL));
      print("Saveloan save status ${_response.statusCode}");

      if (_response.statusCode == 200) {
        final _jsonResponse = jsonDecode(_response.body) as List;
        return _jsonResponse
            .map((savelon) => SaveLoan.fromJson(savelon))
            .toList();
      } else {
        throw Exception(_response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // create save and loan
  Future<SaveLoan> createSaveLoan(SaveLoan saveLoan, bool isProfileImageChanged,
      bool isIdImageChanged) async {
    print(
        "###############################is ProfileChanged $isProfileImageChanged");
    print("###############################is IdImage $isIdImageChanged");
    try {
      if (!isProfileImageChanged && !isIdImageChanged) {
        print("###############################is--- 1");
        final _response = await httpClient.post(
          Uri.parse(_baseURL),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            // 'Authorization': 'Bearer $token',
          },
          body: jsonEncode(saveLoan.toJson()),
        );

        if (_response.statusCode == 200) {
          return SaveLoan.fromJson(
            jsonDecode(_response.body),
          );
        } else {
          print("The error is ${_response.body}");
          throw Exception(_response.body);
        }
      } else if (isProfileImageChanged && !isIdImageChanged) {
                print("###############################is--- 2");

        print("Profile image is changed");
        var request = http.MultipartRequest(
            'POST', Uri.parse('${Ip.ip}/api/users/uploadfileg'));
        print("request");

        request.files.add(await http.MultipartFile.fromPath(
            'file', saveLoan.picture as String));
        print("added to multipart");

        var res = await http.Response.fromStream(await request.send());

        if (res.statusCode == 200) {
          final _response = await httpClient.post(
            Uri.parse(_baseURL),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              // 'Authorization': 'Bearer $token',
            },
            body: jsonEncode({
              'fullName': saveLoan.fullName,
              "phone": saveLoan.phone,
              "picture": res.body.toString(),
              "identificationCard": saveLoan.identificationCard
            }),
          );

          if (_response.statusCode == 200) {
            return SaveLoan.fromJson(
              jsonDecode(_response.body),
            );
          } else {
            throw Exception(_response.body);
          }
        } else {
          print("The error is ${res.body}");
          throw Exception(res.body);
        }
      } else if (!isProfileImageChanged && isIdImageChanged) {
                print("###############################is--- 3");

        var requestId = http.MultipartRequest(
            'POST', Uri.parse('${Ip.ip}/api/users/uploadfileg'));
        print("request");
        requestId.files.add(await http.MultipartFile.fromPath(
            'file', saveLoan.identificationCard as String));
        print("added to multipart");
        var resId = await http.Response.fromStream(await requestId.send());
        if (resId.statusCode == 200) {
          final _response = await httpClient.post(
            Uri.parse(_baseURL),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              // 'Authorization': 'Bearer $token',
            },
            body: jsonEncode({
              'fullName': saveLoan.fullName,
              "phone": saveLoan.phone,
              "picture": saveLoan.picture,
              "identificationCard": resId.body.toString()
            }),
          );

          if (_response.statusCode == 200) {
            return SaveLoan.fromJson(
              jsonDecode(_response.body),
            );
          } else {
            throw Exception(_response.body);
          }
        } else {
          print("The error is ${resId.body}");
          throw Exception(resId.body);
        }
      }
              print("###############################is--- 3");

      var request = http.MultipartRequest(
          'POST', Uri.parse('${Ip.ip}/api/users/uploadfileg'));
      var request2 = http.MultipartRequest(
          'POST', Uri.parse('${Ip.ip}/api/users/uploadfileg'));

      print("request");

      request.files.add(await http.MultipartFile.fromPath(
          'file', saveLoan.picture as String));
      print("added profile image");

      var res = await http.Response.fromStream(await request.send());

      print("request");

      request2.files.add(await http.MultipartFile.fromPath(
          'file', saveLoan.identificationCard as String));
      print("added Identification card");

      var resId = await http.Response.fromStream(await request2.send());

      if (res.statusCode == 200 && resId.statusCode == 200) {
        final _response = await httpClient.post(
          Uri.parse(_baseURL),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            // 'Authorization': 'Bearer $token',
          },
          body: jsonEncode({
            'fullName': saveLoan.fullName,
            "phone": saveLoan.phone,
            "picture": res.body.toString(),
            "identificationCard": resId.body.toString()
          }),
        );

        if (_response.statusCode == 200) {
          return SaveLoan.fromJson(
            jsonDecode(_response.body),
          );
        } else {
          print("The error is ${_response.body}");
          throw Exception(_response.body);
        }
      } else {
        print("The error is ${res.body}");
        throw Exception(res.body);
      }
    } catch (e) {
      print("finnal Error is ${e.toString()}");
      throw Exception(e.toString());
    }
  }
}
