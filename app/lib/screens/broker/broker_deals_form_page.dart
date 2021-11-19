import 'package:app/Widget/Auth/signup/next-button.dart';
import 'package:app/Widget/Auth/signup/signUpTextField.dart';
import 'package:app/Widget/broker-widget/deals-submit-button.dart';
import 'package:app/Widget/broker-widget/delivery-option-dropdown-button.dart';
import 'package:app/Widget/broker-widget/paymet-option-dropdown-button.dart';
import 'package:app/bloc/deals/bloc/deals_bloc.dart';
import 'package:app/bloc/register/bloc/register_bloc.dart';
import 'package:app/model/customer/customer.dart';
import 'package:app/model/deals.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

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

  late DealsBloc dealsBloc;

  String type = 'Customer';

  @override
  Widget build(BuildContext context) {
    // String type = 'Customer';
    clientNameController.text = widget.customer.user!.fullName as String;
    clientPhoneController.text = widget.customer.user!.phone as String;
    clientEmailController.text = widget.customer.user!.email as String;
    clientAdressController.text = widget.customer.user!.address as String;
    this.deliveryOptionController.text = "No";
    this.paymentOptionController.text = "On Hand";
    print("customer full name = : ${widget.customer.user!.fullName}");
    dealsBloc = BlocProvider.of<DealsBloc>(context);
    // registerBloc.add(Initialization());
    return Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        appBar: AppBar(
          title: Text("Deals Form"),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: SafeArea(
            child: ProgressHUD(
          child:
              BlocConsumer<DealsBloc, DealsState>(listener: (context, state) {
            if (state is DealsCreating) {
              final progress = ProgressHUD.of(context);
              // if (!isShowing) {
              //   if (progress != null) {
              //     setState(() {
              //       isShowing = true;
              //     });

              // }
              progress!.showWithText("Creating");
            } else if (state is DealsCreateSuccess) {
              // this.isShowing = false;
              // registerBloc.add(Initialization());
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              // Navigator.popAndPushNamed(context, DealsPageScreen.routeName);
              // return Container(child: Text("Created Successfully"));
            } else if (state is DealsCreateFailed) {
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
                  // Navigator.popAndPushNamed(context, Login.routeName);
                  // registerBloc.add(Initialization());
                },
              )..show();
            }
          }, builder: (context, state) {
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
                                    top: MediaQuery.of(context).size.height *
                                        0.02,
                                    left: MediaQuery.of(context).size.width *
                                        0.05),
                                child: Text(
                                  "New Deals Form",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.7,
                              padding: EdgeInsets.only(
                                  left: 0.5, right: 0.5, top: 25),
                              child: SingleChildScrollView(
                                child: Column(children: [
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02),
                                  CustomTextField(
                                    minLength: 0,
                                    keyboardType: TextInputType.text,
                                    textFieldName: 'Client Name',
                                    controller: clientNameController,
                                    initialValue: "",
                                    enabled: false,
                                    validator: null,
                                    obsecureText: false,
                                    isRequired: false,
                                    onChanged: (String value) {
                                      // print("Write: ${value}");
                                      // registerBloc.add(AddName(name: value));
                                    },
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  CustomTextField(
                                      minLength: 0,
                                      keyboardType: TextInputType.number,
                                      textFieldName: 'Client Phone Number',
                                      controller: clientPhoneController,
                                      enabled: false,
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
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  // CustomTextField(
                                  //     minLength: 0,
                                  //     textFieldName: 'Email',
                                  //     enabled: false,
                                  //     controller: clientEmailController,
                                  //     initialValue:
                                  //         widget.customer.user!.email as String,
                                  //     validator: null,
                                  //     obsecureText: false,
                                  //     isRequired: false,
                                  //     onChanged: (String value) {
                                  //       // print("Write: ${value}");
                                  //       // registerBloc.add(AddCity(city: value));
                                  //     }),
                                  // SizedBox(
                                  //   height: MediaQuery.of(context).size.height *
                                  //       0.02,
                                  // ),
                                  CustomTextField(
                                      minLength: 0,
                                      keyboardType: TextInputType.text,
                                      textFieldName: 'Address',
                                      enabled: false,
                                      controller: clientAdressController,
                                      initialValue: widget
                                          .customer.user!.address as String,
                                      validator: null,
                                      obsecureText: false,
                                      isRequired: false,
                                      onChanged: (String value) {
                                        // print("Write: ${value}");
                                        // registerBloc.add(AddCity(city: value));
                                      }),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  CustomTextField(
                                      minLength: 0,
                                      keyboardType: TextInputType.text,
                                      enabled: true,
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
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  CustomTextField(
                                      minLength: 0,
                                      enabled: true,
                                      keyboardType: TextInputType.text,
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
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  CustomTextField(
                                      minLength: 0,
                                      enabled: true,
                                      keyboardType: TextInputType.number,
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
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  CustomTextField(
                                      minLength: 0,
                                      keyboardType: TextInputType.text,
                                      textFieldName: 'Color',
                                      enabled: true,
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
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),

                                  PaymentOptionDropDown(
                                    paymentOptionController:
                                        this.paymentOptionController,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  // CustomTextField(
                                  //     minLength: 0,
                                  //     textFieldName: 'Delivery Option',
                                  //     controller: deliveryOptionController,
                                  //     initialValue: '',
                                  //      enabled:true,
                                  //     validator: null,
                                  //     obsecureText: false,
                                  //     isRequired: false,
                                  //     onChanged: (String value) {
                                  //       // print("Write: ${value}");
                                  //       // registerBloc.add(AddKebele(kebele: value));
                                  //     }),
                                  DeliveryOptionDropDown(
                                    deliveryOptionController:
                                        this.deliveryOptionController,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  // SexDropDown(),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
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
                              if (_formKey.currentState!.validate()) {
                                print(
                                    "Delivery Option: ${this.deliveryOptionController.text}");
                                print(
                                    "Product model: ${this.productModelController.text}");
                                print("Validated successfully");
                                Deals deals = new Deals(
                                  color: this.productColorController.text,
                                  customer: widget.customer,
                                  dealsStatus: "Pending",
                                  deliveryOption:
                                      this.deliveryOptionController.text,
                                  paymentOption:
                                      this.paymentOptionController.text,
                                  quantity: int.parse(
                                      this.productQuantityController.text),
                                  productName: this.productNameController.text,
                                  productModel:
                                      this.productModelController.text,
                                );
                                dealsBloc.add(DealsCreateEvent(deals: deals));
                              }
                            }),
                          ]),
                        ),
                      )),
                ));
          }),
        )));
  }

  void validate() {
    final _formKey = GlobalKey<FormState>();
  }
}
