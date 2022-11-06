import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  const CustomOutlineButton({
    required this.onPressed,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: size.height * 0.06,
        width: size.width,
        child: TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  side: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ))),
          child: Text(
            title,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),
          onPressed: () {
            onPressed();
          },
        ),
      ),
    );
  }
}
