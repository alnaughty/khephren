import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kprn/extensions/string.dart';
import 'package:kprn/extensions/test_connect.dart';
import 'package:kprn/models/user_model.dart';
import 'package:kprn/services/extension/credentials.dart';
import 'package:kprn/services/implemetation/eth_connector.dart';
import 'package:kprn/view_models/logged_user_vm.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:web3dart/web3dart.dart';

class WalletConnectService {
  WalletConnectService._singleton();
  static final WalletConnectService _instance =
      WalletConnectService._singleton();
  static WalletConnectService get instance => _instance;
  final TestConnector connector = EthereumTestConnector();

  final LoggedUserVm _vm = LoggedUserVm.instance;

  Future<void> connect(context) async {
    listen();
    await connector.connect(context).then((value) {
      print("VALUE : $value");
    });
  }

  listen() {
    connector.registerListeners(
      /// On connect
      (SessionStatus status) {
        if (status.accounts.isNotEmpty) {
          final UserModel _user = UserModel(
            address: EthereumAddress.fromHex(status.accounts[0]),
            chainId: status.chainId,
          );
          // _provider = EthereumWalletConnectProvider(
          //   connector!,
          //   chainId: event.chainId,
          // );
          print("CHAIN ID CONNECTED : ${status.chainId}");
          _vm.populate(_user);
        } else {
          // rejectSession();
          _vm.populate(null);
        }
      },

      /// On Update Session
      (WCSessionUpdateResponse response) {},

      /// On Disconnect
      () async {
        _vm.populate(null);
      },
    );
  }
}
