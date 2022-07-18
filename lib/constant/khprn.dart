import 'package:flutter/foundation.dart';

final BigInt constantInt = BigInt.from(1000000000000000000);
const String khprnHex = "0x27259Ec212AA7965A8eF366c33F980068f80FF8B";
const String factoryAddress = "0xd90cc078e1Db637e5136E8A2665160479f113931";
const String rpcUrl = kDebugMode || kProfileMode
    ? "https://data-seed-prebsc-1-s1.binance.org:8545/"
    : "https://bsc-dataseed1.binance.org/";
