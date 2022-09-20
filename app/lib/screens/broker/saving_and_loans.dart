import 'dart:io';

import 'package:app/Widget/Auth/Common/material_form_field.dart';
import 'package:app/Widget/Auth/signup/saving_id_image.dart';
import 'package:app/Widget/Auth/signup/saving_profile_image.dart';
import 'package:app/Widget/broker-widget/saving_submit_button.dart';
import 'package:app/bloc/saveLoan/bloc/saveloan_bloc.dart';
import 'package:app/constants.dart';
import 'package:app/model/broker/broker.dart';
import 'package:app/model/save_loan.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavingAndLoan extends StatefulWidget {
  static const routeName = '/saving-loan';
  final Broker broker;
  SavingAndLoan({required this.broker});

  @override
  _SavingAndLoanState createState() => _SavingAndLoanState();
}

class _SavingAndLoanState extends State<SavingAndLoan> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? profileImage;
  String? idImage;

  late SaveloanBloc saveloanBloc;

  @override
  void initState() {
    _addImages();
    super.initState();
  }

  Map<String, dynamic> _saveLoanData = {};

  _addImages() {
    BlocProvider.of<SaveloanBloc>(context).add(SaveLoanSuccessEvent());
    setState(() {
      profileImage = widget.broker.user!.picture!;
      idImage = widget.broker.user!.identificationCard!;
      _saveLoanData['idPhoto'] = widget.broker.user!.identificationCard!;
      _saveLoanData['profilePhoto'] = widget.broker.user!.picture!;
      _saveLoanData['fullName'] = widget.broker.user!.fullName;
      _saveLoanData['phone'] = widget.broker.user!.phone;
    });
  }

  File? _profileImage;
  File? _idImage;

  bool _showButton = true;

  @override
  Widget build(BuildContext context) {
    saveloanBloc = BlocProvider.of<SaveloanBloc>(context);
    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(LocaleKeys.create_wallet_label_text.tr())),
      body: BlocBuilder<SaveloanBloc, SaveloanState>(
        builder: (context, state) {
          if (state is SaveloanLoading) {
            _showButton = false;
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SaveloanFailed) {
            _showButton = false;
            return Center(
              child: Text(state.message),
            );
          } else if (state is SaveloanCreateSuccess) {
            _showButton = false;
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 30.0,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    "Successfull created",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 18.0,
                    ),
                  )
                ],
              ),
            );
          } else {
            _showButton = true;
            return Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      SavingCustomFormField(
                          initialValue: widget.broker.user!.fullName!,
                          textFieldName: LocaleKeys.fullname_label_text.tr(),
                          isObsecure: false,
                          onChanged: (value) {
                            setState(() {
                              _saveLoanData['fullName'] = value;
                            });
                          },
                          icon: Icon(Icons.person)),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      SavingCustomFormField(
                          initialValue: widget.broker.user!.phone!,
                          textFieldName: LocaleKeys.phone_label_text.tr(),
                          onChanged: (value) {
                            setState(() {
                              _saveLoanData['phone'] = value;
                            });
                          },
                          // controller: phoneNumberController,
                          isObsecure: false,
                          icon: Icon(Icons.phone)),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        LocaleKeys.profile_photo_label_text.tr(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Center(
                          child: SavingProfileImageUpload(
                              image: widget.broker.user!.picture!,
                              pickImage: (image) {
                                _saveLoanData['profilePhoto'] = image.path;
                                _profileImage = image;
                              })),
                      SizedBox(height: 20.0),
                      Text(
                        LocaleKeys.id_photo_label_text.tr(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                          child: SavingIdPhotUpload(
                              image: widget.broker.user!.picture!,
                              pickImage: (image) {
                                setState(() {
                                  _saveLoanData['idPhoto'] = image.path;
                                  _idImage = image;
                                });
                              })),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: _showButton
          ? Container(
              height: 60.0,
              padding: EdgeInsets.all(10.0),
              child: SavingButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      (profileImage != null) &&
                      idImage != null) {
                    print("Validated");

                    SaveLoan saveLoan = SaveLoan(
                      fullName: _saveLoanData['fullName'],
                      phone: _saveLoanData['phone'],
                      picture: _saveLoanData['profilePhoto'],
                      identificationCard: _saveLoanData['idPhoto'],
                    );
                    print(saveLoan.toString());

                    saveloanBloc.add(CreateSaveLoanEvent(
                      saveLoan: saveLoan,
                      isProfileImageChanged: _profileImage != null,
                      isIdImageChanged: _idImage != null,
                    ));
                  }
                },
              ),
            )
          : Container(),
    );
  }
}
