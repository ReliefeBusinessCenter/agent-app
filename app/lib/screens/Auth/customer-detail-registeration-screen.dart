import 'package:app/Widget/Auth/signup/register-button.dart';
import 'package:app/Widget/Auth/signup/upload_id_image.dart';
import 'package:app/Widget/Auth/signup/upload_profile_image.dart';
import 'package:app/Widget/common/constants.dart';
import 'package:app/bloc/register/bloc/register_bloc.dart';
import 'package:app/constants/constants.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:file/file.dart';
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
  final TextEditingController idController = new TextEditingController();
  final ImagePicker _picker = ImagePicker();
  late PickedFile _imageFile;
  late PickedFile _idImaage;

  late RegisterBloc registerBloc;

  bool _passwordObscured = true;
  bool _confirmObscured = true;

  bool _choose = false;
  @override
  Widget build(BuildContext context) {
    registerBloc = BlocProvider.of<RegisterBloc>(context);
    return Scaffold(
      backgroundColor: lightColor,
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
                      child: Column(
                        children: [
                          Container(
                            // alignment: Alignment.topCenter,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.05,

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
                                  top:
                                      MediaQuery.of(context).size.height * 0.02,
                                  left:
                                      MediaQuery.of(context).size.width * 0.05),
                              child: Text(
                                "Password and Profile Picture",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.7,
                            padding:
                                EdgeInsets.only(left: 0.5, right: 0.5, top: 25),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  TextFormField(
                                    obscureText: _passwordObscured,
                                    decoration: inputDecoration.copyWith(
                                      labelText: "Password",
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _passwordObscured =
                                                !_passwordObscured;
                                          });
                                        },
                                        icon: Icon(
                                          _passwordObscured
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                      ),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        passwordController.text = value;
                                      });
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Field Required";
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  TextFormField(
                                    obscureText: _confirmObscured,
                                    onChanged: (value) {
                                      registerBloc.add(
                                        AddPassword(password: value),
                                      );
                                    },
                                    validator: (value) {
                                      if (value != passwordController.text) {
                                        return "Password don't match";
                                      }
                                    },
                                    decoration: inputDecoration.copyWith(
                                      labelText: "Confirm password",
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _confirmObscured =
                                                !_confirmObscured;
                                          });
                                        },
                                        icon: Icon(
                                          _confirmObscured
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  Text(
                                    "Profile Photo",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Center(
                                    child:
                                        UploadProfileImage(pickImage: (image) {
                                      setState(() {
                                        photoController.text = image.path;
                                        registerBloc.add(AddImage(
                                            image: photoController.text));
                                      });
                                      registerBloc.add(AddImage(
                                          image: photoController.text));
                                    }),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "ID Photo",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Center(
                                    child: UploadIDImage(pickImage: (image) {}),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  if (photoController.text.isEmpty && _choose)
                                    Text(
                                      "Please choose image",
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: RegisterButton(
                              name: "Register",
                              onTapped: () {
                                setState(() {
                                  _choose = true;
                                });
                                if (_formKey.currentState!.validate() &&
                                    photoController.text.isNotEmpty) {
                                  print(
                                      "Register method called from the customer apage");
                                  // registerBloc
                                  //     .add(RegisterUser());
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
