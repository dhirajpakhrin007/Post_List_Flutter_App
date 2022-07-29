part of 'comment_cubit.dart';

abstract class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

class CommentInitial extends CommentState {}

class CommentLoading extends CommentState {}

class CommentLoaded extends CommentState {
  List<CommentModel> comment;
  CommentLoaded({
    required this.comment,
  });
  List<Object> get props => [comment];
}

class CommentError extends CommentState {
  String error;
  CommentError({
    required this.error,
  });
}
