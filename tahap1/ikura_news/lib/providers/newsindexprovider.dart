import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ikura_news/models/berita.dart';

class NewsIndexProvider extends ChangeNotifier {
  List<Berita> _beritaList = [];

  List<Berita> get beritaList => _beritaList;

  NewsIndexProvider() {
    fetchBerita();
  }

  Future<void> fetchBerita() async {
    final response = await http.get(Uri.parse('http://localhost:8000/news'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      _beritaList = data.map((json) => Berita.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to Load Data');
    }
  }
}
