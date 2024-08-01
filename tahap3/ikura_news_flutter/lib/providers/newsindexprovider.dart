import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ikura_news/configuration/dataconfig.dart';
import 'package:ikura_news/models/berita.dart';

class NewsIndexProvider extends ChangeNotifier {
  List<Berita> _beritaList = [];
  int _currentPage = 1;
  bool hasMore = true; // Untuk mengecek jika ada berita yang tersisa

  List<Berita> get beritaList => _beritaList;

  NewsIndexProvider() {
    fetchBerita();
  }

  Future<void> fetchBerita({int page = 1}) async {
    // -- untuk di web
    // final response =
    //     await http.get(Uri.parse('http://localhost:8000/news?page=$page'));

    // -- untuk di android (namun harus menyusaikan dengan IP Sekarang yang dipakai)
    final response =
        await http.get(Uri.parse('${localhostnya}news?page=$page'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> beritaData =
          data['data']; // Ambil data dari respons JSON

      if (beritaData.isEmpty) {
        hasMore = false;
      }

      if (page == 1) {
        _beritaList = beritaData.map((json) => Berita.fromJson(json)).toList();
      } else {
        _beritaList
            .addAll(beritaData.map((json) => Berita.fromJson(json)).toList());
      }

      notifyListeners();
    } else {
      throw Exception('Failed to Load Data');
    }
  }

  Future<void> loadMore() async {
    if (hasMore) {
      _currentPage++;
      await fetchBerita(page: _currentPage);
    }
  }
}

// class NewsIndexProvider extends ChangeNotifier {
//   List<Berita> _beritaList = [];

//   List<Berita> get beritaList => _beritaList;

//   NewsIndexProvider() {
//     fetchBerita();
//   }

//   Future<void> fetchBerita() async {
//     final response = await http.get(Uri.parse('http://localhost:8000/news'));

//     if (response.statusCode == 200) {
//       List<dynamic> data = json.decode(response.body);
//       _beritaList = data.map((json) => Berita.fromJson(json)).toList();
//       notifyListeners();
//     } else {
//       throw Exception('Failed to Load Data');
//     }
//   }
// }
