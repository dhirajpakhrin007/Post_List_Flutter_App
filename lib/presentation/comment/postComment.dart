import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listing_showcase_app/logic/comment_bloc/comment_bloc.dart';
import 'package:listing_showcase_app/presentation/homepage.dart';

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
        appBar: AppBar(
          title: Text('Post your comment'),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: BlocListener<CommentBloc, CommentState>(
                      listener: (context, state) {
                        if (state is CommentFormButtonError) {
                          print("error: ${state.error}");
                        } else if (state is CommentFormButtonSubmitted) {
                          print(state.commentResponseModel.body);
                          final snackBar = SnackBar(
                            content: const Text('The comment has been posted'),
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
                          child: Column(children: <Widget>[
                            ListTile(
                              title: CustomTextField(
                                controller: nameController,
                                hintText: 'Your Name',
                                maxLines: 1,
                                iconData:
                                    Icon(Icons.person, color: Colors.grey),
                              ),
                            ),
                            ListTile(
                              title: CustomTextField(
                                controller: emailController,
                                hintText: 'Your Email',
                                maxLines: 1,
                                iconData: Icon(Icons.email, color: Colors.grey),
                              ),
                            ),
                            ListTile(
                              title: CustomTextField(
                                controller: commentController,
                                hintText: 'Your Comment',
                                maxLines: 6,
                                iconData:
                                    Icon(Icons.message, color: Colors.grey),
                              ),
                            ),
                          ])),
                    ),
                  ),
                  submitButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  submitButton() {
    return Center(
        child: ButtonTheme(
            height: 40.0,
            child: ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Wrap(children: [
                    Text(
                      'SEND',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child:
                          Icon(Icons.arrow_forward_rounded, color: Colors.grey),
                    )
                  ]),
                ),
                onPressed: () {
                  _fbKey.currentState!.save();
                  if (_fbKey.currentState!.validate()) {
                    BlocProvider.of<CommentBloc>(context).add(
                        CommentButtonPressed(
                            name: nameController.text,
                            email: emailController.text,
                            comment: commentController.text));
                  }
                })));
  }
}
