import 'package:flutter/material.dart';
import 'package:onelinkadmin/components/custom_pageHeader.dart';
import 'package:onelinkadmin/models/ratings_model.dart';
import 'package:provider/provider.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => RatingPageState();
}

class RatingPageState extends State<RatingPage> {
  List<String> images = [
    'assets/images/fb_tile.png',
    'assets/images/yelp.png',
    'assets/images/google.png',
    'assets/images/tripAdvisor.png'
  ];
  @override
  Widget build(BuildContext context) {
    int ratingClicked = Provider.of<RatingsChangeNotifier>(context).rating;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomPageHeader(),
              const SizedBox(
                height: 25,
              ),
              Container(
                // height: 448,
                width: 390,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50.0, vertical: 24),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xff151515).withOpacity(0.25),
                          offset: const Offset(4, 4),
                          blurRadius: 15,
                          spreadRadius: 0),
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        'Review Us',
                        style: TextStyle(
                          fontSize: 24,
                          height: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16),
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
                              },
                              icon: Icon(
                                ratingClicked > index
                                    ? Icons.star
                                    : Icons.star_border,
                                size: 40,
                                color: ratingClicked > index
                                    ? const Color(0xffFFA200)
                                    : const Color(0xff151515),
                              )),
                        ),
                      ),
                    ),
                    if (ratingClicked < 4) ...[
                      const SizedBox(
                        height: 28.0,
                      ),
                      const CustomTextFormField(
                          labelText: 'Name', hintText: 'Type Name'),
                      const SizedBox(height: 24.0),
                      const CustomTextFormField(
                          labelText: 'Email', hintText: 'Type email address'),
                      const SizedBox(height: 24.0),
                      const CustomTextFormField(
                          labelText: 'Phone Number',
                          hintText: 'Type phone number'),
                    ],
                    const SizedBox(height: 24.0),
                    if (ratingClicked == 2 || ratingClicked == 3)
                      const CustomTextFormField(
                          labelText: 'How do you feel? ',
                          hintText:
                              'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.'),
                    if (ratingClicked < 2)
                      const CustomTextFormField(
                          labelText: 'How can we resolve your problem',
                          hintText: 'Leave us a review'),
                    if (ratingClicked == 4 || ratingClicked == 5)
                      ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Expanded(child: Image.asset(images[index * 2])),
                              Expanded(
                                  child: Image.asset(images[index * 2 + 1])),
                            ],
                          );
                        },
                      ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomActionButton(
                          buttonName: 'Cancel',
                          boxDecoration: BoxDecoration(
                              color: const Color(0xffED0000),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color(0xffED0000).withOpacity(0.25),
                                  offset: const Offset(12, 4),
                                  blurRadius: 12,
                                ),
                                BoxShadow(
                                  color:
                                      const Color(0xffED0000).withOpacity(0.25),
                                  offset: const Offset(8, 4),
                                  blurRadius: 12,
                                ),
                                BoxShadow(
                                  color:
                                      const Color(0xffffffff).withOpacity(0.25),
                                  offset: const Offset(-4, -4),
                                  blurRadius: 8,
                                ),
                                BoxShadow(
                                  color:
                                      const Color(0xffffffff).withOpacity(0.25),
                                  offset: const Offset(-8, -8),
                                  blurRadius: 12,
                                ),
                              ]),
                        ),
                        const SizedBox(width: 16),
                        if (ratingClicked < 3)
                          CustomActionButton(
                            buttonName: 'Submit',
                            boxDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xFF15D24A),
                              boxShadow: [
                                const BoxShadow(
                                  color: Color(0x3F15D34A),
                                  blurRadius: 12,
                                  offset: Offset(4, 4),
                                  spreadRadius: 0,
                                ),
                                const BoxShadow(
                                  color: Color(0x2615D34A),
                                  blurRadius: 8,
                                  offset: Offset(4, 4),
                                  spreadRadius: 0,
                                ),
                                const BoxShadow(
                                  color: Color(0xBFFFFFFF),
                                  blurRadius: 8,
                                  offset: Offset(-4, -4),
                                  spreadRadius: 0,
                                ),
                                const BoxShadow(
                                  color: Color(0x3FFFFFFF),
                                  blurRadius: 12,
                                  offset: Offset(-8, -8),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                          )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomActionButton extends StatelessWidget {
  final BoxDecoration? boxDecoration;
  final String buttonName;

  const CustomActionButton({
    super.key,
    this.boxDecoration,
    required this.buttonName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        width: 122,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: boxDecoration,
        child: Text(
          buttonName,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.1,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  const CustomTextFormField({
    Key? key,
    required this.labelText,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formTextStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Color(0xFF151515),
    );
    final hintTextStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Color(0xFF151515),
    );
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: labelText,
                  style: formTextStyle,
                ),
                TextSpan(
                  text: '*',
                  style: TextStyle(
                    color: Color(0xFFEA0E0E),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        TextFormField(
          decoration:
              InputDecoration(hintText: hintText, hintStyle: hintTextStyle),
        ),
      ],
    );
  }
}
