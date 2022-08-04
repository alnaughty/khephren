import 'package:ethers/ethers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:kprn/constant/khprn.dart';
import 'package:kprn/extensions/test_connect.dart';
import 'package:kprn/models/abi_model/sales/salesContract.g.dart';
import 'package:kprn/services/extension/credentials.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:walletconnect_qrcode_modal_dart/walletconnect_qrcode_modal_dart.dart';
import 'package:web3dart/web3dart.dart';

class EthereumTestConnector implements TestConnector {
  final Ethers ethers = Ethers();
  EthereumTestConnector() {
    _connector = WalletConnectQrCodeModal(
      connector: WalletConnect(
        bridge: 'https://bridge.walletconnect.org',
        clientMeta: const PeerMeta(
          // <-- Meta data of your app appearing in the wallet when connecting
          name: 'QRCodeModalExampleApp',
          description: 'WalletConnect Developer App',
          url: 'https://walletconnect.org',
          icons: [
            'https://gblobscdn.gitbook.com/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
          ],
        ),
      ),
    );

    _provider = EthereumWalletConnectProvider(_connector.connector);
  }

  @override
  Future<SessionStatus?> connect(BuildContext context) async {
    return await _connector.connect(context, chainId: 3);
  }

  @override
  void registerListeners(
    OnConnectRequest? onConnect,
    OnSessionUpdate? onSessionUpdate,
    OnDisconnect? onDisconnect,
  ) =>
      _connector.registerListeners(
        onConnect: onConnect,
        onSessionUpdate: onSessionUpdate,
        onDisconnect: onDisconnect,
      );
  // WalletConnectEthereumCredentials get credentials =>
  //     WalletConnectEthereumCredentials(provider: _provider);
  @override
  Future<String?> purchaseSale({
    required String recipientAddress,
    required double amount,
    required SalesContract contract,
  }) async {
    final sender =
        EthereumAddress.fromHex(_connector.connector.session.accounts[0]);
    final recipient = EthereumAddress.fromHex(address);

    final etherAmount = EtherAmount.inWei(ethers.utils.parseEther("$amount"));
    print(etherAmount.getInWei);
    final transaction = Transaction(
      // to: recipient,
      from: sender,
      // gasPrice: EtherAmount.inWei(BigInt.one),
      // maxGas: 100000,
      value: etherAmount,
    );
    final credentials = WalletConnectEthereumCredentials(provider: _provider);
    try {
      final String purchase = await contract.purchase(
        credentials: credentials,
        transaction: transaction,
      );
      return purchase;
    } catch (e) {
      print("ERROR");
      return null;
    }
  }

  @override
  Future<String?> sendTestingAmount({
    required String recipientAddress,
    required double amount,
  }) async {
    final sender =
        EthereumAddress.fromHex(_connector.connector.session.accounts[0]);
    final recipient = EthereumAddress.fromHex(address);

    final etherAmount = EtherAmount.fromUnitAndValue(
        EtherUnit.wei, (amount * 1000 * 1000).toInt());

    final transaction = Transaction(
      to: recipient,
      from: sender,
      gasPrice: EtherAmount.inWei(BigInt.one),
      maxGas: 100000,
      value: etherAmount,
    );

    final credentials = WalletConnectEthereumCredentials(provider: _provider);

    // Sign the transaction
    try {
      final txBytes = await _ethereum.sendTransaction(credentials, transaction);
      // final txBytes = await _provider.sendTransaction(from: from)
      print(txBytes);
      return txBytes;
    } catch (e) {
      print('Error: $e');
    }

    // Kill the session
    // _connector.killSession();

    return null;
  }

  @override
  Future<void> openWalletApp() async => await _connector.openWalletApp();

  @override
  Future<double> getBalance() async {
    final address =
        EthereumAddress.fromHex(_connector.connector.session.accounts[0]);
    final amount = await _ethereum.getBalance(address);
    return amount.getValueInUnit(EtherUnit.ether).toDouble();
  }

  @override
  bool validateAddress({required String address}) {
    try {
      EthereumAddress.fromHex(address);
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  String get faucetUrl => 'https://faucet.dimensions.network/';

  @override
  String get address => _connector.connector.session.accounts[0];

  @override
  String get coinName => 'Eth';
  @override
  EthereumWalletConnectProvider get provider => _provider;
  @override
  WalletConnectEthereumCredentials get credentialsProvided =>
      WalletConnectEthereumCredentials(provider: _provider);
  late final WalletConnectQrCodeModal _connector;
  late final EthereumWalletConnectProvider _provider;
  final _ethereum = Web3Client(
    // "https://ropsten.infura.io/v3/9179edb5eced4a4a85549fc6d8f708fb",
    rpcUrl,
    Client(),
  );
}
