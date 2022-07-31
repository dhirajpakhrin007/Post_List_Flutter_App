import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listing_showcase_app/constant/colors.dart';
import 'package:listing_showcase_app/presentation/widget/custom_appbar.dart';

import '../../logic/user_cubit/user_cubit.dart';

class UserDetail extends StatelessWidget {
  static const String id = 'userhome';

  final int index;
  const UserDetail({
    Key? key,
    required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: const CustomAppBar(appBarTitle: 'User Detail'),
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
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        state.users[index].name!,
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: kprimaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.07,
                  ),
                  ListTile(
                    title: const Text(
                      "UserName:",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: kprimaryColor),
                    ),
                    trailing: Text(
                      state.users[index].username!,
                      style: const TextStyle(color: kTextColor),
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      "Email:",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: kprimaryColor),
                    ),
                    trailing: Text(
                      state.users[index].email!,
                      style: const TextStyle(color: kTextColor),
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      "Address:",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: kprimaryColor),
                    ),
                    trailing: Text(
                      "${state.users[index].address!.city!}",
                      style: const TextStyle(color: kTextColor),
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      "Phone:",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: kprimaryColor),
                    ),
                    trailing: Text(
                      state.users[index].phone!,
                      style: const TextStyle(color: kTextColor),
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      "Website:",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: kprimaryColor),
                    ),
                    trailing: Text(
                      state.users[index].website!,
                      style: const TextStyle(color: kTextColor),
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      "Company:",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: kprimaryColor),
                    ),
                    trailing: Text(
                      state.users[index].company!.name!,
                      style: const TextStyle(color: kTextColor),
                    ),
                  ),
                ],
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
