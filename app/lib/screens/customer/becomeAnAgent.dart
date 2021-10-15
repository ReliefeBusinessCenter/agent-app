import 'dart:io';

import 'package:app/Widget/Auth/auth-export.dart';
import 'package:app/Widget/agent/custome_button.dart';
import 'package:app/Widget/agent/custome_drop_down_button.dart';
import 'package:app/Widget/agent/custome_file_input.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';

class BecomeAnAgent extends StatefulWidget {
  static const routeName = '/agent';

  @override
  _BecomeAnAgentState createState() => _BecomeAnAgentState();
}

class _BecomeAnAgentState extends State<BecomeAnAgent> {
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
      drawer: AppDrawer(),
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
              CustomeDropDownButton(),
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
              CustomTextField(
                  textFieldName: "City",
                  controller: cityControler,
                  isObsecure: false,
                  icon: Icon(Icons.location_city)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              CustomTextField(
                  textFieldName: "Email",
                  controller: emailController,
                  isObsecure: false,
                  icon: Icon(Icons.email)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              CustomFileInput(
                  textFieldName: "Profile Picture",
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
              CustomTextField(
                  textFieldName: "Id",
                  controller: fullNameController,
                  isObsecure: false,
                  icon: Icon(Icons.perm_identity)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              SubmitButton(),
            ],
          ),
        ),
      ),
    );
  }
}
