import 'package:flutter/material.dart';
import 'screens/banner_screen.dart';
import 'screens/interstitial_screen.dart';
import 'screens/rewarded_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    BannerScreen(),
    InterstitialScreen(),
    RewardedScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.view_module),
              label: '배너 광고',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fullscreen),
              label: '전면 광고',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              label: '리워드 광고',
            ),
          ],
        ),
      ),
    );
  }
}
