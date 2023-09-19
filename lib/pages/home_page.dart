import 'package:flutter/material.dart';
import 'package:onelinkadmin/components/custom_%20review.dart';
import 'package:onelinkadmin/components/custom_homepageTile.dart';
import 'package:onelinkadmin/components/custom_pageHeader.dart';
import 'package:onelinkadmin/components/subscribe_tile.dart';
import 'package:onelinkadmin/models/ratings_model.dart';
import 'package:onelinkadmin/pages/ratings_page.dart';
import 'package:onelinkadmin/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int ratingsClicked = 0;

  Future<void> _lunchURL(String url) async {
    final urls = Uri.parse(url);
    if (await canLaunchUrl(urls)) {
      try {
        await launchUrl(urls);
      } catch (e) {
        print('error lunching url $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    int ratingsClicked = Provider.of<RatingsChangeNotifier>(context).rating;
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomPageHeader(showOpen: true),
            InkWell(
              onTap: () {
                _lunchURL('https://www.facebook.com/');
              },
              child: CustomHomePageTile(
                  color1: Color(0xff1F00E8),
                  color2: Color(0xff026EB0),
                  imagePath: 'assets/images/fb.png',
                  title: 'Follow us on Facebook',
                  subtitle: 'www.facebook.com'),
            ),
            InkWell(
              onTap: () => _lunchURL('https://www.tiktok.com/'),
              child: CustomHomePageTile(
                  color1: Color(0xffEE1D53),
                  color2: Color(0xff9B0027),
                  imagePath: 'assets/images/tiktok.png',
                  title: 'Follow us on Tiktok',
                  subtitle: 'www.tiktok.com'),
            ),
            InkWell(
              onTap: () =>
                  _lunchURL("https://www.instagram.com/passagetoindia/"),
              child: CustomHomePageTile(
                  color1: Color(0xff962FBF),
                  color2: Color(0xffD62976),
                  imagePath: 'assets/images/insta.png',
                  title: 'Follow us on Instagram',
                  subtitle: 'www.instagram.com'),
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: AddToContactButton(
                title: 'Add To Contact',
                icon: Icon(
                  Icons.person_add,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
                // height: 137,
                width: double.maxFinite,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(4, 4),
                      blurRadius: 11,
                      color: Color.fromRGBO(21, 21, 21, 0.35),
                    ),
                  ],
                ),
                child: Container(
                  // color: Colors.amber,
                  margin: EdgeInsets.symmetric(horizontal: 60, vertical: 24),
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Review Us',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          5,
                          (index) => Expanded(
                            child: IconButton(
                                onPressed: () {
                                  Provider.of<RatingsChangeNotifier>(context,
                                          listen: false)
                                      .setrating(index);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RatingPage(),
                                      ));
                                },
                                icon: Icon(
                                  ratingsClicked > index
                                      ? Icons.star
                                      : Icons.star_border,
                                  size: 30,
                                  color: ratingsClicked > index
                                      ? const Color(0xffFFA200)
                                      : const Color(0xff151515),
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                'Thank You For The Review:',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            SizedBox(height: 176, child: ReviewBuilder()),
            SubscribeTile()
          ],
        ),
      )),
    );
  }
}

class AddToContactButton extends StatelessWidget {
  final Icon icon;
  final String title;

  const AddToContactButton(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 40,
        width: 190,
        decoration: BoxDecoration(
            color: Color(0xff151515), borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
