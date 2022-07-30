import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      appBar: AppBar(
        title: Text("User Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is UserLoaded) {
              return Column(
                children: [
                  Hero(
                      tag: 'name',
                      child: Text(
                        state.users[index].name!,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  SizedBox(
                    height: size.height * 0.09,
                  ),
                  ListTile(
                    title: Text(
                      "UserName:",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w500),
                    ),
                    trailing: Text(state.users[index].username!),
                  ),
                  ListTile(
                    title: Text(
                      "Email:",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w500),
                    ),
                    trailing: Text(state.users[index].email!),
                  ),
                  ListTile(
                    title: Text(
                      "Address:",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w500),
                    ),
                    trailing: Text(
                        "${state.users[index].address!.city!}, ${state.users[index].address!.street!}"),
                  ),
                  ListTile(
                    title: Text(
                      "Phone:",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w500),
                    ),
                    trailing: Text(state.users[index].phone!),
                  ),
                  ListTile(
                    title: Text(
                      "Website:",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w500),
                    ),
                    trailing: Text(state.users[index].website!),
                  ),
                  ListTile(
                    title: Text(
                      "Company:",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w500),
                    ),
                    trailing: Text(state.users[index].company!.name!),
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
