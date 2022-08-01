import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kprn/extensions/string.dart';
import 'package:kprn/models/user_model.dart';
import 'package:kprn/view_models/logged_user_vm.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:web3dart/web3dart.dart';

class WalletConnectService {
  WalletConnectService._singleton();
  static final WalletConnectService _instance =
      WalletConnectService._singleton();
  static WalletConnectService get instance => _instance;
  final PeerMeta _peerMeta = const PeerMeta(
    name: 'WalletConnect',
    description: 'WalletConnect Developer App',
    url: 'https://walletconnect.org',
    icons: [
      'https://gblobscdn.gitbook.com/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
    ],
  );
  final LoggedUserVm _vm = LoggedUserVm.instance;
  WalletConnect? _connector;
  WalletConnect? get connector => _connector;
  // WalletConnectProvider getProvider() {
  //   // connector.sendCustomRequest(method: method, params: params)
  //   // return WalletConnectProvider(
  //   //   connector: connector!,
  //   // );
  // }

  Future<void> connect() async {
    // _connector!.sendCustomRequest(method: "method", params: []);
    try {
      _connector = WalletConnect(
        bridge: 'https://bridge.walletconnect.org',
        clientMeta: _peerMeta,
      );

      listen();
      return;
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Unable to connect to wallet",
      );
      return;
    }
  }

  approveSession(String address) async {
    /// Connect!
    // Approve session

    try {
      if (!connector!.session.connected) {
        await connector!.approveSession(
          chainId: 4160,
          accounts: [
            address,
          ],
        );
      }
      print("SESSION APPROVED");
    } catch (e) {
      Fluttertoast.showToast(msg: "Unable to approve session");
    }
  }

  rejectSession() async {
    // Reject session
    await connector!.rejectSession(message: 'Account disconnected');
  }

  updateSession(String address) async {
    // Update session
    await connector!.updateSession(
      SessionStatus(
        chainId: 4000,
        accounts: [
          address,
        ],
      ),
    );
  }

  // sendTransaction(Transaction transaction) async {
  //   await _connector.re
  // }
  requestConnectionOnWallet(String uri) async {
    if (await canLaunchUrl(uri.toUri)) {
      await launchUrl(uri.toUri);
    }
    // await launchUrl(
    //   Uri.parse(uri),
    // );
  }

  void listen() async {
    if (connector != null) {
      connector!.on("connect", (SessionStatus event) {
        if (event.accounts.isNotEmpty) {
          final UserModel _user = UserModel(
            address: EthereumAddress.fromHex(event.accounts[0]),
            chainId: event.chainId,
          );
          _vm.populate(_user);
        } else {
          rejectSession();
          _vm.populate(null);
        }
      });
      connector!.on('wc_sessionRequest',
          (WCSessionRequestResponse request) => print(request));
      connector!.on(
        'wc_sessionUpdate',
        (WCSessionUpdateResponse payload) async {
          print("UPDATE : $payload");
        },
      );
      connector!.on("call_request", (event) => print(event));
      connector!.on('disconnect', (SessionStatus session) {
        _connector = null;
        _vm.populate(null);
      });
      if (!connector!.connected) {
        await _connector!
            .createSession(
          chainId: 97,
          onDisplayUri: requestConnectionOnWallet,
        )
            .then((SessionStatus event) {
          if (event.accounts.isNotEmpty) {
            approveSession(
              event.accounts[0],
            );

            final UserModel _user = UserModel(
              address: EthereumAddress.fromHex(event.accounts[0]),
              chainId: event.chainId,
            );
            _vm.populate(_user);
          } else {
            rejectSession();
            _vm.populate(null);
          }
        });
      }
    } else {
      // connect();
      Fluttertoast.showToast(
          msg:
              "Unable to connect, please make sure you have downloaded meta provider.");
    }
  }
}
