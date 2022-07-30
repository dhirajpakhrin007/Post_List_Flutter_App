part of 'comment_bloc.dart';

abstract class CommentEvent extends Equatable {
  const CommentEvent();

  @override
  List<Object> get props => [];
}

class CommentLoaded extends CommentEvent {
  @override
  List<Object> get props => [];
}

class CommentButtonPressed extends CommentEvent {
  final String name;
  final String email;
  final String comment;
  CommentButtonPressed({
    required this.name,
    required this.email,
    required this.comment,
  });

  @override
  List<Object> get props => [name];
}
