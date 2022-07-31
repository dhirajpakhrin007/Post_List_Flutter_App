import 'package:flutter/material.dart';

import 'package:listing_showcase_app/constant/colors.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String appBarTitle;

  const CustomAppBar({
    Key? key,
    required this.appBarTitle,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kprimaryColor,
      centerTitle: true,
      title: Text(
        appBarTitle,
        style: TextStyle(color: kTextColor),
      ),
    );
  }
}
