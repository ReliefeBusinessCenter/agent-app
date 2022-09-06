import 'dart:async';
import 'package:app/screens/PhoneVerification/otp_code_entring_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sms_autofill/sms_autofill.dart';

class GoIn extends StatefulWidget {
  static const routeName = '/go_in';
  const GoIn({Key? key}) : super(key: key);

  @override
  State<GoIn> createState() => _GoInState();
}

class _GoInState extends State<GoIn> {
  bool isLoading = false;
  StreamController<ErrorAnimationType>? errorController;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _smsController = TextEditingController();
  String? _verificationId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    errorController = StreamController<ErrorAnimationType>();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    errorController!.close();
  }

  @override
  Widget build(BuildContext context) {
    final SmsAutoFill _autoFill = SmsAutoFill();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Phone Verification'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: _phoneNumberController,
              decoration: const InputDecoration(
                  labelText: 'Phone number (09..........)'),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            alignment: Alignment.center,
            child: ElevatedButton(
              // color: Theme.of(context).primaryColor,
              child: isLoading
                  ? CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      "Send Code",
                      style: TextStyle(color: Colors.white),
                    ),
              onPressed: () async {
                verifyPhoneNumber();
              },
            ),
          ),
        ],
      ),
    );
  }

  void signInWithPhoneNumber() async {
    try {
      if (_verificationId == null) return;
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId.toString(),
        smsCode: _smsController.text,
      );

      final UserCredential user =
          (await _auth.signInWithCredential(credential));

      // showSnackbar("Successfully signed in UID: ${user.user?.uid}");
    } catch (e) {
      _scaffoldKey.currentState?.showBottomSheet((context) => Container(
            child: Text("$e"),
          ));
      // showSnackbar("Failed to sign in: " + e.toString());
    }
  }

  void verifyPhoneNumber() async {
    print("Phone Number: ${_phoneNumberController.text.substring(1)}");
    //Callback for when the user has already previously signed in with this phone number on this device
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      await _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        isLoading = false;
      });
      showSnackbar(
          "Phone number automatically verified and user signed in: ${_auth.currentUser?.uid}");
    };

    //Listens for errors with verification, such as too many attempts

    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      setState(() {
        isLoading = false;
      });
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: "Phone number verification failed.",
        desc: authException.message,
        btnOkOnPress: () {
          // Navigator.pop(context);
        },
      )..show();
    };
    //Callback for when the code is senft
    PhoneCodeSent codeSent =
        (String verificationId, int? forceResendingToken) async {
      showSnackbar('Please check your phone for the verification code.');

//
      _verificationId = verificationId;
      setState(() {
        isLoading = false;
      });

      Navigator.pushNamed(context, PhoneVerificationPage.routeName,
          arguments: PhoneArgument(
              phone: '+251${_phoneNumberController.text.substring(1)}',
              routeName: GoIn.routeName,
              verificationID: _verificationId.toString()));
    };
    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      showSnackbar("verification code: " + verificationId);
      _verificationId = verificationId;
    };
    try {
      setState(() {
        isLoading = true;
      });
      await _auth.verifyPhoneNumber(
          phoneNumber: '+251${_phoneNumberController.text.substring(1)}',
          timeout: const Duration(seconds: 5),
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      _scaffoldKey.currentState?.showBottomSheet((context) => Container(
            child: Text("${e}"),
          ));
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: "Failed to Verify Phone Number",
        desc: e.toString(),
        btnOkOnPress: () {},
      )..show();
    }
  }

  void showSnackbar(String message) {
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
