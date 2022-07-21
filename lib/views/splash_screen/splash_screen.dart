// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:kprn/constant/palette.dart';
import 'package:kprn/extensions/color_extension.dart';
import 'package:kprn/main.dart';
import 'package:kprn/models/contract/constant_contracts.dart';
import 'package:kprn/services/wallet_connect.dart';
import 'package:kprn/views/loading/khephren_progress.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final ConstantContracts _constantContracts = ConstantContracts.instance;
  final WalletConnectService _service = WalletConnectService.instance;
  void checkAccountAvailability() async {
    // await Future.delayed(const Duration(seconds: 3));
    // Navigator.pushReplacementNamed(context, '/start_screen');
    String? tok = cacher.ethereumAddress;
    if (tok != null) {
      await _service.connect(
          // idCallback: (String? n) async {
          //   print("ID CALLBACK : $n");
          //   if (n != null) {
          //     setState(() {
          //       accountId = n;
          //     });
          //     Navigator.pushReplacementNamed(
          //       context,
          //       '/landing_page',
          //       arguments: true,
          //     );
          //   } else {
          //     myMetaWallet = null;
          //     tokenSymbol = "KHPRN";
          //     accountId = null;
          //     await _service.disconnect();
          //     Navigator.pushReplacementNamed(context, '/start_screen');
          //   }
          // },
          );
      //     .then((val) async {
      //   if (!val) {
      //     myMetaWallet = null;
      //     tokenSymbol = "KHPRN";
      //     accountId = null;
      //     await _service.disconnect();
      //   }
      // });
      // setState(() {
      //   accountId = tok;
      // });
      // await Future.delayed(const Duration(seconds: 1));
      // if (tok != null) {
      //   // await _service.connect(
      //   //   idCallback: (String? n) async {
      //   //     print("ID CALLBACK : $n");
      //   //     if (n != null) {
      //   //       setState(() {
      //   //         accountId = n;
      //   //       });
      //   //       Navigator.pushReplacementNamed(
      //   //         context,
      //   //         '/landing_page',
      //   //         arguments: true,
      //   //       );
      //   //     } else {
      //   //       myMetaWallet = null;
      //   //       tokenSymbol = "KHPRN";
      //   //       accountId = null;
      //   //       await _service.disconnect();
      //   //       Navigator.pushReplacementNamed(context, '/start_screen');
      //   //     }
      //   //   },
      //   // ).then((val) async {
      //   //   if (!val) {
      //   //     myMetaWallet = null;
      //   //     tokenSymbol = "KHPRN";
      //   //     accountId = null;
      //   //     await _service.disconnect();
      //   //   }
      //   // });
      // } else {
      //   Navigator.pushReplacementNamed(context, '/start_screen');
      // }
      setState(() {});
    } else {
      Navigator.pushReplacementNamed(context, '/start_screen');
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      checkAccountAvailability();
    });
    super.initState();
  }

  final Palette _palette = Palette();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        bool isLandscape = orientation == Orientation.landscape;
        return LayoutBuilder(builder: (context, constraint) {
          final double size60 =
              (isLandscape ? constraint.maxHeight : constraint.maxWidth) * .6;
          final double size90 =
              (isLandscape ? constraint.maxHeight : constraint.maxWidth) * .9;
          return Stack(
            children: [
              Positioned(
                top: -20,
                right: -100,
                child: Image.asset(
                  "assets/images/logo.png",
                  width: size90,
                  height: size90,
                  fit: BoxFit.cover,
                  color: Palette.kToDark.darken(.2).withOpacity(.03),
                ),
              ),
              Positioned(
                bottom: -50,
                left: -5,
                child: Image.asset(
                  "assets/images/logo.png",
                  width: size60,
                  height: size60,
                  fit: BoxFit.cover,
                  color: Palette.kTint.shade100.withOpacity(.03),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ShaderMask(
                      shaderCallback: (Rect bounds) =>
                          _palette.buttonGradient.createShader(bounds),
                      child: const Text(
                        "KHEPHREN",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Hero(
                      tag: "logo",
                      child: KhephrenProgressIndicator(
                        size: 100,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
      }),
    );
  }
}
