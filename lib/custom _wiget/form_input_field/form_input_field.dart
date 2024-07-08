import 'package:flutter/material.dart';


/// custom inputfiled

class FormInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String? Function(String?) validator;

  const FormInputField({
    Key? key,
    required this.controller,
    required this.hint,
    required this.validator,
  }) : super(key: key);

  /// this ui for custom wiget

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color.fromRGBO(143, 148, 251, 1)),
        ),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[700]),
        ),
        validator: validator,
      ),
    );
  }
}
