import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ragdalion_news/constant/constant_textstyle_color.dart';
import 'package:ragdalion_news/controller/news_controller.dart';
import 'package:ragdalion_news/page/news/news_detailed_page.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NewsController());
    return Scaffold(
      appBar: AppBar(
        title: Text('News', style: headline1.copyWith(color: whiteColor)),
        backgroundColor: foundationBlueColor,

        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Breaking News',
                    style: headline1.copyWith(fontSize: 20),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search, size: 28),
                    onPressed: () {},
                  ),
                ],
              ),
              const Gap(10),

              // Daftar Berita
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (controller.articles.isEmpty) {
                    return const Center(
                      child: Text('Tidak ada berita ditemukan.'),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: controller.articles.length,
                      itemBuilder: (context, index) {
                        final article = controller.articles[index];
                        final formattedDate = DateFormat(
                          'dd MMM yyyy',
                        ).format(DateTime.parse(article.pubDate));

                        return Card(
                          elevation: 0,
                          margin: const EdgeInsets.only(bottom: 20.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // --- Gambar Artikel ---
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                                child: Image.network(
                                  article.imageUrl ??
                                      'https://via.placeholder.com/400x200?text=No+Image',
                                  height: 200,
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
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Sumber dan Tanggal
                                    Text(
                                      '${article.sourceId.capitalizeFirst} | $formattedDate',
                                      style: regular.copyWith(
                                        color: foundationGreyColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const Gap(8),

                                    // Judul Artikel
                                    Text(
                                      article.title,
                                      style: headline1.copyWith(fontSize: 16),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const Gap(8),

                                    // Deskripsi
                                    Text(
                                      article.description ??
                                          'Tidak ada deskripsi.',
                                      style: regular.copyWith(
                                        fontSize: 10,
                                        color: neutralColor,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const Gap(12),

                                    // Penulis dan Tombol Read more
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const CircleAvatar(
                                              radius: 15,
                                              backgroundImage: NetworkImage(
                                                'https://www.kindpng.com/picc/m/22-223965_no-profile-picture-icon-circle-member-icon-png.png',
                                              ),
                                            ),
                                            const Gap(8),
                                            Text(
                                              article.authorName,
                                              style: regular.copyWith(
                                                color: neutralColor,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.to(
                                              () => const NewsDetailedPage(),
                                              arguments: article,
                                            );
                                          },
                                          child: const Text(
                                            'Read More...',
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
