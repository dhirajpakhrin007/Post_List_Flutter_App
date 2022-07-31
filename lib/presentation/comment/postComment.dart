import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listing_showcase_app/constant/colors.dart';
import 'package:listing_showcase_app/logic/comment_button_bloc/comment_bloc.dart';
import 'package:listing_showcase_app/presentation/homepage.dart';
import 'package:listing_showcase_app/presentation/widget/custom_appbar.dart';

import '../widget/custom_textfield.dart';

class PostComment extends StatefulWidget {
  static const String id = 'postcomment';
  const PostComment({Key? key}) : super(key: key);

  @override
  State<PostComment> createState() => _PostCommentState();
}

class _PostCommentState extends State<PostComment> {
  final _fbKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kSecondaryColor,
        appBar: const CustomAppBar(
          appBarTitle: 'Post Your Comment',
        ),
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    "Resource will not be really updated on the server but it will be faked as if.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(
                    height: 70.0,
                  ),
                  BlocListener<CommentBloc, CommentState>(
                    listener: (context, state) {
                      if (state is CommentFormButtonError) {
                        Text(
                          state.error,
                          style: const TextStyle(color: kprimaryColor),
                        );
                        print("error: ${state.error}");
                      } else if (state is CommentFormButtonSubmitted) {
                        final snackBar = SnackBar(
                          backgroundColor: kTextColor,
                          content: const Text(
                            'The comment has been posted',
                            style: TextStyle(
                              color: kSecondaryColor,
                            ),
                          ),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {},
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                        Navigator.pushNamedAndRemoveUntil(
                            context, HomePage.id, (route) => false);
                      }
                    },
                    child: Form(
                        key: _fbKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              ListTile(
                                title: CustomTextField(
                                  controller: nameController,
                                  hintText: 'Your Name',
                                  maxLines: 1,
                                  iconData: const Icon(Icons.person,
                                      color: Colors.grey),
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              ListTile(
                                title: CustomTextField(
                                  controller: emailController,
                                  hintText: 'Your Email',
                                  maxLines: 1,
                                  iconData: const Icon(Icons.email,
                                      color: Colors.grey),
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              ListTile(
                                title: CustomTextField(
                                  controller: commentController,
                                  hintText: 'Your Comment',
                                  maxLines: 3,
                                  iconData: const Icon(Icons.message,
                                      color: Colors.grey),
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              submitbutton(),
                            ])),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // button for submitting the comment
  submitbutton() {
    return GestureDetector(
      onTap: () {
        _fbKey.currentState!.save();
        if (_fbKey.currentState!.validate()) {
          BlocProvider.of<CommentBloc>(context).add(CommentButtonPressed(
              name: nameController.text,
              email: emailController.text,
              comment: commentController.text));
        }
      },
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: kprimaryColor,
          ),
          height: 60.0,
          width: 120.0,
          child: const ListTile(
            title: Text(
              "Send",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                color: kTextColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          )),
    );
  }
}
