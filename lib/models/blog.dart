class Blog {
  final String title;
  final String description;
  final String imageUrl;

  Blog({required this.title, required this.description, required this.imageUrl});

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? 'No Description',
      imageUrl: json['image_url'] ?? '',
    );
  }
}
