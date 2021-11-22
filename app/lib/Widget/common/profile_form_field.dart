import 'package:flutter/material.dart';

class ProfileFormField extends StatelessWidget {
  const ProfileFormField({
    Key? key,
    required this.name,
    required this.onSaved,
    required this.validator,
    required this.initialValue,
  }) : super(key: key);

  final String name;
  final String initialValue;
  final Function(String value) onSaved;
  final Function(String value) validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        initialValue: initialValue,
        onSaved: (value) {
          onSaved(value!);
        },
        validator: (value) {
          validator(value!);
        },
        decoration: InputDecoration(
          label: Text(name),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
