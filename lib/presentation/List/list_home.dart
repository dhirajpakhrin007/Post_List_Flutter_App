import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:listing_showcase_app/presentation/List/list_detail.dart';

import '../../logic/list_cubit/list_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = 'listhome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              UserButton(
                bName: 'See List of posts',
              )
            ],
          ),
        ),
      ),
    );
  }
}

class UserButton extends StatelessWidget {
  final String bName;
  const UserButton({
    required this.bName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ListDetail.id);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            blurRadius: 5,
            offset: Offset(0, 7), // changes position of shadow
          ),
        ]),
        height: 50.0,
        width: double.infinity,
        child: Text(
          bName,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
