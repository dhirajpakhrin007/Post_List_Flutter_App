import 'package:flutter/material.dart';

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
      decoration: InputDecoration(
        // labelStyle: TextStyle(color: primary, fontFamily: 'Mukta'),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2.0),
          borderRadius: const BorderRadius.all(
            Radius.circular(50.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2.0),
          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        prefixIcon: iconData,
        hintText: hintText,
      ),
      maxLines: maxLines,
      autofocus: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'कृपया केहि टाइप गर्नुहोस्';
        }
        // if (validateEnum != null) {
        //   var validator = getValidatorForField(validateEnum!);
        //   if (validator != null) {
        //     var res = validator(value);
        //     if (res != null) {
        //       return validator(value);
        //     }
        //   }
        // }
        return null;
      },
    );
  }
}
