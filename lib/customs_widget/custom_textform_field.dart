// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

// ignore: constant_identifier_names
enum TextFieldType { Text, Password, Number }

class InputTextField extends StatefulWidget {
  final String hintText;
  final IconData prefixicon;
  final TextFieldType type;
  final TextEditingController? controller;

  const InputTextField({
    super.key,
    required this.hintText,
    required this.prefixicon,
    this.type = TextFieldType.Text,
    this.controller,
  });

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  bool obsecureText = false;
  @override
  void initState() {
    super.initState();
    if (widget.type == TextFieldType.Password) {
      obsecureText = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    TextInputType keyboardType;
    if (widget.type == TextFieldType.Number) {
      keyboardType = TextInputType.number;
    } else {
      keyboardType = TextInputType.text;
    }
    return TextFormField(
      controller: widget.controller,
      obscureText: obsecureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: Padding(
          padding: EdgeInsets.only(
            right: width * 0.02,
          ),
          child: Icon(
            widget.prefixicon,
            color: Colors.white,
          ),
        ),
        suffixIcon: widget.type == TextFieldType.Password
            ? IconButton(
                splashRadius: 10,
                onPressed: () {
                  setState(() {
                    obsecureText = !obsecureText;
                  });
                },
                icon: Icon(
                  obsecureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
              )
            : null,
        hintStyle: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w300,
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.orange,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        prefixIconConstraints: BoxConstraints.loose(
          Size(
            width * 0.2,
            height * 0.025,
          ),
        ),
      ),
    );
  }
}
