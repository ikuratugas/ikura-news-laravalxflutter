class Berita {
  final int id;
  final String title;
  final String description;

  Berita({required this.id, required this.title, required this.description});

// ini untuk merubah dari data json ke dalam bentuk Model Berita
  factory Berita.fromJson(Map<String, dynamic> json) {
    return Berita(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }
}
