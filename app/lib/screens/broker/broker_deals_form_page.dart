import 'package:app/Widget/Auth/Common/color_picker.dart';
import 'package:app/Widget/Auth/signup/signUpTextField.dart';
import 'package:app/Widget/broker-widget/deals-submit-button.dart';
import 'package:app/Widget/broker-widget/delivery-option-dropdown-button.dart';
import 'package:app/Widget/broker-widget/paymet-option-dropdown-button.dart';
import 'package:app/bloc/deals/bloc/deals_bloc.dart';
import 'package:app/model/customer/customer.dart';
import 'package:app/model/deals.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:easy_localization/easy_localization.dart';

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

  Color _selectedColor = Color(0xff443a49);

  @override
  Widget build(BuildContext context) {
    // String type = 'Customer';
    clientNameController.text = widget.customer.user!.fullName as String;
    clientPhoneController.text = widget.customer.user!.phone as String;
    clientEmailController.text = widget.customer.user!.email as String;
    clientAdressController.text = widget.customer.user!.city as String;
    this.deliveryOptionController.text = "No";
    this.paymentOptionController.text = "On Hand";
    print("customer full name = : ${widget.customer.user!.fullName}");
    dealsBloc = BlocProvider.of<DealsBloc>(context);
    // registerBloc.add(Initialization());
    return Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        appBar: AppBar(
          title: Text(LocaleKeys.deals_form_label_text.tr()),
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
              progress!.showWithText(LocaleKeys.createing_label_text.tr());
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
                title: LocaleKeys.order_creating_failed_label_text.tr(),
                desc: LocaleKeys.fill_all_the_information_carefully_label_text.tr(),
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
                                  LocaleKeys.new_deals_form_label_text.tr(),
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
                                    textFieldName: LocaleKeys.client_name_label_text.tr(),
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
                                      textFieldName: LocaleKeys.client_phone_number_label_text.tr(),
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
                                      textFieldName: LocaleKeys.address_label_text.tr(),
                                      enabled: false,
                                      controller: clientAdressController,
                                      initialValue:
                                          widget.customer.user!.city != null
                                              ? widget.customer.user!.city!
                                              : "Unknown",
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
                                      textFieldName: LocaleKeys.product_name_label_text.tr(),
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
                                      textFieldName: LocaleKeys.product_model_label_text.tr(),
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
                                      textFieldName: LocaleKeys.quantity_label_text_label.tr(),
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
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          LocaleKeys.choose_color_label_text.tr(),
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            IconButton(
                                              icon: Icon(
                                                Icons.colorize_rounded,
                                              ),
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      ColorePickerWidget(
                                                    changeColor: (color) {
                                                      setState(() {
                                                        _selectedColor = Color(color.value);
                                                        this
                                                                .productColorController
                                                                .text =
                                                            color.value
                                                                .toString();
                                                      });
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                            Container(
                                              height: 20.0,
                                              width: 35.0,
                                              color: _selectedColor,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
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
