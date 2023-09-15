import 'package:onelinkadmin/models/review_model.dart';

final List<Review> dummyReviews = [
  Review(
    username: 'User1',
    mediaImage: 'assets/images/facebook.png',
    date: DateTime(2023, 9, 14),
    rating: 5,
    comment: 'This app is amazing!',
  ),
  Review(
    username: 'User2',
    mediaImage: 'assets/images/facebook.png',
    date: DateTime(2023, 9, 15),
    rating: 5.0,
    comment: 'The best app I have ever used!',
  ),
  Review(
    username: 'User3',
    mediaImage: 'assets/images/facebook.png',
    date: DateTime(2023, 9, 16),
    rating: 3.8,
    comment: "It's pretty good, but could use some improvements.",
  ),
  Review(
    username: 'User4',
    mediaImage: 'assets/images/facebook.png',
    date: DateTime(2023, 9, 17),
    rating: 4.0,
    comment: 'I like it. Simple and effective.',
  ),
  Review(
    username: 'User5',
    mediaImage: 'assets/images/facebook.png',
    date: DateTime(2023, 9, 18),
    rating: 2.5,
    comment: 'Needs a lot of work. Not satisfied.',
  ),
];
