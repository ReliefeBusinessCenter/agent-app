import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  static String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF01577),
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                Text(
                  'Fix It',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: displayHeight(context) * 0.06,
                      color: Colors.white),
                ),
                Container(
                  color: Colors.transparent,
                  height: MediaQuery.of(context).size.height / 3.5,
                  width: MediaQuery.of(context).size.width / 3.5,
                  child: new Image.asset(
                    'assets/images/login/csv_img.png',
                    // width: 600.0,
                    // height: 240.0,
                    //fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  color: Colors.transparent,
                  width: displayHeight(context) * 0.25,
                  child: Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: displayWidth(context) * 0.03,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Material(
            elevation: 6.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
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
            elevation: 6.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
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
