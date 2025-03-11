import 'package:dio/dio.dart';
import 'package:my_new_project/model/news_model.dart';
import 'package:my_new_project/utils/api_constants.dart';

class CommonRepository {
  final dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  Future getNewsFeedList(int page) async {
    final request = await dio.get("");
    final NewsFeedModel response = NewsFeedModel.fromJson(request.data);
    return response;
  }
}
