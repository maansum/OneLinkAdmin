import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:onelinkadmin/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomPageHeader extends StatefulWidget {
  final bool? showOpen;
  const CustomPageHeader({super.key, this.showOpen});

  @override
  State<CustomPageHeader> createState() => _CustomPageHeaderState();
}

class _CustomPageHeaderState extends State<CustomPageHeader> {
  TextStyle tertiaryTextStyle =
      TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.black);
  TextStyle secondaryTextStyle =
      TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.black);
  List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(43, 15, 43, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: SizedBox(
            width: 260,
            height: 67,
            child: Image.asset(
              'assets/images/header_image.png',
              fit: BoxFit.cover,
            ),
          )),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 49,
              ),
              Text(
                '9510 University City Bivd 101\n Charlotte, NC 28213',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              (widget.showOpen == true)
                  ? Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          PopupMenuButton(
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                    child: Container(
                                  padding: EdgeInsets.fromLTRB(17, 16, 17, 21),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'REGURAL HOURS',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      for (int index = 0; index < 6; index++)
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              days[index],
                                              style: tertiaryTextStyle,
                                            ),
                                            Text(
                                              '11AM to 11PM',
                                              style: tertiaryTextStyle,
                                            ),
                                          ],
                                        ),
                                      SizedBox(
                                        height: 9,
                                      ),
                                      Divider(),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Happy Hours',
                                            style: secondaryTextStyle,
                                          ),
                                          Text(
                                            '11AM to 1PM',
                                            style: secondaryTextStyle,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 9,
                                      ),
                                      Divider(),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Take Out',
                                            style: secondaryTextStyle,
                                          ),
                                          Text(
                                            '11AM to 1PM',
                                            style: secondaryTextStyle,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ))
                              ];
                            },
                            child: Row(
                              children: [
                                Text(
                                  'open',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(Icons.keyboard_arrow_down_outlined)
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  : Text('')
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomPageHeaderButton(
                iconPath: 'assets/images/call.png',
                title: 'Call',
                ontap: () async {
                  await FlutterPhoneDirectCaller.callNumber('9287461560');
                },
              ),
              // SizedBox(
              //   width: 12,
              // ),
              InkWell(
                onTap: () async {
                  final urls = Uri.parse('http://passagetoindia.co.uk/');
                  if (await canLaunchUrl(urls)) {
                    try {
                      await launchUrl(urls);
                    } catch (e) {
                      print('error lunching url $e');
                    }
                  }
                },
                child: CustomPageHeaderButton(
                    iconPath: 'assets/images/website.png', title: 'Website'),
              ),
              // SizedBox(
              //   width: 12,
              // ),
              InkWell(
                onTap: () async {
                  final urls = Uri.parse(
                      'https://www.google.com/maps/place/Passage+To+India+Indian+Cuisine/@35.3057174,-80.7260709,17z/data=!3m2!4b1!5s0x88541c07ba59d5a5:0x54f9c0beb747761d!4m14!1m7!3m6!1s0x88541c07baa4174b:0xb6f664d2df280c61!2sPassage+To+India+Indian+Cuisine!8m2!3d35.305713!4d-80.723496!16s%2Fg%2F1v4ptq8l!3m5!1s0x88541c07baa4174b:0xb6f664d2df280c61!8m2!3d35.305713!4d-80.723496!16s%2Fg%2F1v4ptq8l?entry=ttu');
                  if (await canLaunchUrl(urls)) {
                    try {
                      await launchUrl(urls);
                    } catch (e) {
                      print('error lunching url $e');
                    }
                  }
                },
                child: Expanded(
                  child: CustomPageHeaderButton(
                      iconPath: 'assets/images/location.png',
                      title: 'Location'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomPageHeaderButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback? ontap;
  final String title;
  const CustomPageHeaderButton(
      {super.key, required this.iconPath, required this.title, this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 100,
        height: 31,
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: AppColor.backGroundColor,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              height: 12,
              width: 12,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
