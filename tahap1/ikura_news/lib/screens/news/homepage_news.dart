import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
        title: const Text('イクラル News'),
      ),
      body: Consumer<NewsIndexProvider>(
        builder: (context, provider, child) {
          if (provider.beritaList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              children: [
                // Top 40% for Carousel Slider
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.92,
                  child: CarouselSlider.builder(
                    // itemCount: provider.beritaList.length,
                    itemCount: 3,
                    itemBuilder: (context, index, realIndex) {
                      final berita = provider.beritaList[index];
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
                                  'https://images.unsplash.com/photo-1519241047957-be31d7379a5d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fEhhY2tlcnxlbnwwfHwwfHx8MA%3D%3D',
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
                  child: ListView.builder(
                    itemCount: provider.beritaList.length - 3,
                    itemBuilder: (context, index) {
                      final berita = provider.beritaList[index + 3];
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
                                    'https://images.unsplash.com/photo-1519241047957-be31d7379a5d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fEhhY2tlcnxlbnwwfHwwfHx8MA%3D%3D', // Replace with actual image URL
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
              ],
            );
          }
        },
      ),
    );
  }
}
