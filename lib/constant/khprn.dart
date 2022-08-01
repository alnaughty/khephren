import 'package:flutter/foundation.dart';

final BigInt constantInt = BigInt.from(1000000000000000000);
const String rpcUrl = kDebugMode || kProfileMode
    ? "https://data-seed-prebsc-1-s1.binance.org:8545/"
    : "https://bsc-dataseed1.binance.org/";
