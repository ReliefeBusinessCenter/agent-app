import 'package:flutter/material.dart';

class CustomCategory extends StatefulWidget {
  @override
  _CustomCategoryState createState() => _CustomCategoryState();
}

class _CustomCategoryState extends State<CustomCategory> {
  Color _color = Color(0xFF015777).withOpacity(0.05);
  Color _fontColor = Colors.black.withOpacity(0.8);

  @override
  Widget build(BuildContext context) {
    // this._color = Theme.of(context).primaryColor.withOpacity(0.07);
    return GestureDetector(
        onTap: () {
          setState(() {
            this._color = Theme.of(context).primaryColor;
            this._fontColor = Colors.white;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                  color: this._color, borderRadius: BorderRadius.circular(15)),
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.05,
              child: Center(
                child: Text(
                  "All",
                  // textAlign: TextAlign.center,
                  style: TextStyle(color: this._fontColor),
                ),
              )),
        ));
  }
}
