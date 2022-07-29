import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:listing_showcase_app/data/model/list_model.dart';
import 'package:listing_showcase_app/data/repository/list_repo.dart';

part 'list_cubit_state.dart';

class ListCubit extends Cubit<ListCubitState> {
  ApiRepository listRepository = ApiRepository();

  ListCubit() : super(ListCubitInitial());

  getListData() async {
    try {
      emit(ListCubitLoading());
      final listData = await listRepository.getListOfData();
      listData.isEmpty
          ? emit(ListCubitError(error: 'The data is empty'))
          : emit(ListCubitLoaded(list: listData));
    } catch (e) {
      emit(ListCubitError(error: e.toString()));
    }
  }
}
