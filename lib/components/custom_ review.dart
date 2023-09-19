// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onelinkadmin/components/subscribe_tile.dart';

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
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 16,
              top: 30,
            ),
            child: SizedBox(height: 200, child: ReviewBuilder()),
          ),
          SizedBox(
            height: 20,
          ),
          SubscribeTile()
        ],
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
                const EdgeInsets.only(right: 0, top: 20, left: 16, bottom: 8),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            // height: 176, //MediaQuery.of(context).size.height * 0.1,
            width: 343, // MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(4, 1),
                    blurRadius: 6.0,
                    color: Color.fromRGBO(22, 21, 21, 0.2),
                  ),
                  BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 6.0,
                    color: Color.fromRGBO(22, 21, 21, 0.2),
                  )
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
                      decoration: const BoxDecoration(
                        // color: Colors.red,
                        shape: BoxShape.circle,
                        // border: Border.all(color: Colors.black87, width: 1),
                      ),
                      child: Image.asset(
                        review.mediaImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        DateFormat('dd MMM, yyyy')
                            .format(review.date)
                            .toString(),
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff990f0f0f),
                          fontWeight: FontWeight.w200,
                        ),
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
                Expanded(
                  child: Text(
                    review.comment,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          );
        }));
  }
}
