// ignore: file_names
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomHomePageTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final Color color1;
  final Color color2;

  CustomHomePageTile(
      {super.key,
      required this.color1,
      required this.color2,
      required this.imagePath,
      required this.title,
      required this.subtitle});

  final TextStyle titleTextStyle =
      TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600);
  final TextStyle subTitleTextStyle =
      TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500);

  // const CustomHomePageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 64,
      margin: EdgeInsets.fromLTRB(20, 16, 16, 0),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              offset: Offset(3.00565, 3.00565),
              blurRadius: 15.27119,
              color: Color.fromRGBO(57, 123, 249, 0.45),
            ),
          ],
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color1, color2])),
      child: Row(
        children: [
          Image.asset(imagePath),
          SizedBox(
            width: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: titleTextStyle,
              ),
              Text(
                subtitle,
                style: subTitleTextStyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}
