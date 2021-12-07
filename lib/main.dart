import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funda_property_flutter/constants.dart';
import 'package:funda_property_flutter/screens/property/detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Funda Property Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100,
                height: 50,
                child: SvgPicture.asset(
                  "assets/images/fundawonen-logo.svg",
                  fit: BoxFit.contain,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.account_circle_outlined,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: defaultPadding / 2),
                  ),
                  Icon(
                    Icons.language_rounded,
                    color: Colors.white,
                  )
                ],
              )
            ],
          ),
        ),
        body: const PropertyDetail(),
      ),
    );
  }
}
