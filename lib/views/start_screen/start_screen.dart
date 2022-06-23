import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kprn/constant/palette.dart';
import 'package:kprn/extensions/color_extension.dart';

class StartScreenPage extends StatefulWidget {
  const StartScreenPage({Key? key}) : super(key: key);

  @override
  State<StartScreenPage> createState() => _StartScreenPageState();
}

class _StartScreenPageState extends State<StartScreenPage> {
  bool canConnect = true;
  final Palette _palette = Palette();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    final Color base = AppBarTheme.of(context).backgroundColor!;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/icons/start.gif",
            color: base.withOpacity(.5).lighten(),
            colorBlendMode: BlendMode.modulate,
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Hero(
                        tag: "logo",
                        child: Image.asset("assets/images/logo.png"),
                      ),
                    ),
                  ),
                  const Text(
                    "Lets Get Started!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 33,
                      fontWeight: FontWeight.w700,
                      height: 1,
                    ),
                  ),
                  const Text(
                    "Connect your wallet of choice",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        gradient: _palette.buttonGradient,
                      ),
                      child: TextButton(
                        onPressed: () async {
                          Navigator.pushReplacementNamed(
                            context,
                            "/landing_page",
                            arguments: false,
                          );
                          // print("JAWARS");
                          // await _walletService.connect(
                          //   idCallback: (String? id) {
                          //     print("ID : $id");
                          //     if (id != null && canConnect) {
                          //       setState(() {
                          //         canConnect = false;
                          //         accountId = id;
                          //       });
                          //       if (cacher != null) {
                          //         cacher!.accountToken = id;
                          //       }
                          //       Navigator.pushReplacementNamed(
                          //         context,
                          //         "/landing_page",
                          //         arguments: false,
                          //       );
                          //     }
                          //   },
                          // );
                          // await _walletService.connectAndListen(
                          //     accountId: (String? id) async {
                          //   if (id != null && canConnect) {
                          // setState(() {
                          //   canConnect = false;
                          // });
                          // if (cacher != null) {
                          //   cacher!.accountToken = id;
                          // }
                          //     setState(() {
                          //       accountId = id;
                          //     });
                          // Navigator.pushReplacementNamed(
                          //   context,
                          //   "/landing_page",
                          //   arguments: false,
                          // );
                          //   }
                          // }).then((value) {
                          //   if (value != null) {
                          //     if (cacher != null) {
                          //       cacher!.accountToken = value;
                          //     }
                          //     setState(() {
                          //       accountId = value;
                          //     });
                          //     Navigator.pushReplacementNamed(
                          //       context,
                          //       "/landing_page",
                          //     );
                          //   }
                          // });
                        },
                        child: SizedBox(
                          height: 55,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.account_balance_wallet_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Connect Wallet",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
