import 'package:flutter/material.dart';
import '../ads/interstitial_ad_manager.dart';

class InterstitialScreen extends StatefulWidget {
  @override
  _InterstitialScreenState createState() => _InterstitialScreenState();
}

class _InterstitialScreenState extends State<InterstitialScreen> {
  final InterstitialAdManager _interstitialAdManager = InterstitialAdManager();

  @override
  void initState() {
    super.initState();
    _interstitialAdManager.loadInterstitialAd(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('전면 광고')),
      body: Center(
        child: ElevatedButton(
          onPressed: _interstitialAdManager.isInterstitialAdReady
              ? _interstitialAdManager.showInterstitialAd
              : null,
          child: Text('전면 광고 버튼'),
        ),
      ),
    );
  }
}
