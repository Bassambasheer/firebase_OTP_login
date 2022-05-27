import 'package:aiolos/theme/theme.dart';
import 'package:flutter/material.dart';

class TxtField extends StatelessWidget {
  TxtField(
      {required this.hint,
      Key? key,
      this.pass = false,
      this.controller,
      this.lines = 1,
      this.type,
      this.readonly = false,
      this.validator,
      this.icon})
      : super(key: key);
  final String hint;
  final bool pass;
  TextEditingController? controller;
  final int? lines;
  final TextInputType? type;
  final bool readonly;
  final Function? validator;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: TextFormField(
          keyboardType: type,
          textInputAction: TextInputAction.next,
          readOnly: readonly,
          controller: controller,
          obscureText: pass,
          maxLines: lines,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: Text(
              hint,
              style: const TextStyle(color: white),
            ),
            filled: true,
            fillColor: Colors.blue.shade800,
            suffixIcon: icon,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 0.5)),
          ),
          validator: (value) {
            if (validator != null) {
              return validator!(value);
            }
            return null;
          },
        ));
  }
}
