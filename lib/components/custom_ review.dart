import 'package:flutter/material.dart';
import 'package:onelinkadmin/models/review_model.dart';

import 'package:onelinkadmin/utils/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:onelinkadmin/utils/dommy_data.dart';

class CustomReview extends StatefulWidget {
  const CustomReview({super.key});

  @override
  State<CustomReview> createState() => _CustomReviewState();
}

class _CustomReviewState extends State<CustomReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          top: 30,
        ),
        child: SizedBox(height: 200, child: ReviewBuilder()),
      ),
    );
  }
}

class ReviewBuilder extends StatelessWidget {
  const ReviewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: ScrollPhysics(),
        itemCount: dummyReviews.length,
        itemBuilder: ((context, index) {
          final review = dummyReviews[index];
          return Container(
            margin:
                const EdgeInsets.only(right: 16, top: 16, left: 16, bottom: 16),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            height: 176, //MediaQuery.of(context).size.height * 0.1,
            width: 343, // MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF151515).withOpacity(0.20),
                    offset: const Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: Color(0xFF151515).withOpacity(0.20),
                    offset: const Offset(-4, -4),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      review.username,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff151515)),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.amber,
                      radius: 10,
                    ),
                    Expanded(
                      child: Text(
                        review.date.toString(),
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 16,
                  child: RatingBar.builder(
                    initialRating: 0,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 3,
                    itemBuilder: (context, index) => SizedBox(
                      height: 5,
                      child: const Icon(
                        Icons.star,
                        size: 5,
                      ),
                    ),
                    onRatingUpdate: (value) {
                      print(value);
                    },
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  review.comment,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                )
              ],
            ),
          );
        }));
  }
}
