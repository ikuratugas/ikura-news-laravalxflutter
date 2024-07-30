class Berita {
  final int id;
  final String title;
  final String description;
  final String? image; // Add the image field

  Berita({
    required this.id,
    required this.title,
    required this.description,
    this.image, // Optional field
  });

  // Factory constructor to create a Berita instance from JSON
  factory Berita.fromJson(Map<String, dynamic> json) {
    return Berita(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'], // Parse the image URL from JSON
    );
  }
}
