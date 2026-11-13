class Book {
  const Book({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    required this.rating,
    required this.description,
  });

  final int id;
  final String title;
  final String author;
  final String category;
  final double rating;
  final String description;
}
