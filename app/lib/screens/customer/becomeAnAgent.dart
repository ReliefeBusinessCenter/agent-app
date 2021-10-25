// import 'package:app/Widget/Auth/auth-export.dart';
import 'package:app/Widget/Auth/signup/broker/categories-dropdown-button.dart';
import 'package:app/Widget/Auth/signup/register-button.dart';
import 'package:app/bloc/register/bloc/register_bloc.dart';
import 'package:app/screens/Auth/customer-detail-registeration-screen.dart';
import 'package:flutter/material.dart';
import 'package:app/Widget/Auth/signup/signUpTextField.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'drawer.dart';

class BecomeAnAgent extends StatefulWidget {
  static const routeName = '/agent';

  @override
  _BecomeAnAgentState createState() => _BecomeAnAgentState();
}

class _BecomeAnAgentState extends State<BecomeAnAgent> {
  // TextEditingController fullNameController = new TextEditingController();
  // TextEditingController category = new TextEditingController();
  // TextEditingController phoneNumberController = new TextEditingController();
  // TextEditingController cityControler = new TextEditingController();
  // TextEditingController emailController = new TextEditingController();
  // TextEditingController profilePicController = new TextEditingController();
  static const routeName = '/broker-detail';
  final _formKey = GlobalKey<FormState>();
  final TextEditingController communicationController =
      new TextEditingController();
  final TextEditingController brookingSkillsController =
      new TextEditingController();
  final TextEditingController workDoneController = new TextEditingController();
  final TextEditingController workInProgressController =
      new TextEditingController();

  late RegisterBloc registerBloc;

  @override
  Widget build(BuildContext context) {
    String type = 'Broker';
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(),
      drawer: AppDrawer(),
      body: Container(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Form(
                  key: _formKey,
                  child: Column(children: [
                    Container(
                      // alignment: Alignment.topCenter,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.05,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular((30)),
                            topRight: Radius.circular((30))),
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.02,
                            left: MediaQuery.of(context).size.width * 0.05),
                        child: Text(
                          "Broker Skills Registeration!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * 0.02,
                    // ),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        padding:
                            EdgeInsets.only(left: 0.5, right: 0.5, top: 25),
                        child: SingleChildScrollView(
                            child: Column(children: [
                          CategoryDropDownButton(),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          CustomTextField(
                            minLength: 0,
                            textFieldName: 'Communication Skills',
                            controller: communicationController,
                            initialValue: '',
                            validator: null,
                            obsecureText: false,
                            isRequired: false,
                            onChanged: (String value) {
                              registerBloc.add(AddCommunicationSkills(
                                  skill: double.parse(value)));
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          CustomTextField(
                              minLength: 0,
                              textFieldName: 'Brooking Skills',
                              controller: brookingSkillsController,
                              initialValue: '',
                              validator: null,
                              obsecureText: false,
                              isRequired: false,
                              onChanged: (String value) {
                                print("Write: $value");
                                registerBloc.add(AddBrookingSkills(
                                    skill: double.parse(value)));
                              }),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          CustomTextField(
                              minLength: 0,
                              textFieldName: 'Work Done',
                              controller: workDoneController,
                              initialValue: '',
                              validator: null,
                              obsecureText: false,
                              isRequired: false,
                              onChanged: (String value) {
                                print("Write: $value");
                                registerBloc.add(
                                    AddWorkDone(skill: double.parse(value)));
                              }),
                          // SizedBox(
                          //   height: MediaQuery.of(context).size.height * 0.02,
                          // ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          CustomTextField(
                              minLength: 0,
                              textFieldName: 'Work In Progress',
                              controller: workInProgressController,
                              initialValue: '',
                              validator: null,
                              obsecureText: false,
                              isRequired: false,
                              onChanged: (String value) {
                                print("Write: $value");
                                registerBloc.add(AddWorkInProgress(
                                    skill: double.parse(value)));
                              }),
                          // ProfileFileInput(
                          //   controller: fileController,
                          //   isRequired: true,
                          //   onPressed: () {},
                          //   textFieldName: '',
                          // ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          RegisterButton(
                            name: "Submit",
                            onTapped: () {
                              if (_formKey.currentState!.validate()) {
                                print(
                                    "Register method called from the broker page");
                                Navigator.pushNamed(
                                    context, CustomerDetailScreen.routeName);
                              }
                            },
                          )
                        ])))
                  ])))),
    );
  }
}
