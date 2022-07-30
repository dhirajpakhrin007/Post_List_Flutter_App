import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:listing_showcase_app/presentation/List/list_detail.dart';
import 'package:listing_showcase_app/presentation/Users/users_home.dart';
import 'package:listing_showcase_app/presentation/comment/postComment.dart';

import '../logic/list_cubit/list_cubit.dart';

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
                navigate: () {
                  Navigator.pushNamed(context, ListDetail.id);
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              UserButton(
                bName: 'Post Your Comment',
                navigate: () {
                  Navigator.pushNamed(context, PostComment.id);
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              UserButton(
                bName: 'See Users',
                navigate: () {
                  Navigator.pushNamed(context, UserHome.id);
                },
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
  final Function() navigate;
  const UserButton({
    Key? key,
    required this.bName,
    required this.navigate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigate,
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
