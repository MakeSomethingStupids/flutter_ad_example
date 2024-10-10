import 'package:flutter/material.dart';
import '../ads/banner_ad_manager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart'; // Make sure this is imported

class BannerScreen extends StatefulWidget {
  @override
  _BannerScreenState createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  final BannerAdManager _bannerAdManager = BannerAdManager();

  @override
  void initState() {
    super.initState();
    _bannerAdManager.loadBannerAd(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _bannerAdManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('배너 광고')),
      body: Column(
        children: [
          Center(
            child: _bannerAdManager.isBannerAdReady
                ? Container(
              alignment: Alignment.center,
              child: AdWidget(ad: _bannerAdManager.bannerAd), // AdWidget is from google_mobile_ads
              width: _bannerAdManager.bannerAd.size.width.toDouble(),
              height: _bannerAdManager.bannerAd.size.height.toDouble(),
            )
                : Text('Loading banner ad...'),
          ),
        ],
      ),
    );
  }
}

