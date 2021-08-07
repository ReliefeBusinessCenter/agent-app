import 'package:flutter/material.dart';

import 'custome_button.dart';

class SelectOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        child: Row(
          // mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: CustomButton(
                label: 'Profile',
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                onTap: () {},
              ),
            ),
            Expanded(
              child: CustomButton(
                label: 'Views',
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColor,
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
