import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final Color backgroundColor;
  final Color foregroundColor;
  final String label;
  final String brokerName;

  const CustomButton(
      {required this.onTap,
      required this.backgroundColor,
      required this.foregroundColor,
      required this.brokerName,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(label,
                style: TextStyle(
                  color: foregroundColor,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        onTap: () {
          // Navigator.pop(context);
          AwesomeDialog(
            context: context,
            dialogType: DialogType.INFO,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Confirm Us',
            desc: 'You are Hiring $brokerName. Do you want to continue?',
            btnCancelOnPress: () {},
            btnOkOnPress: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.SUCCES,
                animType: AnimType.BOTTOMSLIDE,
                title: 'Success',
                desc: 'Your process have been successfully processed.',
                btnOkOnPress: () {
                  Navigator.pop(context);
                },
              )..show();
            },
          )..show();
        });
  }
}
