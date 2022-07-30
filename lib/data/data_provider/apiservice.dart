import 'package:dio/dio.dart';
import '../../constant/url.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class ApiService {
  Dio dio = Dio();
  DioCacheManager dioCacheManager = DioCacheManager(CacheConfig());
  Options cacheOptions =
      buildCacheOptions(const Duration(days: 30), forceRefresh: true);

  // for getting the list of all post
  Future getListData() async {
    dio.interceptors.add(dioCacheManager.interceptor);
    final listData = await dio.get(listUrl, options: cacheOptions);
    return listData.data;
  }

  // for getting the list of comment for given post_id
  Future getComment(int postId) async {
    dio.interceptors.add(dioCacheManager.interceptor);
    final listData =
        await dio.get('$listUrl/$postId/comments', options: cacheOptions);
    return listData.data;
  }

  // for posting comment in the server
  Future commentPostApi(String name, String email, String comment) async {
    var response = await dio.post(commentPost,
        data: {"name": name, "email": email, "body": comment},
        options: Options(headers: {
          'content-Type': 'application/json',
        }));
    return response.data;
  }

  // for getting the list of the users
  Future usersListApi() async {
    dio.interceptors.add(dioCacheManager.interceptor);
    var response = await dio.get(userList, options: cacheOptions);
    return response.data;
  }
}
