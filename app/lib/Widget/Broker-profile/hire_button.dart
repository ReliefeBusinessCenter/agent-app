import 'package:app/bloc/favorit/bloc/favorite_bloc.dart';
import 'package:app/bloc/work/bloc/work_bloc.dart';
import 'package:app/constants/customer-page/categories.dart';
import 'package:app/model/broker.dart';
import 'package:app/model/category.dart';
import 'package:app/model/work.dart';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custome_button.dart';

class HireButton extends StatelessWidget {
  late WorkBloc workBloc;
  late final Broker broker;
  HireButton({required this.broker});
  @override
  Widget build(BuildContext context) {
    workBloc = BlocProvider.of<WorkBloc>(context);
    Category category = []
        .firstWhere((element) => element.id == broker.categoryId);
    Work work = new Work(
        AssignedBrokerName: broker.name,
        WorkName: '${category.catigoryName} Broking',
        WorkDetail: "broking on the ${category.catigoryName} area",
        WorkStatus: "Pending");
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(10),
        child: CustomButton(
            brokerName: broker.name,
            label: 'Hire ${broker.name}',
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Colors.white,
            onTap: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.INFO,
                animType: AnimType.BOTTOMSLIDE,
                title: 'Confirm Us',
                desc: 'You are Hiring ${broker.name}. Do you want to continue?',
                btnCancelOnPress: () {},
                btnOkOnPress: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.SUCCES,
                    animType: AnimType.BOTTOMSLIDE,
                    title: 'Success',
                    desc: 'Your process have been successfully processed.',
                    btnOkOnPress: () {
                      workBloc.add(AddWork(work: work));
                      Navigator.pop(context);
                    },
                  )..show();
                },
              )..show();
            }),
      ),
    );
  }
}
