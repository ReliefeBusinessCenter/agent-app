import 'package:app/Widget/Auth/Common/CustomeLoginTextField.dart';
import 'package:app/Widget/Auth/Common/custom_textfield.dart';
import 'package:app/Widget/Auth/Common/welcome.dart';
import 'package:app/Widget/Auth/login/forgot_password.dart';
import 'package:app/Widget/Auth/login/login_button.dart';
import 'package:app/Widget/Auth/login/login_text.dart';
import 'package:app/Widget/Auth/signup/signup.dart';
import 'package:app/bloc/auth/bloc/auth_bloc.dart';
import 'package:app/model/login_info.dart';
import 'package:app/model/user.dart';
import 'package:app/preferences/user_preference_data.dart';
import 'package:app/screens/admin/admin_main_page.dart';
import 'package:app/screens/broker/broker_main_page.dart';
import 'package:app/screens/customer/customerPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  static String routeName = "/login";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  bool _isObscured = true;

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  void forgotPasswordHandler(BuildContext context) {
    // Navigator.of(context).pushNamed(SendOtpScreen.routeName);
  }

  void loginHandler() {
    print("Login button have clicked");
    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    print("-----");
    print(isValid);
    late LoginInfo info = new LoginInfo(
      emailController.text.toString(),
      passwordController.text.toString(),
    );

    LoginEvent loginEvent = new LoginEvent(user: info);
    BlocProvider.of<AuthBloc>(context).add(loginEvent);
  }

  // void callFetchEvents() {
  //   FetchClientsEvent fetchClientsEvent = new FetchClientsEvent(loadMore: true);
  //   BlocProvider.of<ClientsBloc>(context, listen: false).add(fetchClientsEvent);

  //   FeatchCustomDebtEvent fetchCustomDebtEvent = new FeatchCustomDebtEvent();
  //   BlocProvider.of<CustomDebtBloc>(context, listen: false)
  //       .add(fetchCustomDebtEvent);

  //   FeatchCollectionEvent fetchCollectionEvent = new FeatchCollectionEvent();
  //   BlocProvider.of<CollectionBloc>(context, listen: false)
  //       .add(fetchCollectionEvent);

  //   FeatchSalesReportEvent featchSalesReportEvent =
  //       new FeatchSalesReportEvent();
  //   BlocProvider.of<SalesReportBloc>(context, listen: false)
  //       .add(featchSalesReportEvent);

  //   FeatcAllorderrEvent fetchAllordersEvent = new FeatcAllorderrEvent();
  //   BlocProvider.of<AllorderrBloc>(context, listen: false)
  //       .add(fetchAllordersEvent);
  // }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double height = screenSize.height;
    double width = screenSize.width;
    double fontSize1 = height * 0.04;

    return Material(
      child: Container(
        color: Theme.of(context).accentColor,
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              // if (state.user.user!.role == "Broker") {
              //   Navigator.of(context)
              //       .pushReplacementNamed(BrokerMain.routeName);
              // } else {
              //   Navigator.of(context)
              //       .pushReplacementNamed(CustomerPage.routeName);
              // }
               Navigator.of(context)
                  .pushReplacementNamed(AdminMainPage.routeName);
              // callFetchEvents();

            }
          },
          builder: (context, state) {
            Widget label;
            if (state is LoginFailedState) {
              label = Container(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Failed to Authenticate',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            } else if (state is LoggingState) {
              label = Center(
                child: Container(
                  height: 20.0,
                  width: 20.0,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            } else {
              label = SizedBox();
            }
            return Form(
              key: formKey, //key for form

              child: Scaffold(
                backgroundColor: Theme.of(context).accentColor,
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Welcome(),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      LoginText(),
                      label,
                      SizedBox(
                        height: height * 0.06,
                      ),
                      CustomLoginTextField(
                        // isObsecure: false,
                        textFieldName: 'Email',
                        controller: emailController,
                        icon: Icons.email,
                        validator: (value) {
                          if (value.isEmpty ||
                              !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                  .hasMatch(value)) {
                            return "Enter Correct Email Address";
                          } else {
                            return null;
                          }
                        },
                        obsecureText: false,
                      ),
                      SizedBox(height: height * 0.01),
                      CustomLoginTextField(
                       
                        textFieldName: 'Password',
                        controller: passwordController,
                        icon: Icons.lock,
                        validator: (value) {
                          if (value.isEmpty || value.toString().length < 5) {
                            return "Password Too Short";
                          } else {
                            return null;
                          }
                        },
                        
                        obsecureText: _isObscured,
                      ),
                      SizedBox(
                        height: height * 0.06,
                      ),
                      LoginButton(
                        onPressed: loginHandler,
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      // ResetPasswordOption(
                      //     // onPressed: () => forgotPasswordHandler(context),
                      //     ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      SignUp(
                          // onPressed: () => forgotPasswordHandler(context),
                          ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                    ],
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

void Navigate(BuildContext context) {
  print('pressed');
}
