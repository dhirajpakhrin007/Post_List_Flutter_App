import 'package:dio/dio.dart';

import '../../constant/url.dart';

class ApiService {
  Dio dio = Dio();

  Future getListData() async {
    final listData = await dio.get(listUrl);
    return listData.data;
  }

  Future getComment(int postId) async {
    final listData = await dio.get('$listUrl/$postId/comments');
    return listData.data;
  }
}
