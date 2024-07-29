import 'package:flutter/material.dart';
import 'package:ikura_news/providers/newsindexprovider.dart';
import 'package:ikura_news/screens/news/homepage_news.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NewsIndexProvider())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: "Poppins"),
          home: const HomePageNewsScreen()),
    );
  }
}
