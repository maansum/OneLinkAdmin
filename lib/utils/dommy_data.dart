import 'package:onelinkadmin/models/review_model.dart';

List<Review> dummyReviews = [
  Review(
    username: 'Ibrahim Awadallah',
    mediaImage: 'assets/images/facebook.png', // Add media image URL
    date: DateTime.now().subtract(Duration(days: 150)), // 5 months ago
    rating: 5,
    comment:
        'Good food and reasonable prices. My only problem is in the pickup process...',
  ),
  Review(
    username: 'Chris VanDercook',
    mediaImage: 'assets/images/facebook.png',
    date: DateTime.now().subtract(Duration(days: 21)), // 3 weeks ago
    rating: 4,
    comment:
        'I noticed recently that their dining room is back open for the first time since the pandemic...',
  ),
  Review(
    username: 'Sudan Coleman',
    mediaImage: 'assets/images/facebook.png',
    date: DateTime.now().subtract(Duration(days: 30)), // a month ago
    rating: 1,
    comment: 'Used to be a great place to eat, not anymore...',
  ),
  Review(
    username: 'Summer',
    mediaImage: 'assets/images/facebook.png',
    date: DateTime.now().subtract(Duration(days: 270)), // 9 months ago
    rating: 5,
    comment:
        'We already smelled the curry when across the street haha. Food is very delicious...',
  ),
  Review(
    username: 'Aravind Radhakrishna',
    mediaImage: 'assets/images/facebook.png',
    date: DateTime.now().subtract(Duration(days: 1095)), // 3 years ago
    rating: 5,
    comment:
        'The quality of food and taste is great also pretty good hygiene. The service is also nice. Polite Staff is always willing to help. What makes them better from other Indian restaurants is that they are consistent in their quality and service.. So far one of the best Indian restaurants in Charlotte, I love to visit them again. Keep up the good work.',
  ),
];
