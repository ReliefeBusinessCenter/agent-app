import 'dart:async';
import 'package:app/Widget/common/phone_verification_did_not_reveive.dart';
import 'package:app/Widget/common/phone_verification_enter_code_text.dart';
import 'package:app/Widget/common/phone_verification_enter_phone.dart';
import 'package:app/bloc/register/bloc/register_bloc.dart';
import 'package:app/bloc/user/bloc/user_bloc.dart';
import 'package:app/screens/Registeration/signUp_screen.dart';
import 'package:app/screens/login.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

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

class PhoneVerificationPage extends StatefulWidget {
  static const routeName = '/mvvp/phoneverification';
  final PhoneArgument phoneArgument;

  PhoneVerificationPage(this.phoneArgument, {Key? key}) : super(key: key);

  @override
  _PhoneVerificationPageState createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
  bool isLoading = false;
  late UserBloc userBloc;
  final FirebaseAuth _auth = FirebaseAuth.instance;
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
    userBloc = BlocProvider.of<UserBloc>(context);
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('Phone Verification'),
        ),
        backgroundColor: Colors.blue.shade50,
        body: GestureDetector(
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
                // if (phoneverificationBloc.state is PhoneVerificationError)
                //   Center(
                //     child: Text(
                //       '${state.message}',
                //       style: const TextStyle(color: Colors.amber),
                //     ),
                //   ),
                _pleaseFillAllCell(),
                DidnotReceiveCode(
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 14,
                ),
                // if(state is PhoneVerificationLoading)
                // (state is PhoneVerificationLoading)

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
                            "Verify Number",
                            style: TextStyle(color: Colors.white),
                          ),
                    onPressed: currentText.length == 6
                        ? () {
                            if (currentText.length != 6) {
                              errorController!.add(ErrorAnimationType
                                  .shake); // Triggering error shake animation
                              setState(() => hasError = true);
                            } else {
                              print(
                                  "the verification Id is ${widget.phoneArgument.verificationID}");
                              // phoneverificationBloc.add(
                              //   SigninWithCredential(
                              //     context: context,
                              //     routeName: widget.phoneArgument.routeName,
                              //     credential: PhoneAuthProvider.credential(
                              //         verificationId:
                              //            widget.phoneArgument.verificationID,
                              //         smsCode: otpController.text),
                              //   ),
                              // );

                              signInWithPhoneNumber();
                            }
                          }
                        : null,
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void signInWithPhoneNumber() async {
    try {
      setState(() {
        isLoading = true;
      });
      if (widget.phoneArgument.verificationID == null) return;
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.phoneArgument.verificationID.toString(),
        smsCode: otpController.text,
      );

      final UserCredential user =
          (await _auth.signInWithCredential(credential));

      print("Successfully signed in UID: ${user.user?.uid}");
      bool userRegistered = checkIfThisUserRegister(widget.phoneArgument.phone);
      if (userRegistered) {
        Navigator.popAndPushNamed(context, Login.routeName);
      } else {
        Navigator.popAndPushNamed(context, SignUpPageScreen.routeName, arguments: widget.phoneArgument);
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: "Failed to sign in.",
        desc: e.toString(),
        btnOkOnPress: () {},
      )..show();
    }
  }

  bool checkIfThisUserRegister(String phone) {
    userBloc.add(GetUserByPhone(phone: phone));
    bool userRegistered = false;
    BlocListener(
      listener: (context, state) => {
        if (state is UserSuccess)
          {userRegistered = true}
        else if (state is UserError)
          {userRegistered = false}
      },
    );
    return userRegistered;
  }
}
