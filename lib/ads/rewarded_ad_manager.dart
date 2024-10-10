import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardedAdManager {
  late RewardedAd _rewardedAd;
  bool _isRewardedAdReady = false;

  bool get isRewardedAdReady => _isRewardedAdReady;

  void loadRewardedAd(Function onAdLoaded) {
    RewardedAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/5224354917',
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;
          _isRewardedAdReady = true;
          onAdLoaded();
        },
        onAdFailedToLoad: (error) {
          print('Failed to load a rewarded ad: $error');
        },
      ),
    );
  }

  void showRewardedAd() {
    if (_isRewardedAdReady) {
      _rewardedAd.show(onUserEarnedReward: (ad, reward) {
        print('User earned reward: ${reward.amount}');
      });
      _rewardedAd.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          loadRewardedAd(() {}); // Reload after dismissal
        },
      );
    } else {
      print('Rewarded Ad is not ready yet');
    }
  }

  void dispose() {
    _rewardedAd.dispose();
  }
}
