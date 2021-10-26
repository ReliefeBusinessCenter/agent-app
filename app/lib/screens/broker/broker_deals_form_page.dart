import 'package:app/Widget/Auth/signup/next-button.dart';
import 'package:app/Widget/Auth/signup/signUpTextField.dart';
import 'package:app/Widget/broker-widget/deals-submit-button.dart';
import 'package:app/bloc/register/bloc/register_bloc.dart';
import 'package:app/model/customer/customer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DealsPageScreen extends StatefulWidget {
  final Customer customer;
  DealsPageScreen({required this.customer});
  static const routeName = '/deals-form';

  @override
  _DealsPageScreenState createState() => _DealsPageScreenState();
}

class _DealsPageScreenState extends State<DealsPageScreen> {
  final TextEditingController clientNameController =
      new TextEditingController();

  final TextEditingController clientEmailController =
      new TextEditingController();

  final TextEditingController productQuantityController =
      new TextEditingController();

  final TextEditingController clientPhoneController =
      new TextEditingController();

  final TextEditingController addressController = new TextEditingController();

  final TextEditingController clientAdressController =
      new TextEditingController();

  final TextEditingController productNameController =
      new TextEditingController();

  final TextEditingController productModelController =
      new TextEditingController();

  final TextEditingController productColorController =
      new TextEditingController();
  final TextEditingController paymentOptionController =
      new TextEditingController();

  final TextEditingController deliveryOptionController =
      new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  late RegisterBloc registerBloc;

  String type = 'Customer';

  @override
  Widget build(BuildContext context) {
    // String type = 'Customer';
    clientNameController.text = widget.customer.user!.fullName as String;
clientPhoneController.text=widget.customer.user!.phone as String;
clientEmailController.text=widget.customer.user!.email as String;
clientAdressController.text=widget.customer.user!.address as String;
    print("customer full name = : ${widget.customer.user!.fullName}");
    registerBloc = BlocProvider.of<RegisterBloc>(context);
    // registerBloc.add(Initialization());
    return Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        appBar: AppBar(
          title: Text("Deals Form"),
        ),
        body: SafeArea(
          child: Padding(
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
                                "New Deals Form",
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
                              child: Column(children: [
                                CustomTextField(
                                  minLength: 0,
                                  textFieldName: 'Client Name',
                                  controller: clientNameController,
                                  initialValue: "",
                                  validator: null,
                                  obsecureText: false,
                                  isRequired: false,
                                  onChanged: (String value) {
                                    // print("Write: ${value}");
                                    // registerBloc.add(AddName(name: value));
                                  },
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                CustomTextField(
                                    minLength: 0,
                                    textFieldName: 'Client Phone Number',
                                    controller: clientPhoneController,
                                    initialValue:
                                        widget.customer.user!.phone as String,
                                    validator: null,
                                    obsecureText: false,
                                    isRequired: false,
                                    onChanged: (String value) {
                                      // print("Write: ${value}");
                                      // registerBloc.add(AddEmail(email: value));
                                    }),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                CustomTextField(
                                    minLength: 0,
                                    textFieldName: 'Email',
                                    controller: clientEmailController,
                                    initialValue:
                                        widget.customer.user!.email as String,
                                    validator: null,
                                    obsecureText: false,
                                    isRequired: false,
                                    onChanged: (String value) {
                                      // print("Write: ${value}");
                                      // registerBloc.add(AddCity(city: value));
                                    }),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                CustomTextField(
                                    minLength: 0,
                                    textFieldName: 'Address',
                                    controller: clientAdressController,
                                    initialValue:
                                        widget.customer.user!.address as String,
                                    validator: null,
                                    obsecureText: false,
                                    isRequired: false,
                                    onChanged: (String value) {
                                      // print("Write: ${value}");
                                      // registerBloc.add(AddCity(city: value));
                                    }),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                CustomTextField(
                                    minLength: 0,
                                    textFieldName: 'Product Name',
                                    controller: productNameController,
                                    initialValue: '',
                                    validator: null,
                                    obsecureText: false,
                                    isRequired: false,
                                    onChanged: (String value) {
                                      // print("Write: ${value}");
                                      // registerBloc.add(AddKebele(kebele: value));
                                    }),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                CustomTextField(
                                    minLength: 0,
                                    textFieldName: 'Product Model',
                                    controller: productModelController,
                                    initialValue: '',
                                    validator: null,
                                    obsecureText: false,
                                    isRequired: false,
                                    onChanged: (String value) {
                                      // print("Write: ${value}");
                                      // registerBloc.add(AddKebele(kebele: value));
                                    }),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                CustomTextField(
                                    minLength: 0,
                                    textFieldName: 'Quantity',
                                    controller: productQuantityController,
                                    initialValue: '',
                                    validator: null,
                                    obsecureText: false,
                                    isRequired: false,
                                    onChanged: (String value) {
                                      // print("Write: ${value}");
                                      // registerBloc.add(AddKebele(kebele: value));
                                    }),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                CustomTextField(
                                    minLength: 0,
                                    textFieldName: 'Color',
                                    controller: productColorController,
                                    initialValue: '',
                                    validator: null,
                                    obsecureText: false,
                                    isRequired: false,
                                    onChanged: (String value) {
                                      // print("Write: ${value}");
                                      // registerBloc.add(AddKebele(kebele: value));
                                    }),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                CustomTextField(
                                    minLength: 0,
                                    textFieldName: 'Payment Option',
                                    controller: paymentOptionController,
                                    initialValue: '',
                                    validator: null,
                                    obsecureText: false,
                                    isRequired: false,
                                    onChanged: (String value) {
                                      // print("Write: ${value}");
                                      // registerBloc.add(AddKebele(kebele: value));
                                    }),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                CustomTextField(
                                    minLength: 0,
                                    textFieldName: 'Delivery Option',
                                    controller: deliveryOptionController,
                                    initialValue: '',
                                    validator: null,
                                    obsecureText: false,
                                    isRequired: false,
                                    onChanged: (String value) {
                                      // print("Write: ${value}");
                                      // registerBloc.add(AddKebele(kebele: value));
                                    }),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                // SexDropDown(),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                // RoleDropDown(),
                                // BlocBuilder<RegisterBloc, RegisterState>(
                                //   builder: (context, state) {
                                //     print("Entered to the signup screen");
                                //     // if (state is RegisterUpdateLoading) {
                                //     //   return CircularProgressIndicator();
                                //     // }
                                //     if (state is RegisterUpdateSuccess) {
                                //       if (state.user!.role == "Broker") {
                                //         type = 'Broker';
                                //       } else if (state.user!.role == "Customer") {
                                //         type = 'Customer';
                                //       }
                                //       return Visibility(
                                //           visible: state.user!.role == "Broker"
                                //               ? true
                                //               : false,
                                //           child: CategoryDropDownButton());
                                //     }

                                //     return Visibility(
                                //         visible: state.user!.role == "Broker"
                                //             ? true
                                //             : false,
                                //         child: CategoryDropDownButton());

                                //   },
                                // )
                              ]),
                            ),
                          ),
                          DealsSubmit(onTapped: () {
                            //   if (_formKey.currentState!.validate()) {
                            //     print("Validated successfully");
                            //     print("User Type: ${type}");
                            //     if (type == 'Customer') {
                            //       Navigator.of(context)
                            //           .pushNamed(CustomerDetailScreen.routeName);
                            //     } else {
                            //       Navigator.of(context)
                            //           .pushNamed(BrokerDetailScreen.routeName);
                            //     }
                            //   }
                          }),
                        ]),
                      ),
                    )),
              )),
        ));
  }

  void validate() {
    final _formKey = GlobalKey<FormState>();
  }
}
