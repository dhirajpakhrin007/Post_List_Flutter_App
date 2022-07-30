part of 'comment_bloc.dart';

abstract class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

class CommentInitial extends CommentState {}

class CommentFromBottonPressed extends CommentState {}

class CommentFormButtonSubmitted extends CommentState {
  CommentResponseModel commentResponseModel;
  CommentFormButtonSubmitted({
    required this.commentResponseModel,
  });
}

class CommentFormButtonError extends CommentState {
  String error;
  CommentFormButtonError({
    required this.error,
  });
}
