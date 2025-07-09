import 'dart:convert';

NewsResponseModel newsResponseModelFromJson(String str) =>
    NewsResponseModel.fromJson(json.decode(str));

class NewsResponseModel {
  final String status;
  final int totalResults;
  final List<Article> results;

  NewsResponseModel({
    required this.status,
    required this.totalResults,
    required this.results,
  });

  factory NewsResponseModel.fromJson(Map<String, dynamic> json) =>
      NewsResponseModel(
        status: json["status"],
        totalResults: json["totalResults"],
        results:
            List<Article>.from(json["results"].map((x) => Article.fromJson(x))),
      );
}

class Article {
  final String articleId;
  final String title;
  final String link;
  final List<String>? creator; // PERUBAHAN 1: Tipe data diubah
  final String? description;
  final String? content;
  final String pubDate;
  final String? imageUrl;
  final String sourceId;

  Article({
    required this.articleId,
    required this.title,
    required this.link,
    this.creator, // PERUBAHAN 2: Dibuat opsional
    this.description,
    this.content,
    required this.pubDate,
    this.imageUrl,
    required this.sourceId,
  });

  // PERUBAHAN 3: Tambahkan getter untuk mengambil nama penulis dengan aman
  String get authorName {
    if (creator != null && creator!.isNotEmpty) {
      return creator!.first;
    }
    // Jika tidak ada creator, gunakan nama sumber berita sebagai alternatif
    return 'Creator';
  }


  factory Article.fromJson(Map<String, dynamic> json) => Article(
        articleId: json["article_id"],
        title: json["title"],
        link: json["link"],
        creator: json["creator"] == null
            ? null
            : List<String>.from(json["creator"].map((x) => x)),
        description: json["description"],
        content: json["content"],
        pubDate: json["pubDate"],
        imageUrl: json["image_url"],
        sourceId: json["source_id"],
      );
}

// Extension helper untuk membuat huruf pertama kapital
extension StringExtension on String {
  String capitalizeFirst() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}