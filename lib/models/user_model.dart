import 'package:web3dart/web3dart.dart';

class UserModel {
  final EthereumAddress address;
  final int chainId;
  UserModel({
    required this.address,
    required this.chainId,
  });
}
