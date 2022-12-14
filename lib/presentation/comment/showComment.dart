import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listing_showcase_app/constant/colors.dart';
import 'package:listing_showcase_app/constant/style.dart';
import 'package:listing_showcase_app/logic/comment_cubit/comment_cubit.dart';
import 'package:listing_showcase_app/presentation/widget/custom_appbar.dart';

class ShowComment extends StatelessWidget {
  static const String id = 'showComment';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: const CustomAppBar(appBarTitle: "Comment By Post Id"),
      body: BlocBuilder<CommentCubit, CommentState>(
        builder: (context, state) {
          if (state is CommentLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: kprimaryColor,
              ),
            );
          } else if (state is CommentLoaded) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: size.height,
                child: ListView.builder(
                    itemCount: state.comment.length,
                    itemBuilder: ((context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: Text(
                              state.comment[index].id.toString(),
                              style: kListTextStyle,
                            ),
                            title: Text(
                              state.comment[index].name!,
                              style: kListTitleStyle,
                            ),
                            subtitle: Text(
                              state.comment[index].body!,
                              style: kListTextStyle,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                        ],
                      );
                    })),
              ),
            );
          } else if (state is CommentError) {
            return Text(state.error);
          } else {
            return Container(
              child: const Text('Blank'),
            );
          }
        },
      ),
    );
  }
}
