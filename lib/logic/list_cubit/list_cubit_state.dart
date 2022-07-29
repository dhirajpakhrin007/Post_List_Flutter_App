part of 'list_cubit.dart';

abstract class ListCubitState extends Equatable {
  const ListCubitState();

  @override
  List<Object> get props => [];
}

class ListCubitInitial extends ListCubitState {}

class ListCubitLoading extends ListCubitState {}

class ListCubitLoaded extends ListCubitState {
  final List<ListModel> list;
  ListCubitLoaded({
    required this.list,
  });

  @override
  List<Object> get props => [list];
}

class ListCubitError extends ListCubitState {
  final String error;
  ListCubitError({
    required this.error,
  });
}
