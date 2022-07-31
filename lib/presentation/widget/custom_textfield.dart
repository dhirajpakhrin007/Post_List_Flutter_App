import 'package:flutter/material.dart';
import 'package:listing_showcase_app/constant/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    this.controller,
    this.validator,
    this.iconData,
    this.maxLines,
    this.onPress,
  }) : super(key: key);
  final String hintText;
  final Function? validator;
  final iconData;
  final TextEditingController? controller;
  final Function()? onPress;
  final int? maxLines;

  Function? getValidatorForField() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onPress,
      controller: controller,
      style: TextStyle(color: kTextColor),
      decoration: InputDecoration(
          // labelStyle: TextStyle(color: primary, fontFamily: 'Mukta'),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400, width: 2.0),
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kprimaryColor, width: 2.0),
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          prefixIcon: iconData,
          prefixIconColor: Colors.white,
          hintText: hintText,
          hintStyle: TextStyle(
            color: kTextColor,
          )),
      maxLines: maxLines,
      autofocus: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please fill all the fields';
        }

        return null;
      },
    );
  }
}
