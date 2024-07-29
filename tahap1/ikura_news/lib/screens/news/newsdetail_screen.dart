import 'package:flutter/material.dart';
import 'package:ikura_news/models/berita.dart';

class NewsDetailScreen extends StatelessWidget {
  final Berita berita;

  const NewsDetailScreen({super.key, required this.berita});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image at the top (full width)
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.4, // Adjust height as needed
                  width: MediaQuery.of(context).size.width * 1,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(25.0),
                    ),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1483817101829-339b08e8d83f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fEhhY2tlcnxlbnwwfHwwfHx8MA%3D%3D', // Replace with actual image URL
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                  ),
                ),
                // Title
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    berita.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Description (scrollable)
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    berita.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          // Back Arrow Icon
          Positioned(
            top: 40, // Adjust as needed
            left: 10, // Adjust as needed
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white, // Color of the back arrow
                size: 30, // Size of the back arrow
              ),
              onPressed: () =>
                  Navigator.pop(context), // Go back to previous screen
            ),
          ),
        ],
      ),
    );
  }
}
