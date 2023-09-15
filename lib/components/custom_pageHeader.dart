// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:onelinkadmin/utils/constants.dart';

class CustomPageHeader extends StatefulWidget {
  final bool? showOpen;
  const CustomPageHeader({super.key, this.showOpen});

  @override
  State<CustomPageHeader> createState() => _CustomPageHeaderState();
}

class _CustomPageHeaderState extends State<CustomPageHeader> {
  TextStyle tertiaryTextStyle =
      TextStyle(fontSize: 8, fontWeight: FontWeight.w400, color: Colors.black);
  TextStyle secondaryTextStyle =
      TextStyle(fontSize: 8, fontWeight: FontWeight.w600, color: Colors.black);
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
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Image.asset(
            'assets/images/header_image.png',
            width: 260,
            height: 67,
          )),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 60,
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
                          Text(
                            'open',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                          PopupMenuButton(
                              itemBuilder: (context) {
                                return [
                                  PopupMenuItem(
                                      child: Container(
                                    padding:
                                        EdgeInsets.fromLTRB(17, 16, 17, 21),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'REGURAL HOURS',
                                          style: TextStyle(
                                              fontSize: 10,
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
                              child: Icon(Icons.keyboard_arrow_down_outlined))
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
            children: const [
              CustomPageHeaderButton(
                  iconPath: 'assets/images/call.png', title: 'Call'),
              CustomPageHeaderButton(
                  iconPath: 'assets/images/website.png', title: 'Website'),
              CustomPageHeaderButton(
                  iconPath: 'assets/images/location.png', title: 'Location'),
            ],
          )
        ],
      ),
    );
  }
}

class CustomPageHeaderButton extends StatelessWidget {
  final String iconPath;
  final String title;
  const CustomPageHeaderButton(
      {super.key, required this.iconPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
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
    );
  }
}
