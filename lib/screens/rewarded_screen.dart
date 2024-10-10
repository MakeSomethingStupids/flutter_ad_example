import 'package:flutter/material.dart';
import '../ads/rewarded_ad_manager.dart';

class RewardedScreen extends StatefulWidget {
  @override
  _RewardedScreenState createState() => _RewardedScreenState();
}

class _RewardedScreenState extends State<RewardedScreen> {
  final RewardedAdManager _rewardedAdManager = RewardedAdManager();

  @override
  void initState() {
    super.initState();
    _rewardedAdManager.loadRewardedAd(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('리워드 광고')),
      body: Center(
        child: ElevatedButton(
          onPressed: _rewardedAdManager.isRewardedAdReady
              ? _rewardedAdManager.showRewardedAd
              : null,
          child: Text('리워드 광고 버튼'),
        ),
      ),
    );
  }
}
