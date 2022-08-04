import 'package:flutter/material.dart';
import 'package:kprn/models/abi_model/sales/salesContract.g.dart';
import 'package:kprn/services/extension/credentials.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:web3dart/web3dart.dart';

abstract class TestConnector {
  Future<SessionStatus?> connect(BuildContext context);

  Future<String?> sendTestingAmount({
    required String recipientAddress,
    required double amount,
  });

  Future<String?> purchaseSale({
    required String recipientAddress,
    required double amount,
    required SalesContract contract,
  });

  Future<void> openWalletApp();

  Future<double> getBalance();

  bool validateAddress({required String address});

  String get faucetUrl;

  String get address;

  String get coinName;

  EthereumWalletConnectProvider get provider;
  WalletConnectEthereumCredentials get credentialsProvided;

  void registerListeners(
    OnConnectRequest? onConnect,
    OnSessionUpdate? onSessionUpdate,
    OnDisconnect? onDisconnect,
  );
}
