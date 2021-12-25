import 'dart:async';

import 'package:app/Widget/common/phone_verification_custome_button.dart';
import 'package:app/Widget/common/phone_verification_did_not_reveive.dart';
import 'package:app/Widget/common/phone_verification_enter_code_text.dart';
import 'package:app/Widget/common/phone_verification_enter_phone.dart';
import 'package:app/bloc/bloc/phoneverification_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class PhoneArgument {
  String routeName;
  String verificationID;
  String phone;
  PhoneArgument({
    required this.phone,
    required this.routeName,
    required this.verificationID,
  });
}

class PhoneVerification extends StatefulWidget {
  static const routeName = '/mvvp/phoneverification';
  final PhoneArgument phoneArgument;
  const PhoneVerification(this.phoneArgument, {Key? key}) : super(key: key);

  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  TextEditingController otpController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  _pleaseFillAllCell() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Text(
        hasError ? "*Please fill up all the cells properly" : "",
        style: const TextStyle(
            color: Colors.red, fontSize: 12, fontWeight: FontWeight.w400),
      ),
    );
  }

  late PhoneverificationBloc phoneverificationBloc;

  _onPressed() async {
    formKey.currentState!.validate();
    // conditions for validating
    if (currentText.length != 6) {
      errorController!
          .add(ErrorAnimationType.shake); // Triggering error shake animation
      setState(() => hasError = true);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    phoneverificationBloc = BlocProvider.of<PhoneverificationBloc>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: BlocConsumer<PhoneverificationBloc, PhoneverificationState>(
          listener: (context, state) {
        // if (state is PhoneVerificationError) {
        //   showDialog(
        //       context: context,
        //       builder: (context) => Center(
        //             child: Text("Error"),
        //           ));
        // } else if (state is PhoneVerificationLoading) {
        //   showDialog(
        //       context: context,
        //       builder: (context) => Center(
        //             child: CircularProgressIndicator(),
        //           ));
        // }
      }, builder: (context, state) {
        return GestureDetector(
          onTap: () {},
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: ListView(
              children: <Widget>[
                const SizedBox(height: 30),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child:
                        Image.asset("assets/images/phone_image_verified.png"),
                  ),
                ),
                const SizedBox(height: 8),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Phone Number Verification',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                ),
                EnterCodeText(phone: widget.phoneArgument.phone),
                const SizedBox(
                  height: 20,
                ),
                EnterCodeField(
                  errorController: errorController,
                  formKey: formKey,
                  onChanged: (value) {
                    debugPrint(value);
                    setState(() {
                      currentText = value;
                    });
                  },
                  otpController: otpController,
                ),
                const SizedBox(
                  height: 20,
                ),
              if(phoneverificationBloc.state is PhoneVerificationError)
                Center(
                  child: Text(
                      'invalid otp',
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
                _pleaseFillAllCell(),
                DidnotReceiveCode(
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 14,
                ),
                CustomeButton(
                    child:
                        phoneverificationBloc.state is PhoneVerificationLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                "VERIFY",
                                style: TextStyle(color: Colors.white),
                              ),
                    onPressed: () {
                      if (currentText.length != 6) {
                        errorController!.add(ErrorAnimationType
                            .shake); // Triggering error shake animation
                        setState(() => hasError = true); 
                      } else {
                        print(
                            "the verification Id is ${widget.phoneArgument.verificationID}");
                        phoneverificationBloc.add(
                          SigninWithCredential(
                            context: context,
                            routeName: widget.phoneArgument.routeName ,
                            credential: PhoneAuthProvider.credential(
                                verificationId:
                                    widget.phoneArgument.verificationID,
                                  
                                smsCode: otpController.text),
                          ),
                        );
                      }
                    }),
              ],
            ),
          ),
        );
      }),
    );
  }
}
