import 'package:flutter/material.dart';
import 'package:ikura_news/providers/newsindexprovider.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NewsIndexProvider>(
        builder: (context, provider, child) {
          if (provider.beritaList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: provider.beritaList.length,
                itemBuilder: (context, index) {
                  final berita = provider.beritaList[index];
                  return ListTile(
                    title: Text(berita.title),
                    subtitle: Text(berita.description),
                  );
                });
          }
        },
      ),
    );
  }
}
