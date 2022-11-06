import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:string_to_hex/string_to_hex.dart';

class ColorePickerWidget extends StatefulWidget {
  final Function(Color color) changeColor;
  const ColorePickerWidget({
    required this.changeColor,
    Key? key,
  }) : super(key: key);

  @override
  _ColorePickerWidgetState createState() => _ColorePickerWidgetState();
}

class _ColorePickerWidgetState extends State<ColorePickerWidget> {
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

  Color _generatedColor = Color(0xff443a49);

// ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Pick a color!'),
      content: SingleChildScrollView(
        child: ColorPicker(
          pickerColor: pickerColor,
          onColorChanged: changeColor,
        ),
        // Use Material color picker:

        // child: MaterialPicker(
        //   pickerColor: pickerColor,
        //   onColorChanged: changeColor,
        //   // showLabel: true, // only on portrait mode
        // ),

        // Use Block color picker:

        // child: BlockPicker(
        //   pickerColor: currentColor,
        //   onColorChanged: changeColor,
        // ),

        // child: MultipleChoiceBlockPicker(
        //   pickerColors: currentColors,
        //   onColorsChanged: changeColors,
        // ),
      ),
      actions: <Widget>[
        ElevatedButton(
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
          ),
          child: const Text(
            'Got it',
          ),
          onPressed: () {
            setState(() {
              currentColor = pickerColor;
            });
            widget.changeColor(Color(pickerColor.value));
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
