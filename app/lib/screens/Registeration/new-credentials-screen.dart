import 'package:app/Widget/Auth/auth-export.dart';
import 'package:app/bloc/user/bloc/user_bloc.dart';
import 'package:app/model/broker/user.dart';
import 'package:app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewCredentialsScreen extends StatefulWidget {
  static String routeName = "/verification";

  @override
  State<NewCredentialsScreen> createState() => _NewCredentialsScreenState();
}

class _NewCredentialsScreenState extends State<NewCredentialsScreen> {
  final _formKey = GlobalKey<FormState>();
  String _password = "";
  String _confirmPassword = "";

  bool _showNewPassword = false;
  bool _showConfirmPassword = false;
  late User _user;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double height = screenSize.height;
    double width = screenSize.width;
    double fontSize1 = height * 0.04;

    final UserBloc _userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
        child: BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {
            if (state is UserLoading) {
              showDialog(
                context: context,
                builder: (context) => Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is UserSuccess) {
              if (state.data is User) {
                _user = state.data;
              }
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(Login.routeName, (route) => false);
            } else if (state is UserError) {
              Navigator.of(context).pop();
            }
          },
          builder: (context, state) {
            return Container(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Welcome(),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    NewCredentialText(),
                    SizedBox(
                      height: height * 0.06,
                    ),
                    Material(
                      color: Colors.white,
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      child: Container(
                        width: width,
                        child: TextFormField(
                          onSaved: (value) {
                            setState(() {
                              _password = value!;
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Passoword Required!";
                            }
                          },
                          // controller: emailController,
                          obscureText: _showNewPassword,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 14),
                              prefixIcon: Icon(Icons.phone),
                              border: InputBorder.none,
                              hintText: "Enter new password",
                              suffixIcon: IconButton(
                                icon: Icon(_showNewPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _showNewPassword = !_showNewPassword;
                                  });
                                },
                              )),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Material(
                      color: Colors.white,
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      child: Container(
                        width: width,
                        child: TextFormField(
                          onSaved: (value) {
                            setState(() {
                              _confirmPassword = value!;
                            });
                          },
                          validator: (value) {
                            if (value != _password) {
                              return "Password don't match";
                            }
                          },
                          // controller: emailController,
                          obscureText: _showConfirmPassword,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 14),
                              prefixIcon: Icon(Icons.phone),
                              border: InputBorder.none,
                              hintText: "Confirm Passoword",
                              suffixIcon: IconButton(
                                icon: Icon(_showConfirmPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _showConfirmPassword =
                                        !_showConfirmPassword;
                                  });
                                },
                              )),
                        ),
                      ),
                    ),
                    if (state is UserError)
                      Text(
                        state.error,
                        style: TextStyle(color: Colors.red),
                      ),
                    SizedBox(
                      height: height * 0.06,
                    ),
                    UpdateButton(
                      onPressed: () {
                        _formKey.currentState!.save();
                        if (_formKey.currentState!.validate()) {
                          print("The password is function");
                          print(_password);
                          if (state is UserSuccess) {
                            if (state.data is User) {
                              User _user = state.data;
                              print("The user passowrd is ${_user.password}");
                              _user.password = _password;
                              print(
                                  "The user updated password is ${_user.password}");
                              _userBloc.add(UpdateUser(user: _user));
                            }
                          }
                        }
                      },
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
