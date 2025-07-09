import 'package:dio/dio.dart';
import 'package:ragdalion_news/constant/constant_textstyle_color.dart';
import 'package:ragdalion_news/model/news_reponse_model.dart';

class NewsService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://newsdata.io/api/1/news';

  Future<List<Article>> getNews() async {
    try {
      final response = await _dio.get(
        _baseUrl,
        queryParameters: {
          'apikey': newsApiKey,
          'country': 'id',
          'language': 'id',
        },
      );

      if (response.statusCode == 200) {
        final newsResponse = NewsResponseModel.fromJson(response.data);
        return newsResponse.results;
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      throw Exception('Failed to load news: $e');
    }
  }
}
