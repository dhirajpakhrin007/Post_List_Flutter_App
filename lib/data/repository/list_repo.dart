import 'package:listing_showcase_app/data/data_provider/apiservice.dart';
import 'package:listing_showcase_app/data/model/comment_model.dart';

import '../model/list_model.dart';

class ApiRepository {
  ApiService apiService = ApiService();

  Future<List<ListModel>> getListOfData() async {
    List<dynamic> list = await apiService.getListData();

    final List<ListModel> datalist =
        list.map((e) => ListModel.fromJson(e)).toList();
    return datalist;
  }

  Future<List<CommentModel>> getCommentFromId(int id) async {
    List<dynamic> comment = await apiService.getComment(id);

    final List<CommentModel> comments =
        comment.map((e) => CommentModel.fromJson(e)).toList();
    print("data: $comments");
    return comments;
  }
}
