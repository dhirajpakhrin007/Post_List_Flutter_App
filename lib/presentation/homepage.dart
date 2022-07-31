import 'package:flutter/material.dart';
import 'package:listing_showcase_app/presentation/List/list_detail.dart';
import 'package:listing_showcase_app/presentation/Users/users_home.dart';
import 'package:listing_showcase_app/presentation/comment/postComment.dart';
import 'package:listing_showcase_app/presentation/widget/custom_appbar.dart';

import 'widget/user_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = 'listhome';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  // holds animation controller data

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    //animation for icon and text of button
    controller!.forward();
    controller!.addListener(() {
      setState(() {});
      print(controller!.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1A1A1C).withOpacity(controller!.value),
      appBar: const CustomAppBar(
        appBarTitle: 'Home Page',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // list of post button
              UserButton(
                bName: 'See List of posts',
                bIcon: Icons.remove_red_eye,
                navigate: () {
                  Navigator.pushNamed(context, ListDetail.id);
                },
                bTextsize: 18 * controller!.value,
                bIconsize: 30 * controller!.value,
                // for animating the text and icon
              ),
              const SizedBox(
                height: 30.0,
              ),
              // Post your comment button
              UserButton(
                bName: 'Post Your Comment',
                bIcon: Icons.comment,
                navigate: () {
                  Navigator.pushNamed(context, PostComment.id);
                },
                bTextsize: 18 * controller!.value,
                bIconsize: 30 * controller!.value,
              ),
              const SizedBox(
                height: 30.0,
              ),
              //See your user button
              UserButton(
                bName: 'See Users',
                bIcon: Icons.person,
                navigate: () {
                  Navigator.pushNamed(context, UserHome.id);
                },
                bTextsize: 18 * controller!.value,
                bIconsize: 30 * controller!.value,
              )
            ],
          ),
        ),
      ),
    );
  }
}
