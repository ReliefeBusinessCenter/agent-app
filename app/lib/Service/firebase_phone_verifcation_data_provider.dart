import 'package:app/screens/PhoneVerification/otp_code_entring_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum PhoneVerificationStatus {
  verified,
  unverified,
}

enum VerificationType { register, reset }

class PhoneVerificationDataProvider {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // PhoneVerificationDataProvider({required this.firebaseAuth});
  String verificationID = '';

  Future<String> verifyPhone(String phoneNumber, BuildContext context,
      String routeName, VerificationType verificationType) async {
    print("============================Verifying user phone number");
    try {
      if (verificationType == VerificationType.register) {
        //  if (firebaseAuth.currentUser == null) {
        await firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential authCredential) async {
            debugPrint("verification completed${authCredential.smsCode}");
            User? user = FirebaseAuth.instance.currentUser;

            if (authCredential.smsCode != null) {
              try {
                await user!.linkWithCredential(authCredential);
              } on FirebaseAuthException catch (e) {
                if (e.code == 'provider-already-linked') {
                  await siginInWithCredential(authCredential, context, "/");
                }
              }
            }
          },
          verificationFailed: _onVerificationFailed,
          codeSent: (String verificationId, int? forceResendingToken) {
            print(
                "=========================================================================++Code sent==========================");
            verificationID = verificationId;
            PhoneArgument phoneArgument = PhoneArgument(
                phone: phoneNumber,
                verificationID: verificationId,
                routeName: routeName);
            Navigator.of(context).pushNamed(PhoneVerificationPage.routeName,
                arguments: phoneArgument);
          },
          codeAutoRetrievalTimeout: _onCodeAutoRetrievalTimeout,
        );
        return verificationID;
        // } else {
        //   throw FirebaseException(
        //       plugin: "al-ready-existed", message: "Already existed");
        // }
      } else {
        await firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential authCredential) async {
            debugPrint("verification completed${authCredential.smsCode}");
            User? user = FirebaseAuth.instance.currentUser;

            if (authCredential.smsCode != null) {
              try {
                await user!.linkWithCredential(authCredential);
              } on FirebaseAuthException catch (e) {
                if (e.code == 'provider-already-linked') {
                  await siginInWithCredential(authCredential, context, "/");
                }
              }
            }
          },
          verificationFailed: _onVerificationFailed,
          codeSent: (String verificationId, int? forceResendingToken) {
            print(
                "=========================================================================++Code sent==========================");
            verificationID = verificationId;
            PhoneArgument phoneArgument = PhoneArgument(
                phone: phoneNumber,
                verificationID: verificationId,
                routeName: routeName);
            Navigator.of(context).pushNamed(PhoneVerificationPage.routeName,
                arguments: phoneArgument);
          },
          codeAutoRetrievalTimeout: _onCodeAutoRetrievalTimeout,
        );
        return verificationID;
      }
    } on FirebaseAuthException catch (e) {
      String message = getMessageFromErrorCode(e.code);
      throw Exception(message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<PhoneVerificationStatus> siginInWithCredential(
      PhoneAuthCredential phoneAuthCredential,
      BuildContext context,
      String routeName) async {
    print("ARGUMENTS: ${phoneAuthCredential.smsCode}");
    try {
      PhoneVerificationStatus _status = PhoneVerificationStatus.unverified;

      final AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: phoneAuthCredential.verificationId.toString(),
          smsCode: phoneAuthCredential.smsCode.toString());

      final UserCredential user =
          (await firebaseAuth.signInWithCredential(credential));

      print("User Credentials: ${user}");
      // await firebaseAuth.signInWithCredential(credential).then((value) {
      //   print("Value : ${value}");
      //   if (value.user != null) {
      //     Navigator.of(context).pushNamed(routeName, arguments: "");
      //   }
      // });
      return _status;
    } catch (e) {
      debugPrint("Error on resp: $e");
      if (e.toString().toLowerCase().contains("auth credential is invalid")) {
      } else {
        print('Error');
      }
      throw Exception(e.toString());
    }
  }

  _onVerificationFailed(FirebaseAuthException exception) {
    String message = getMessageFromErrorCode(exception.code);
    debugPrint("Failed Exception: ${exception}");
    throw Exception(message);
  }

  _onCodeAutoRetrievalTimeout(String timeout) {
    return null;
  }

  Future signout() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      debugPrint("someting happened");
    }
  }

  String getMessageFromErrorCode(String errorCode) {
    switch (errorCode) {
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        return "Email already used. Go to login page.";
      case "wrong-password":
        return "Wrong email/password combination.";
      case "user-not-found":
        return "No user found with this email.";
      case "user-disabled":
        return "User disabled.";
      case "too-many-requests":
        return "Too many requests to log into this account.";
      case "invalid-email":
        return "Email address is invalid.";
      default:
        return "Login failed. Please try again.";
    }
  }
}
