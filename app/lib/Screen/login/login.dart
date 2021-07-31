import 'package:app/screens/home_screen.dart';
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
              // color: Theme.of(context).primaryColor,
              color: Colors.white,
              child: Column(
                children: [
                  Text(
                    'Welcome to Trust Brokers',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: displayHeight(context) * 0.04,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    // color: Colors.transparent,
                    child: new Image.asset(
                      'assets/images/login/logo.png',
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
              color: Colors.white,
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              child: Container(
                width: width * 0.9,
                child: TextField(
                  // controller: _myPasswordController,
                  // obscureText: !ispassshow,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  onEditingComplete: () => FocusScope.of(context).unfocus(),
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 14),
                    prefixIcon: Icon(Icons.email),
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
                    hintText: "Email Address",
                  ),
                ),
              ),
            ),
            SizedBox(
                // width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.01),
            Material(
              color: Colors.white,
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              child: Container(
                width: width * 0.9,
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
            ),
            SizedBox(
              height: height * 0.06,
            ),
            SizedBox(
                //width: MediaQuery.of(context).size.width*0.5,
                height: MediaQuery.of(context).size.height * 0.06,
                child: InkWell(
                  splashColor: Colors.white,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },

                  // onTap: () => _pushPage(context, Register()),
                  child: Material(
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    elevation: 1.0,
                    child: Container(
                      // padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40)),
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Center(
                          child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300),
                      )),
                    ),
                  ),
                )),
            SizedBox(
              height: height * 0.03,
            ),
            GestureDetector(
              child: Text(
                'Forgot Passowrd?',
                // textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: height * 0.025,
                    color: Colors.black),
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
