import 'dart:convert';

import 'package:listing_showcase_app/data/data_provider/apiservice.dart';
import 'package:listing_showcase_app/data/model/comment_model.dart';
import 'package:listing_showcase_app/data/model/comment_res_model.dart';
import 'package:listing_showcase_app/data/model/user_model.dart';

import '../model/list_model.dart';

class ApiRepository {
  ApiService _apiService = ApiService();

  Future<List<ListModel>> getListOfData() async {
    List<dynamic> list = await _apiService.getListData();

    final List<ListModel> datalist =
        list.map((e) => ListModel.fromJson(e)).toList();
    return datalist;
  }

  Future<List<CommentModel>> getCommentFromId(int id) async {
    List<dynamic> comment = await _apiService.getComment(id);

    final List<CommentModel> comments =
        comment.map((e) => CommentModel.fromJson(e)).toList();
    return comments;
  }

  Future<CommentResponseModel> getCommentResponse(name, email, comment) async {
    var response = await _apiService.commentPostApi(name, email, comment);

    var com = CommentResponseModel.fromJson(response);
    return com;
  }

  Future<List<UserModel>> getUserList() async {
    List<dynamic> user = await _apiService.usersListApi();
    final List<UserModel> users =
        user.map((e) => UserModel.fromJson(e)).toList();
    return users;
  }
}
