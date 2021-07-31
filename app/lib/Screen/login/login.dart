import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  static String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        color: Theme.of(context).accentColor,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 55),
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              child: Column(
                children: [
                  Text(
                    'Welcome to csv',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: displayHeight(context) * 0.04,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    // color: Colors.transparent,
                    child: new Image.asset(
                      'assets/images/login/csv_img.png',
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 0.65,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Center(
              child: Text(
                'Login',
                // textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: height * 0.04,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: height * 0.06,
            ),
            Material(
              elevation: 6.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              child: TextField(
                // controller: _myPasswordController,
                // obscureText: !ispassshow,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onEditingComplete: () => FocusScope.of(context).unfocus(),
                style: TextStyle(fontSize: 18, color: Colors.grey),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(Icons.lock),
                  border: InputBorder.none,
                  // suffixIcon: IconButton(
                  //   icon: Icon(ispassshow
                  //       ? Icons.visibility
                  //       : Icons.visibility_off),
                  //   onPressed: () {
                  //     setState(() {
                  //       ispassshow = !ispassshow;
                  //     });
                  //   },
                  // ),
                  hintText: "Enter Email ",
                ),
              ),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.01),
            Material(
              color: Colors.white,
              elevation: 6.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              child: TextField(
                // controller: _myPasswordController,
                // obscureText: !ispassshow,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onEditingComplete: () => FocusScope.of(context).unfocus(),
                style: TextStyle(fontSize: 18, color: Colors.grey),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(Icons.lock),
                  border: InputBorder.none,
                  // suffixIcon: IconButton(
                  //   icon: Icon(ispassshow
                  //       ? Icons.visibility
                  //       : Icons.visibility_off),
                  //   onPressed: () {
                  //     setState(() {
                  //       ispassshow = !ispassshow;
                  //     });
                  //   },
                  // ),
                  hintText: "Enter Password ",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Size displaySize(BuildContext context) {
    debugPrint('Size = ' + MediaQuery.of(context).size.toString());
    return MediaQuery.of(context).size;
  }

  double displayHeight(BuildContext context) {
    debugPrint('Height = ' + displaySize(context).height.toString());
    return displaySize(context).height;
  }

  double displayWidth(BuildContext context) {
    debugPrint('Width = ' + displaySize(context).width.toString());
    return displaySize(context).width;
  }
}
