import 'package:flutter/material.dart';
import 'package:onelinkadmin/components/custom_%20review.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CustomReview(),
    );
  }
}
