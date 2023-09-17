class Review {
  final String username;
  final String mediaImage;
  final DateTime date;

  final double rating;
  final String comment;

  Review(
      {required this.username,
      required this.mediaImage,
      required this.rating,
      required this.comment,
      required this.date});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      username: json['username'] ?? '',
      mediaImage: json['mediaImage'] ?? '',
      date: DateTime.tryParse(json['date'] ?? '') ?? DateTime.now(),
      rating: (json['rating'] as num).toDouble(),
      comment: json['comment'] ?? '',
    );
  }
}
