import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ragdalion_news/constant/constant_textstyle_color.dart';
import 'package:ragdalion_news/model/news_reponse_model.dart';

class NewsDetailedPage extends StatelessWidget {
  const NewsDetailedPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil data Article yang dikirim dari halaman sebelumnya
    final Article article = Get.arguments;

    // Format tanggal
    final formattedDate = DateFormat(
      'dd MMM yyyy',
    ).format(DateTime.parse(article.pubDate));

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail News', style: headline1.copyWith(fontSize: 16)),
        backgroundColor: foundationBlueColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sumber dan Tanggal
              Text(
                '${article.sourceId} | $formattedDate',
                style: regular.copyWith(
                  fontSize: 12,
                  color: foundationGreyColor,
                ),
              ),
              const Gap(8),

              // Judul Artikel
              Text(article.title, style: headline1.copyWith(fontSize: 20)),

              const Gap(6),
              // Deskripsi singkat
              Text(
                article.description ?? 'Tidak ada deskripsi',
                style: regular.copyWith(fontSize: 12),
              ),
              Gap(8),
              // Info Penulis
              Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(
                      'https://www.kindpng.com/picc/m/22-223965_no-profile-picture-icon-circle-member-icon-png.png',
                    ),
                  ),
                  const Gap(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.authorName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        article.sourceId,
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(20),

              // Gambar Artikel
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  article.imageUrl ??
                      'https://via.placeholder.com/400x200?text=No+Image',
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      color: Colors.grey[200],
                      child: const Icon(
                        Icons.broken_image,
                        size: 50,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),
              Gap(20),
              // Konten Artikel
              Text(
                article.content ??
                    article.description ??
                    'Konten tidak tersedia.',
                style: regular.copyWith(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
