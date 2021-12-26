import 'package:app/data_provider/firebase_phone_verifcation_data_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneVerificationRepository {
  final PhoneVerificationDataProvider dataProvider;
  PhoneVerificationRepository({required this.dataProvider});

  Future<String> verifyPhone(String phoneNumber, BuildContext context, String routeName, VerificationType verificationType) async {
    return await dataProvider.verifyPhone(phoneNumber, context, routeName, verificationType);
  }

  Future<PhoneVerificationStatus> siginInWithCredential(
      PhoneAuthCredential phoneAuthCredential, BuildContext context, String routeName) async {
    return await dataProvider.siginInWithCredential(phoneAuthCredential, context, routeName);
  }

  Future signout() async {
    return await dataProvider.signout();
  }
}
