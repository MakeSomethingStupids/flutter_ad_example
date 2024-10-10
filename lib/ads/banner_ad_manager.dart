import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdManager {
  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  bool get isBannerAdReady => _isBannerAdReady;
  BannerAd get bannerAd => _bannerAd;

  void loadBannerAd(Function onAdLoaded) {
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      request: AdRequest(),
      size: AdSize.mediumRectangle,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          _isBannerAdReady = true;
          onAdLoaded();
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print('Failed to load a banner ad: $error');
        },
      ),
    )..load();
  }

  void dispose() {
    _bannerAd.dispose();
  }
}

