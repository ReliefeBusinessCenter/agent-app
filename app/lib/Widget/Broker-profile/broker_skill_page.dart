import 'package:app/model/broker/skills.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class BrokerSkillsPage extends StatelessWidget {
  final Skills skill;
  const BrokerSkillsPage({
    required this.skill,
    Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              LocaleKeys.skiils_label_text.tr(),
              style: TextStyle(color: Colors.grey.shade900, fontSize: 18.0),
            ),
          ),
          SizedBox(height: 20.0),
          BrokersSkillList(
            amount: skill.communicationSkill!,
            iconData: Icons.commute_rounded,
            name: LocaleKeys.communicative_skills_label_text.tr(),
          ),
          BrokersSkillList(
            amount: skill.brokingSkill!,
            name: LocaleKeys.broking_skills_label_text.tr(),
            iconData: Icons.broken_image_rounded,
          ),
          BrokersSkillList(
            amount: skill.workDone!,
              iconData: Icons.work, name: LocaleKeys.work_done_label_text.tr()),
          BrokersSkillList(
            amount: skill.workInProgress!,
            iconData: Icons.confirmation_num,
            name: LocaleKeys.Work_in_progress_label_text.tr(),
          ),
          Divider(
            thickness: 1.5,
          ),
          SizedBox(height: 20.0)
        ],
      ),
    );
  }
}

class BrokersSkillList extends StatelessWidget {
  final double amount;
  final IconData iconData;
  final String name;
  const BrokersSkillList({
    required this.amount,
    required this.iconData,
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          thickness: 1.5,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(iconData),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
              Text(
                amount.toStringAsFixed(0),
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
