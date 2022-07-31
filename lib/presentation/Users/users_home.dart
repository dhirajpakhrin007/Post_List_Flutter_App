import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listing_showcase_app/constant/colors.dart';
import 'package:listing_showcase_app/constant/style.dart';
import 'package:listing_showcase_app/presentation/Users/users_detail.dart';
import 'package:listing_showcase_app/presentation/widget/custom_appbar.dart';

import '../../logic/user_cubit/user_cubit.dart';

class UserHome extends StatelessWidget {
  static const String id = 'userhome';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: const CustomAppBar(
        appBarTitle: "User Home",
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: kprimaryColor,
                ),
              );
            } else if (state is UserLoaded) {
              return Container(
                height: size.height,
                child: ListView.builder(
                    itemCount: state.users.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(
                          state.users[index].id.toString(),
                          style: kListTextStyle,
                        ),
                        title: Text(
                          state.users[index].name!,
                          style: kListTitleStyle,
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UserDetail(
                                            index: index,
                                          )));
                            },
                            icon: const Icon(
                              Icons.remove_red_eye,
                              color: kTextColor,
                              size: 25,
                            )),
                      );
                    }),
              );
            } else if (state is UserError) {
              return Text(state.error);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
