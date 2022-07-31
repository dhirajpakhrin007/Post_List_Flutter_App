import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listing_showcase_app/logic/comment_cubit/comment_cubit.dart';
import 'package:listing_showcase_app/logic/list_cubit/list_cubit.dart';
import 'package:listing_showcase_app/logic/user_cubit/user_cubit.dart';
import 'package:listing_showcase_app/presentation/List/list_detail.dart';
import 'package:listing_showcase_app/presentation/Users/users_home.dart';
import 'package:listing_showcase_app/presentation/homepage.dart';
import 'package:listing_showcase_app/presentation/comment/postComment.dart';
import 'package:listing_showcase_app/presentation/comment/showComment.dart';

import 'logic/comment_button_bloc/comment_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ListCubit>(
          create: (context) => ListCubit()..getListData(),
        ),
        BlocProvider<CommentCubit>(
          create: (context) => CommentCubit(),
        ),
        BlocProvider<CommentBloc>(
          create: (context) => CommentBloc(),
        ),
        BlocProvider<UserCubit>(
          create: (context) => UserCubit()..getUserList(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: HomePage.id,
        routes: {
          HomePage.id: (context) => const HomePage(),
          ListDetail.id: (context) => const ListDetail(),
          ShowComment.id: (context) => ShowComment(),
          PostComment.id: (context) => PostComment(),
          UserHome.id: (context) => UserHome(),
        },
      ),
    );
  }
}
