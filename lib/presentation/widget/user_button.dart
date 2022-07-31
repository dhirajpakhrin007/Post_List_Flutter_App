import 'package:flutter/material.dart';

import 'package:listing_showcase_app/constant/colors.dart';

class UserButton extends StatelessWidget {
  final String bName;
  final Function() navigate;
  final IconData bIcon;
  final double bTextsize;
  final double bIconsize;

  const UserButton({
    Key? key,
    required this.bName,
    required this.navigate,
    required this.bIcon,
    required this.bTextsize,
    required this.bIconsize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigate,
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: kprimaryColor,
          ),
          width: double.infinity,
          child: ListTile(
            horizontalTitleGap: 30.0,
            leading: Icon(
              bIcon,
              color: kTextColor,
              size: bIconsize,
            ),
            title: Text(
              bName,
              style: TextStyle(
                fontSize: bTextsize,
                color: kTextColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          )),
    );
  }
}
