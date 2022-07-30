import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:listing_showcase_app/data/model/comment_res_model.dart';
import 'package:listing_showcase_app/data/repository/api_repo.dart';
import 'package:listing_showcase_app/logic/comment_cubit/comment_cubit.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  ApiRepository _apiRepository = ApiRepository();

  CommentBloc() : super(CommentInitial()) {
    on<CommentEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<CommentButtonPressed>(((event, emit) async {
      emit(CommentInitial());
      try {
        final comment = await _apiRepository.getCommentResponse(
            event.name, event.email, event.comment);
        print("comment: $comment");

        emit(CommentFormButtonSubmitted(commentResponseModel: comment));
      } catch (e) {
        emit(CommentFormButtonError(error: e.toString()));
      }
    }));
  }
}
