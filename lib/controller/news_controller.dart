import 'package:get/get.dart';
import 'package:ragdalion_news/model/news_reponse_model.dart';
import 'package:ragdalion_news/services/news_service.dart';

class NewsController extends GetxController {
  final NewsService _newsService = NewsService();

  var articles = <Article>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  void fetchNews() async {
    try {
      isLoading(true);
      var fetchedNews = await _newsService.getNews();
      if (fetchedNews.isNotEmpty) {
        articles.assignAll(fetchedNews);
      }
    } finally {
      isLoading(false);
    }
  }
}
