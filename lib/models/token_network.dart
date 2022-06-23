class TokenNetwork {
  final String name;
  final String? networkIconPath;
  final double tokenEquivalent;
  final double usdtEquivalent;
  final double softCap;
  final double hardCap;
  const TokenNetwork({
    required this.name,
    this.networkIconPath,
    required this.tokenEquivalent,
    required this.usdtEquivalent,
    required this.softCap,
    required this.hardCap,
  });
}
