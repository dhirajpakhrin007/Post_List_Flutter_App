import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:listing_showcase_app/data/model/user_model.dart';
import 'package:listing_showcase_app/data/repository/api_repo.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  ApiRepository _apiRepository = ApiRepository();

  UserCubit() : super(UserInitial());
  void getUserList() async {
    emit(UserLoading());
    try {
      final users = await _apiRepository.getUserList();
      emit(UserLoaded(users: users));
    } catch (e) {
      emit(UserError(error: e.toString()));
    }
  }
}
