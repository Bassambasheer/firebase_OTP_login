import 'package:aiolos/core/constant%20widgets/textwidget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TextWidget(txt: "HomePage"),
      ),
    );
  }
}
