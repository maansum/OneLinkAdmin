import 'package:flutter/material.dart';

class SubscribeTile extends StatelessWidget {
  const SubscribeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.only(top: 25),
      height: 176,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: Color.fromARGB(20, 21, 21, 51),
              width: 1,
              style: BorderStyle.solid)),
      child: Column(
        children: [
          Text(
            'Subscribe Now!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color(0xff151515),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'Receive daily updates & much more!',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff151515),
            ),
          ),
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            clipBehavior: Clip.none,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.only(left: 17.8, bottom: 8),
                height: 42.5,
                width: 275,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15)),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft, // Start from the left side
                    end: Alignment.centerRight, // End on the right side
                    colors: [
                      Color.fromRGBO(21, 21, 21, 0.20),
                      Color.fromRGBO(21, 21, 21, 0.20),
                    ],
                  ),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your email address',
                    hintStyle: TextStyle(
                        fontSize: 13.245, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Positioned(
                  right: -10,
                  bottom: -7,
                  child: ClipRect(
                      child: Image.asset(
                    'assets/images/Black.png',
                    height: 55,
                    width: 55,
                  ))),
            ],
          ),
        ],
      ),
    );
  }
}
