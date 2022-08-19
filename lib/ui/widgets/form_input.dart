import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class FormInput extends StatelessWidget {
  const FormInput({Key? key, this.controllerData = ''}) : super(key: key);

  final String controllerData;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: TextEditingController(text: controllerData),
      cursorColor: kBlackColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: kWhiteColor,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }
}
