import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listing_showcase_app/data/data_provider/apiservice.dart';
import 'package:listing_showcase_app/data/repository/list_repo.dart';
import 'package:listing_showcase_app/logic/comment_cubit/comment_cubit.dart';
import 'package:listing_showcase_app/logic/list_cubit/list_cubit.dart';
import 'package:listing_showcase_app/presentation/List/list_detail.dart';
import 'package:listing_showcase_app/presentation/List/list_home.dart';
import 'package:listing_showcase_app/presentation/comment/showComment.dart';

void main() {
  runApp(const MyApp());
  ApiRepository().getCommentFromId(13);
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
        },
      ),
    );
  }
}
