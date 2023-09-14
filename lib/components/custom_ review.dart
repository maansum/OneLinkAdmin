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
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0xFF151515).withOpacity(0.20),
                    offset: const Offset(-4, 0),
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
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff151515)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          // color: Colors.red,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black87, width: 1)),
                      child: Image.asset(
                        'assets/images/facebook-app-symbol.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        review.date.toString(),
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                    children: List.generate(
                        review.rating.floor(),
                        (index) => const Icon(
                              Icons.star,
                              color: Color(0xffFFA200),
                            ))),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  review.comment,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400),
                )
              ],
            ),
          );
        }));
  }
}
