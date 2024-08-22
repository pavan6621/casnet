import 'package:flutter/material.dart';
import '../contentdata/home_page_content.dart';
import '../qutions/main_qution.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: NotificationListener<ScrollUpdateNotification>(
        onNotification: (scrollInfo) {
          if (scrollInfo.metrics.pixels <= 0) {
            _pageController.jumpToPage(0);
          }
          return true;
        },
        child: PageView(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            HomePageContent(),
            MainQution(),
          ],
        ),
      ),
    );
  }
}
