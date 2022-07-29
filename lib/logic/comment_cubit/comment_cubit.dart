import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:listing_showcase_app/data/model/comment_model.dart';
import 'package:listing_showcase_app/data/repository/list_repo.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  ApiRepository listRepository = ApiRepository();

  CommentCubit() : super(CommentInitial());
  getCommentData(int postID) async {
    emit(CommentLoading());
    try {
      final commentData = await listRepository.getCommentFromId(postID);
      emit(CommentLoaded(comment: commentData));
    } catch (e) {
      emit(CommentError(error: e.toString()));
    }
  }
}
