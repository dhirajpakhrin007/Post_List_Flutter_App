part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  List<UserModel> users;
  UserLoaded({
    required this.users,
  });
}

class UserError extends UserState {
  String error;
  UserError({
    required this.error,
  });
}
