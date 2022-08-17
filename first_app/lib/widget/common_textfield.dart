import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField(
      {Key? key,
      required this.controller,
      this.keyboardType,
      this.textInputAction,
      this.validator,
      this.hintText = "",
      this.label,
      this.prefixIcon,
      this.sufficIcon,
      this.obscureText = false,
      this.onChanged})
      : super(key: key);

  final TextEditingController controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final String hintText;
  final String? label;
  final Widget? prefixIcon;
  final Widget? sufficIcon;
  final Function(String)? onChanged;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        autofocus: true,
        onChanged: onChanged,
        // onSubmitted: (val) {},

        autocorrect: false,
        validator: validator,
        obscureText: obscureText,
        //  (val) {
        //   /// error cases check

        //   if (val == null) {
        //     return "Email must not be empty";
        //   }

        //   if (!val.contains("@")) {
        //     return "Enter a valid email";
        //     // test@test.com
        //   }
        // },

        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          // enabled: false,
          // fillColor: Colors.black,
          labelText: label,
          prefixIcon: prefixIcon,
          suffixIcon: sufficIcon,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          focusedErrorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.red)),
          enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.purple)),
          disabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.black)),
          focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.green)),
        ),
      ),
    );
  }
}
