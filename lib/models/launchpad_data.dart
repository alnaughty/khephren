import 'dart:convert';

import 'package:kprn/models/token_data.dart';

class LaunchpadData {
  LaunchpadData({
    required this.saleAddress,
    required this.saleToken,
    required this.dexRouter,
    required this.startDate,
    required this.endDate,
    required this.presaleRate,
    required this.listingRate,
    required this.tokenForSale,
    required this.tokenForLiquidity,
    required this.softCap,
    required this.hardCap,
    required this.minBuy,
    required this.maxBuy,
    required this.liquidityPercent,
    required this.liquidityLockupTime,
    required this.projectDetails,
    required this.type,
    required this.whitelist,
    required this.state,
    required this.chainId,
    required this.verified,
    required this.token,
  });

  String saleAddress;
  String saleToken;
  String dexRouter;
  DateTime startDate;
  DateTime endDate;
  double presaleRate;
  double listingRate;
  int tokenForSale;
  double tokenForLiquidity;
  double softCap;
  double hardCap;
  double minBuy;
  double maxBuy;
  int liquidityPercent;
  int liquidityLockupTime;
  List<dynamic> projectDetails;
  String type;
  int whitelist;
  int state;
  int chainId;
  int verified;
  TokenData token;

  factory LaunchpadData.fromJson(Map<String, dynamic> json) => LaunchpadData(
        saleAddress: json["sale_address"],
        saleToken: json["sale_token"],
        dexRouter: json["dex_router"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        presaleRate: json["presale_rate"].toDouble(),
        listingRate: json["listing_rate"].toDouble(),
        tokenForSale: json["token_for_sale"],
        tokenForLiquidity: json["token_for_liquidity"].toDouble(),
        softCap: json["soft_cap"].toDouble(),
        hardCap: json["hard_cap"].toDouble(),
        minBuy: json["min_buy"].toDouble(),
        maxBuy: json["max_buy"].toDouble(),
        liquidityPercent: json["liquidity_percent"],
        liquidityLockupTime: json["liquidity_lockup_time"],
        projectDetails: json["project_details"] != null
            ? jsonDecode(json["project_details"])
            : [],
        type: json["type"],
        whitelist: json["whitelist"],
        state: json["state"],
        chainId: json["chain_id"],
        verified: json["verified"],
        token: TokenData.fromJson(json["token"]),
      );

  Map<String, dynamic> toJson() => {
        "sale_address": saleAddress,
        "sale_token": saleToken,
        "dex_router": dexRouter,
        "start_date": startDate.toIso8601String(),
        "end_date": endDate.toIso8601String(),
        "presale_rate": presaleRate,
        "listing_rate": listingRate,
        "token_for_sale": tokenForSale,
        "token_for_liquidity": tokenForLiquidity,
        "soft_cap": softCap,
        "hard_cap": hardCap,
        "min_buy": minBuy,
        "max_buy": maxBuy,
        "liquidity_percent": liquidityPercent,
        "liquidity_lockup_time": liquidityLockupTime,
        "project_details": projectDetails,
        "type": type,
        "whitelist": whitelist,
        "state": state,
        "chain_id": chainId,
        "verified": verified,
        "token": token.toJson(),
      };
}
