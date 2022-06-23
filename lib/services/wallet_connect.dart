import 'package:fluttertoast/fluttertoast.dart';
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
  WalletConnect? _connector;
  WalletConnect? get connector => _connector;
  Future<void> connect() async {
    try {
      _connector = WalletConnect(
        bridge: 'https://bridge.walletconnect.org',
        clientMeta: _peerMeta,
      );
      await _connector!.connect(
        chainId: 97,
        onDisplayUri: requestConnectionOnWallet,
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
    await connector!.approveSession(
      chainId: 4160,
      accounts: [
        address,
      ],
    );
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
  requestConnectionOnWallet(String uri) async {}
  void listen() async {
    if (_connector != null) {
      _connector!.on("connect", (SessionStatus event) {
        if (event.accounts.isNotEmpty) {
          approveSession(
            event.accounts[0],
          );
        } else {
          rejectSession();
        }
      });
      connector!.on('wc_sessionRequest',
          (WCSessionRequestResponse request) => print(request));
      _connector!.on(
        'wc_sessionUpdate',
        (WCSessionUpdateResponse payload) async {
          print("UPDATE : $payload");
        },
      );
      _connector!.on("call_request", (event) => print(event));
      _connector!.on('disconnect', (SessionStatus session) {
        _connector = null;
      });
      if (!_connector!.connected) {
        await _connector!.createSession(
          chainId: 97,
          onDisplayUri: requestConnectionOnWallet,
        );
      }
    } else {
      connect();
    }
  }
}