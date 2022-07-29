import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listing_showcase_app/logic/comment_cubit/comment_cubit.dart';
import 'package:listing_showcase_app/presentation/comment/showComment.dart';

import '../../logic/list_cubit/list_cubit.dart';

class ListDetail extends StatelessWidget {
  static const String id = 'listdetail';

  final int? userId;
  const ListDetail({
    Key? key,
    this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("List Detail"),
      ),
      body: BlocBuilder<ListCubit, ListCubitState>(
        builder: (context, state) {
          if (state is ListCubitLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ListCubitLoaded) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: size.height,
                child: ListView.builder(
                    itemCount: state.list.length,
                    itemBuilder: ((context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            onTap: () {
                              BlocProvider.of<CommentCubit>(context)
                                  .getCommentData(state.list[index].id!);
                              Navigator.pushNamed(context, ShowComment.id);
                            },
                            leading: Text(state.list[index].id.toString()),
                            title: Text(state.list[index].title!),
                            subtitle: Text(state.list[index].body!),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                        ],
                      );
                    })),
              ),
            );
          } else if (state is ListCubitError) {
            return Text(state.error);
          } else {
            return Container(
              child: Text('Blank'),
            );
          }
        },
      ),
    );
  }
}
