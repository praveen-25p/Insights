import 'package:flutter/material.dart';
import 'package:insights_flutter_website/screens/desktop_homescreen.dart';
import 'package:insights_flutter_website/screens/mobile_homescreen.dart';
import 'package:insights_flutter_website/responsive/responsive.dart';
import 'package:insights_flutter_website/services/youtube.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<YoutubeService>(
          create: (_) => YoutubeService(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: Theme(
            data: ThemeData(
              primaryColor: Color.fromRGBO(204, 255, 204, 1),
              textTheme: TextTheme(
                headline1: TextStyle(
                  color: Color.fromRGBO(204, 255, 204, 1),
                  fontSize: 60,
                  fontFamily: 'Glacial',
                  fontWeight: FontWeight.bold,
                ),
                headline2: TextStyle(
                  color: Colors.blue,
                  fontSize: 25,
                  fontFamily: 'Glacial',
                  fontWeight: FontWeight.bold,
                ),
                headline3: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontFamily: 'Glacial',
                ),
                bodyText1: TextStyle(
                  color: Colors.black38,
                  fontSize: 12,
                  fontFamily: 'Glacial',
                ),
              ),
            ),
            child: HomePage()),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktop: DesktopHomeScreen(),
      mobile: MobileHomeScreen(),
      tablet: DesktopHomeScreen(),
    );
  }
}
