import 'dart:convert';

import 'package:app/model/save_loan.dart';
import 'package:http/http.dart' as http;

class SaveLoanDataProvider {
  final http.Client httpClient;
  final _baseURL = 'http://broker-service-api.herokuapp.com/api/saveloan';
  SaveLoanDataProvider({
    required this.httpClient,
  });

  // create save and loan
  Future<SaveLoan> createSaveLoan(SaveLoan saveLoan) async {
    try {
      final _response = await httpClient.post(
        Uri.parse(_baseURL),
        headers: {},
        body: jsonEncode(saveLoan.toJson()),
      );

      if (_response.statusCode == 200) {
        return SaveLoan.fromJson(
          jsonDecode(_response.body),
        );
      } else {
        throw Exception(_response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
