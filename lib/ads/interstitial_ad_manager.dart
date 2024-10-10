import 'package:google_mobile_ads/google_mobile_ads.dart';

class InterstitialAdManager {
  late InterstitialAd _interstitialAd;
  bool _isInterstitialAdReady = false;

  bool get isInterstitialAdReady => _isInterstitialAdReady;

  void loadInterstitialAd(Function onAdLoaded) {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/1033173712',
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _isInterstitialAdReady = true;
          onAdLoaded();
        },
        onAdFailedToLoad: (error) {
          print('Failed to load an interstitial ad: $error');
        },
      ),
    );
  }

  void showInterstitialAd() {
    if (_isInterstitialAdReady) {
      _interstitialAd.show();
      _interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          loadInterstitialAd(() {}); // Reload after dismissal
        },
      );
    } else {
      print('Interstitial Ad is not ready yet');
    }
  }

  void dispose() {
    _interstitialAd.dispose();
  }
}
