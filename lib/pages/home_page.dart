import 'package:flutter/material.dart';
import 'package:onelinkadmin/components/custom_pageHeader.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // backgroundColor: AppColor.,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [CustomPageHeader()],
      )),
    );
  }
}
