import 'package:bloc_pattern/components/text_field_container.dart';
import 'package:flutter/material.dart';

import '../utility/constant.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.email,
    required this.onChanged,
    required this.textEditingController,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: textEditingController,
        validator: validator,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}