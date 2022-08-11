import 'dart:typed_data';

import 'package:ethers/ethers.dart';
import 'package:flutter/material.dart';
import 'package:kprn/constant/palette.dart';
import 'package:kprn/models/abi_model/sales/salesContract.g.dart';
import 'package:kprn/models/user_model.dart';
import 'package:kprn/services/wallet_connect.dart';
import 'package:kprn/view_models/logged_user_vm.dart';
import 'package:kprn/views/buy_with_bnb/widget_helper/fields.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

class BuyWithBnb extends StatefulWidget {
  const BuyWithBnb({
    Key? key,
    required this.maxBuy,
    required this.minBuy,
    required this.bnbEquivalent,
    required this.tokenSymbol,
    this.tokenImage,
    required this.salesAddress,
    required this.contract,
  }) : super(key: key);
  final double maxBuy;
  final double minBuy;
  final double bnbEquivalent;
  final Image? tokenImage;
  final String tokenSymbol;
  final String salesAddress;
  final SalesContract contract;
  @override
  State<BuyWithBnb> createState() => _BuyWithBnbState();
}

class _BuyWithBnbState extends State<BuyWithBnb> with BuyWithBnbHelper {
  late final TextEditingController _bnb;
  late final TextEditingController _token;
  final Ethers ethers = Ethers();
  final TextStyle whiteStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    height: 1,
    fontSize: 22,
  );
  @override
  void initState() {
    _bnb = TextEditingController();
    _token = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _bnb.dispose();
    _token.dispose();
    super.dispose();
  }

  final WalletConnectService _wcs = WalletConnectService.instance;
  Future<void> purchase() async {
    double amount = (double.tryParse(_bnb.text) ?? 0.0);
    print(amount);
    await _wcs.connector.openWalletApp();
    await _wcs.connector
        .purchaseSale(
      recipientAddress: widget.salesAddress,
      amount: amount,
      contract: widget.contract,
    )
        .then((value) async {
      if (value != null) {
        final Uint8List list = hexToBytes(value);
      }
      print("TRANSACTION : $value");
    });
  }

  bool readyForPurhcase = false;
  void change(String? text) {
    double value = double.tryParse(text ?? "0") ?? 0.0;
    double amount = widget.bnbEquivalent * value;
    _token.text = amount.toString();
    // if () {}
    setState(() {
      readyForPurhcase = _formKey.currentState!.validate();
    });
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Color base = AppBarTheme.of(context).backgroundColor!;
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: size.height * .2,
            ),
            Expanded(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Container(
                  width: size.width,
                  // height: (size.height * .6) + (size.height < 700 ? 50 : 0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),
                    color: base,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: Center(
                          child: Container(
                            width: 100,
                            height: 6.5,
                            decoration: BoxDecoration(
                              color: Palette().kNToDark,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Expanded(
                        child: SafeArea(
                          child: ListView(
                            children: [
                              SizedBox(
                                width: double.maxFinite,
                                child: Center(
                                  child: Text(
                                    "Buy Token",
                                    style: whiteStyle.copyWith(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 45,
                              ),
                              SizedBox(
                                width: double.maxFinite,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Buy with :",
                                        style: whiteStyle.copyWith(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Image.network(
                                      "https://assets.coingecko.com/coins/images/825/small/bnb-icon2_2x.png?1644979850",
                                      width: 30,
                                      height: 30,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "BNB",
                                      style: whiteStyle.copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    field(
                                      base,
                                      controller: _bnb,
                                      whiteStyle: whiteStyle,
                                      image: Image.network(
                                        "https://assets.coingecko.com/coins/images/825/small/bnb-icon2_2x.png?1644979850",
                                        width: 25,
                                        height: 25,
                                      ),
                                      onPressedMax: () {
                                        setState(() {
                                          _bnb.text = widget.maxBuy.toString();
                                        });
                                        change(_bnb.text);
                                      },
                                      hintText: widget.minBuy.toString(),
                                      maxBuy: widget.maxBuy,
                                      minBuy: widget.minBuy,
                                      hasValidator: true,
                                      onChanged: (text) {
                                        change(text);
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: double.maxFinite,
                                      child: Text(
                                        "1 BNB = ${widget.bnbEquivalent} ${widget.tokenSymbol}",
                                        style: whiteStyle.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white24,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    field(
                                      base,
                                      image: widget.tokenImage,
                                      controller: _token,
                                      whiteStyle: whiteStyle,
                                      hintText: "Token Amount",
                                      minBuy: 0.0,
                                      maxBuy: 0.0,
                                      isEnabled: false,
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: SizedBox(
                                        width: double.maxFinite,
                                        height: 70,
                                        child: Stack(
                                          children: [
                                            Positioned.fill(
                                              child: ShaderMask(
                                                shaderCallback: (Rect bounds) =>
                                                    Palette()
                                                        .buttonGradient
                                                        .createShader(bounds),
                                                child: Container(
                                                  width: double.maxFinite,
                                                  height: 70,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Positioned.fill(
                                              child: MaterialButton(
                                                padding:
                                                    const EdgeInsets.all(0),
                                                onPressed: readyForPurhcase
                                                    ? () async {
                                                        Navigator.of(context)
                                                            .pop(null);
                                                        await purchase();
                                                      }
                                                    : null,
                                                // color: Colors.white,
                                                disabledColor: Colors.grey,
                                                height: 70,
                                                child: SizedBox(
                                                  width: double.maxFinite,
                                                  child: Center(
                                                    child: Text(
                                                      "Buy",
                                                      style:
                                                          whiteStyle.copyWith(
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
