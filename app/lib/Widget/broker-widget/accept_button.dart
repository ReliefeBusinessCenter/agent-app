import 'package:app/constants/login/size.dart';

import 'package:flutter/material.dart';

class AcceptButton extends StatelessWidget {
  final VoidCallback onPressed;
  AcceptButton({required this.onPressed});
  @override
  Widget build(BuildContext context) {
    LoginSize loginSize = new LoginSize();
    loginSize.build(context);
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: loginSize.getLoginButtonHeight,
        child: InkWell(
          splashColor: Colors.white,
          onTap: this.onPressed,

          // onTap: () => _pushPage(context, Register()),
          child: Material(
            // color: Theme.of(context).primaryColor,
            color:Colors.green,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            elevation: 1.0,
            child: Container(
              // padding: EdgeInsets.all(20),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(40)),

              child: Center(
                  child: Text(
                'Accept Delivery Offer',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
              )),
            ),
          ),
        ));
  }
}
