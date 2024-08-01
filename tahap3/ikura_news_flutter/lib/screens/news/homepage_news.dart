import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ikura_news/configuration/dataconfig.dart';
import 'package:ikura_news/providers/newsindexprovider.dart';
import 'package:ikura_news/screens/news/newsdetail_screen.dart';
import 'package:provider/provider.dart';

class HomePageNewsScreen extends StatelessWidget {
  const HomePageNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          text: const TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'イクラル ', // Kanji text
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                  fontSize: 20, // Adjust font size as needed
                ),
              ),
              TextSpan(
                text: ' News', // "News" text
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20, // Adjust font size as needed
                ),
              ),
            ],
          ),
        ),
      ),
      body: Consumer<NewsIndexProvider>(
        builder: (context, provider, child) {
          if (provider.beritaList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final beritaList = provider.beritaList;
            final carouselItems = beritaList.take(3).toList();
            final listItems = beritaList.skip(3).toList();

            return Column(
              children: [
                // Top 40% for Carousel Slider
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.92,
                  child: CarouselSlider.builder(
                    itemCount: carouselItems.length,
                    itemBuilder: (context, index, realIndex) {
                      final berita = carouselItems[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NewsDetailScreen(berita: berita),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25.0),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Image.network(
                                  '${localhostnya}storage/${berita.image}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 80,
                                left: 10,
                                right: 10,
                                child: Container(
                                  color: Colors.black54,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      berita.title,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 4),
                      enlargeCenterPage: true,
                      viewportFraction: 1.0,
                      aspectRatio: 1.0,
                    ),
                  ),
                ),
                // Bottom 60% for List of News
                const SizedBox(
                  height: 16.0,
                ),
                Expanded(
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo) {
                      if (!provider.hasMore) {
                        return false;
                      }
                      if (scrollInfo.metrics.pixels ==
                          scrollInfo.metrics.maxScrollExtent) {
                        provider.loadMore();
                        return true;
                      }
                      return false;
                    },
                    child: ListView.builder(
                      itemCount: listItems.length,
                      itemBuilder: (context, index) {
                        final berita = listItems[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    NewsDetailScreen(berita: berita),
                              ),
                            );
                          },
                          child: Card(
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            child: SizedBox(
                              width: double.infinity,
                              height: 120, // Adjust height as needed
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.network(
                                      '${localhostnya}storage/${berita.image}',
                                      fit: BoxFit.cover,
                                      width: 120, // Adjust width as needed
                                      height: 120, // Adjust height as needed
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0,
                                          bottom: 8.0,
                                          right: 8.0,
                                          left: 16.0),
                                      child: Text(
                                        berita.title,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
