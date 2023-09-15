import 'package:flutter/material.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => RatingPageState();
}

class RatingPageState extends State<RatingPage> {
  int ratingsClicked = 0;
  List<String> images = [
    'assets/images/fb.png',
    'assets/images/yelp.png',
    'assets/images/google.png',
    'assets/images/tripAdvisor.png'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Placeholder(
                  fallbackHeight: 200,
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: 448,
                  width: 390,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                  ),
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
                          (index) => IconButton(
                              onPressed: () {
                                setState(() {
                                  ratingsClicked = index + 1 == ratingsClicked
                                      ? 0
                                      : index + 1;
                                });
                              },
                              icon: Icon(
                                ratingsClicked > index
                                    ? Icons.star
                                    : Icons.star_border,
                                size: 40,
                                color: ratingsClicked > index
                                    ? const Color(0xffFFA200)
                                    : const Color(0xff151515),
                              )),
                        ),
                      ),
                      if (ratingsClicked < 4) ...[
                        const SizedBox(
                          height: 28,
                        ),
                        const CustomTextFormField(
                            labelText: 'Name', hintText: 'Type Name'),
                        const SizedBox(height: 24),
                        const CustomTextFormField(
                            labelText: 'Email', hintText: 'Type email address'),
                      ],
                      const SizedBox(height: 24),
                      if (ratingsClicked == 2 || ratingsClicked == 3)
                        const CustomTextFormField(
                            labelText: 'How do you feel? ',
                            hintText:
                                'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.'),
                      if (ratingsClicked < 2)
                        const CustomTextFormField(
                            labelText: 'How can we resolve your problem',
                            hintText: 'Leave us a review'),
                      if (ratingsClicked == 4 || ratingsClicked == 5)
                        ListView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Image.asset(images[index * 2]),
                                Image.asset(images[index * 2 + 1]),
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
                                    color: const Color(0xffED0000)
                                        .withOpacity(0.25),
                                    offset: const Offset(12, 4),
                                    blurRadius: 12,
                                  ),
                                  BoxShadow(
                                    color: const Color(0xffED0000)
                                        .withOpacity(0.25),
                                    offset: const Offset(8, 4),
                                    blurRadius: 12,
                                  ),
                                  BoxShadow(
                                    color: const Color(0xffffffff)
                                        .withOpacity(0.25),
                                    offset: const Offset(-4, -4),
                                    blurRadius: 8,
                                  ),
                                  BoxShadow(
                                    color: const Color(0xffffffff)
                                        .withOpacity(0.25),
                                    offset: const Offset(-8, -8),
                                    blurRadius: 12,
                                  ),
                                ]),
                          ),
                          const SizedBox(width: 16),
                          if (ratingsClicked < 3)
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
    final formTextStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Color(0xFF151515),
    );
    return Column(
      children: [
        Row(
          children: [
            Text(
              labelText,
              style: formTextStyle,
            ),
            const Text(
              '*',
              style: TextStyle(
                color: Color(0xFFEA0E0E),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
