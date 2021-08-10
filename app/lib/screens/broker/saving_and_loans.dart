import 'dart:io';

import 'package:app/Widget/Auth/auth-export.dart';
import 'package:app/Widget/agent/custome_button.dart';
import 'package:app/Widget/agent/custome_drop_down_button.dart';
import 'package:app/Widget/agent/custome_file_input.dart';
import 'package:app/Widget/broker-widget/saving_submit_button.dart';
import 'package:app/screens/broker/broker_drawer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class SavingAndLoan extends StatefulWidget {
  static const routeName = '/saving-loan';

  @override
  _SavingAndLoanState createState() => _SavingAndLoanState();
}

class _SavingAndLoanState extends State<SavingAndLoan> {
  TextEditingController fullNameController = new TextEditingController();
  TextEditingController category = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();
  TextEditingController cityControler = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController profilePicController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(),
      drawer: BrokerDrawer(),
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              CustomTextField(
                  textFieldName: "Full Name",
                  controller: fullNameController,
                  isObsecure: false,
                  icon: Icon(Icons.person)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              CustomTextField(
                  textFieldName: "Phone",
                  controller: phoneNumberController,
                  isObsecure: false,
                  icon: Icon(Icons.phone)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              CustomFileInput(
                  textFieldName: "Insert AA ID Document",
                  controller: profilePicController,
                  isRequired: true,
                  onPressed: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles();
                    if (result != null) {
                      File file = File(result.files.single.path!);
                      setState(() {
                        profilePicController.text = file.path;
                      });
                    } else {
                      // User canceled the picker
                    }
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              CustomFileInput(
                  textFieldName: "Ensert Photo",
                  controller: profilePicController,
                  isRequired: true,
                  onPressed: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles();
                    if (result != null) {
                      File file = File(result.files.single.path!);
                      setState(() {
                        profilePicController.text = file.path;
                      });
                    } else {
                      // User canceled the picker
                    }
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              SavingButton(),
            ],
          ),
        ),
      ),
    );
  }
}
