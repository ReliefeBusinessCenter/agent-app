import 'dart:io';

import 'package:app/Widget/Auth/signup/add_profile_picture.dart';
import 'package:app/Widget/Auth/signup/signUpTextField.dart';
import 'package:app/Widget/Auth/signup/register-button.dart';
import 'package:app/bloc/register/bloc/register_bloc.dart';
import 'package:app/screens/Auth/signUp_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:file/file.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:image_picker/image_picker.dart';
import 'login.dart';

class CustomerDetailScreen extends StatefulWidget {
  static const routeName = '/customer-detail';

  @override
  _CustomerDetailScreenState createState() => _CustomerDetailScreenState();
}

class _CustomerDetailScreenState extends State<CustomerDetailScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = new TextEditingController();

  final TextEditingController confirmPasswordController =
      new TextEditingController();

  final TextEditingController photoController = new TextEditingController();
  final ImagePicker _picker = ImagePicker();
  late PickedFile _imageFile;

  late RegisterBloc registerBloc;

  void uploadPhotoHandler() async {
    // FilePickerResult? result = await FilePicker.platform.pickFiles();
    // if (result != null) {
    //   File file = File(result.files.single.path!);
    //   setState(() {
    //     photoController.text = file.path;
    //   });
    // } else {
    //   // User canceled the picker
    // }

    // print("Uploaded File Image: ${photoController.text}");
    // registerBloc.add(AddImage(image: photoController.text));
    // PickedFile _imageFile;

    try {
      final pickedFile = await _picker.getImage(source: ImageSource.gallery);
      setState(() {
        _imageFile = pickedFile!;
        photoController.text = _imageFile.path;
      });
      print("Uploaded File Image: ${photoController.text}");
      registerBloc.add(AddImage(image: photoController.text));
    } catch (e) {
      print("Image picker error " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    registerBloc = BlocProvider.of<RegisterBloc>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text("Password registeration!"),
        ),
        body: ProgressHUD(
          child: BlocConsumer<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if (state is RegisterCreateLoading) {
                final progress = ProgressHUD.of(context);
                // if (!isShowing) {
                //   if (progress != null) {
                //     setState(() {
                //       isShowing = true;
                //     });

                // }
                progress!.showWithText("Creating");
              } else if (state is RegisterCreateSuccess) {
                // this.isShowing = false;
                registerBloc.add(Initialization());
                Navigator.popAndPushNamed(context, Login.routeName);
                // return Container(child: Text("Created Successfully"));
              } else if (state is RegisterCreateFailed) {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.ERROR,
                  animType: AnimType.BOTTOMSLIDE,
                  title: 'Order Creating failed',
                  desc: 'Fill all the information carefully!',
                  // btnCancelOnPress: () {
                  //   Navigator.popAndPushNamed(context, Login.routeName);
                  // },
                  btnOkOnPress: () {
                    // Navigator.pop(context);
                    // Navigator.pop()
                    Navigator.popAndPushNamed(context, Login.routeName);
                    registerBloc.add(Initialization());
                  },
                )..show();
              }
            },
            builder: (context, state) {
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                      elevation: 1,
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                          height: MediaQuery.of(context).size.height,
                          // padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Form(
                                  key: _formKey,
                                  child: Column(children: [
                                    Container(
                                      // alignment: Alignment.topCenter,
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,

                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular((30)),
                                            topRight: Radius.circular((30))),
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.1),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05),
                                        child: Text(
                                          "Password and Profile Picture",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.7,
                                        padding: EdgeInsets.only(
                                            left: 0.5, right: 0.5, top: 25),
                                        child: SingleChildScrollView(
                                            child: Column(children: [
                                          CustomTextField(
                                            minLength: 0,
                                            textFieldName: 'Password',
                                            keyboardType: TextInputType.text,
                                            enabled: true,
                                            controller: passwordController,
                                            initialValue: '',
                                            validator: null,
                                            obsecureText: true,
                                            isRequired: false,
                                            onChanged: (String value) {
                                              print("Write: $value");
                                              registerBloc.add(
                                                  AddPassword(password: value));
                                            },
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                          ),
                                          CustomTextField(
                                              minLength: 0,
                                              textFieldName: 'Confirm Password',
                                              keyboardType: TextInputType.text,
                                              enabled: true,
                                              controller:
                                                  confirmPasswordController,
                                              initialValue: '',
                                              validator: null,
                                              obsecureText: true,
                                              isRequired: false,
                                              onChanged: (String value) {}),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                          ),
                                          ProfileFileInput(
                                            controller: photoController,
                                            isRequired: true,
                                            onPressed: uploadPhotoHandler,
                                            textFieldName: '',
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                          ),
                                          RegisterButton(
                                            name: "Register",
                                            onTapped: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                print(
                                                    "Register method called from the customer apage");
                                                registerBloc
                                                    .add(RegisterUser());
                                              }
                                            },
                                          )
                                        ])))
                                  ]))))));
            },
          ),
        ));
  }
}
