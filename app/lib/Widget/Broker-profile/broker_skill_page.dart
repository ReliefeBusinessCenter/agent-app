import 'package:flutter/material.dart';

class BrokerSkillsPage extends StatelessWidget {
  // final Skills skill;
  const BrokerSkillsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Skills',
              style: TextStyle(color: Colors.grey.shade900, fontSize: 18.0),
            ),
          ),
          SizedBox(height: 20.0),
          BrokersSkillList(
            iconData: Icons.commute_rounded,
            name: "Communication Skills",
          ),
          BrokersSkillList(
            name: "Broking Skills",
            iconData: Icons.broken_image_rounded,
          ),
          BrokersSkillList(
            iconData: Icons.work,
            name: "Works Done",
          ),
          BrokersSkillList(
            iconData: Icons.confirmation_num,
            name: "Works in Progrss",
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
  // final Skills skills;
  final IconData iconData;
  final String name;
  const BrokersSkillList({
    // required this.skills,
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
                '54',
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
