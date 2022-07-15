import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodie/screens/home_Screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() => runApp(Foodie());

class Foodie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FOODIE',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[50],
        primaryColor: Colors.redAccent[700],
//cardColor: Colors.grey[400]!
      ),
      home: HomeScreen(),
      builder: (context, child) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, child!),
        maxWidth: 1200,
        minWidth: 360,
        defaultScale: false,
        breakpoints: [
          const ResponsiveBreakpoint.resize(300, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
      ),
    );
  }
}
