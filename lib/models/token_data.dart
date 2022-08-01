class TokenData {
  TokenData({
    required this.address,
    required this.name,
    required this.symbol,
    required this.decimals,
  });

  String address;
  String name;
  String symbol;
  int decimals;

  factory TokenData.fromJson(Map<String, dynamic> json) => TokenData(
        address: json["address"],
        name: json["name"],
        symbol: json["symbol"],
        decimals: json["decimals"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "name": name,
        "symbol": symbol,
        "decimals": decimals,
      };
}
