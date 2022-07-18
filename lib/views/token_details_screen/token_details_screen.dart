import 'dart:async';
import 'package:clipboard/clipboard.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:kprn/constant/khprn.dart';
import 'package:kprn/constant/palette.dart';
import 'package:kprn/extensions/color_extension.dart';
import 'package:kprn/models/contract/constant_contracts.dart';
import 'package:kprn/models/sales_details_model.dart';
// import 'package:kprn/salesContract.g.dart';
import 'package:kprn/views/loading/khephren_progress.dart';
import 'package:web3dart/web3dart.dart';

class TokenDetails extends StatefulWidget {
  const TokenDetails({
    Key? key,
    required this.onReturn,
    required this.tokenAddress,
  }) : super(key: key);
  final Function() onReturn;
  final String tokenAddress;
  @override
  State<TokenDetails> createState() => _TokenDetailsState();
}

class _TokenDetailsState extends State<TokenDetails> {
  late final ScrollController _scrollController;
  // final WalletService _walletService = WalletService.instance;
  // // final MyKHPRNBalanceService _myKHPRNService = MyKHPRNBalanceService.instance;
  // final WalletCredentials _creds = WalletCredentials.instance;
  // late final SalesContract _contract = SalesContract(
  //   address: EthereumAddress.fromHex(
  //     "0x001BC0341CFC7e6f3B3DD67bcBBd44aB55Ed3cb9",
  //     enforceEip55: true,
  //   ),
  //   client: Web3Client(
  //     rpcUrl,
  //     Client(),
  //   ),
  //   chainId: 97,
  // );
  Timer? timer;
  late bool saleTypeisWhiteListed;
  late DateTime _startDate;
  late DateTime _endDate;
  late bool isPresale;
  late bool isKYCVerified;
  late double minBuy;
  late String saleAddress;
  late double maxBuy;
  late String symbol;
  late double totalSupply;
  late double tokensForPresale;
  late double tokensForLiquidity;
  late double presaleRate;
  late double liquidityPercent;
  late int liquidityLockupTime;
  late double listingPrice;
  SalesDetailsModel? _details;
  late double hardCap;
  late double softCap;
  late Duration presaleDifference;
  void initPresaleCounter() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isPresale = DateTime.now().compareTo(_endDate) < 0) {
        setState(() {
          presaleDifference = _endDate.difference(DateTime.now());
        });
      } else {
        setState(() {
          isPresale = false;
        });
        disposeTimer();
      }
    });
  }

  void disposeTimer() {
    if (timer != null) {
      if (timer!.isActive) {
        timer!.cancel();
      }
      timer = null;
    }
  }

  final ConstantContracts _constantContracts = ConstantContracts.instance;

  Future<void> checkKYCVerified() async {
    // final LaunchpadFactoryContract _contract = LaunchpadFactoryContract(
    //   address: EthereumAddress.fromHex(factoryAddress),
    //   client: myMetaWallet!.ethClient,
    //   chainId: myMetaWallet!.session.chainId,
    // );
    // await _constantContracts.launchpadContract
    //     .getLaunchpad(
    //   EthereumAddress.fromHex(
    //     "0x001BC0341CFC7e6f3B3DD67bcBBd44aB55Ed3cb9",
    //     enforceEip55: true,
    //   ),
    // )
    //     .then((value) {
    //   isKYCVerified = value[2];
    //   print("VALUE : $isKYCVerified");
    // });
  }

  Future<void> getSymbolAndSupply() async {
    // KephrenTokenContract _kephrenContract = KephrenTokenContract(
    //   address: EthereumAddress.fromHex(khprnHex),
    //   client: myMetaWallet!.ethClient,
    //   chainId: myMetaWallet!.session.chainId,
    // );
    // await _constantContracts.khprnTokenContract.symbol().then((value) {
    //   symbol = value;
    // });
    // await _constantContracts.khprnTokenContract.totalSupply().then((value) {
    //   totalSupply = value / constantInt;
    //   print("TOTAL : $totalSupply");
    // });
    // await _myBalanceService.contractSymbol().then(
    //   (value) {
    //     print(value);
    //     if (value != null) {
    //       setState(() {
    //         tokenSymbol = value;
    //       });
    //     }
    //   },
    // );
  }

  void getDetails() async {
    // saleTypeisWhiteListed = await _contract.whitelist();
    // _contract.startDate().then((value) {
    //   final DateTime time =
    //       DateTime.fromMillisecondsSinceEpoch(value.toInt() * 1000);
    //   _startDate = time;
    //   // DateTime.parse(value.to)
    // });

    // await _contract.endDate().then((value) {
    //   final DateTime time =
    //       DateTime.fromMillisecondsSinceEpoch(value.toInt() * 1000);
    //   _endDate = time;
    // });

    // isPresale = DateTime.now().compareTo(_endDate) < 0;
    // if (isPresale) {
    //   presaleDifference = _endDate.difference(DateTime.now());
    //   initPresaleCounter();
    // }
    // await _contract.minBuy().then(
    //   (value) {
    //     minBuy = value / constantInt;
    //     print("MIN : $minBuy");
    //   },
    // );
    // await _contract.maxBuy().then(
    //   (value) {
    //     maxBuy = value / constantInt;
    //     print("MAX : $maxBuy");
    //   },
    // );

    // await _contract.saleToken().then((value) {
    //   saleAddress = value.hex;
    // });
    // await _contract.hardCap().then((value) {
    //   hardCap = value / constantInt;
    // });
    // await _contract.softCap().then((value) {
    //   softCap = value / constantInt;
    // });
    // await _contract.listingPrice().then((value) {
    //   listingPrice = value / constantInt;
    // });
    // await _contract.price().then((value) {
    //   tokensForPresale = (1 / (value / constantInt)) * hardCap;
    //   presaleRate = 1 / (value / constantInt);
    // });
    // await _contract.liquidityPercent().then((value) {
    //   final double percentVal = value.toDouble();
    //   // ((1/detailsObj.presale_rate) * detailsObj.hard_cap) * (detailsObj.liquidity_percent/100)
    //   print("VALUE : $percentVal");
    //   liquidityPercent = percentVal;
    //   tokensForLiquidity = ((1 / listingPrice) * hardCap) * (percentVal / 100);
    //   print("FOR LIQUIDITY : $tokensForLiquidity");
    // });
    // await _contract.liquidityLockupTime().then((value) {
    //   liquidityLockupTime = value.toInt();
    //   print("LOCKUP TIME $liquidityLockupTime");
    //   // print(1 / ((value / constantInt).toDouble()));
    // });
    // await getSymbolAndSupply();
    // await checkKYCVerified();
    // // await _contract.
    // // await _contract.
    // // await _contract;
    // await _contract.details().then((value) {
    //   setState(() {
    //     _details = SalesDetailsModel(
    //       name: String.fromCharCodes(value.name),
    //       description: String.fromCharCodes(value.description),
    //       logo: String.fromCharCodes(value.logo),
    //       website: String.fromCharCodes(value.website),
    //       twitter: String.fromCharCodes(value.twitter),
    //       facebook: String.fromCharCodes(value.facebook),
    //       instagram: String.fromCharCodes(value.instagram),
    //       discord: String.fromCharCodes(value.discord),
    //       telegram: String.fromCharCodes(value.telegram),
    //       reddit: String.fromCharCodes(value.reddit),
    //       github: String.fromCharCodes(value.github),
    //       medium: String.fromCharCodes(value.medium),
    //     );
    //   });
    // });
  }

  final TextStyle whiteStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    height: 1,
    fontSize: 22,
  );
  @override
  void initState() {
    getDetails();
    _scrollController = ScrollController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    disposeTimer();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color base = AppBarTheme.of(context).backgroundColor!;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Token Info"),
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: Colors.white,
          onPressed: widget.onReturn,
        ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 600),
        transitionBuilder: (_, animation) => FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: _,
          ),
        ),
        child: _details == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const KhephrenProgressIndicator(
                    size: 100,
                    color: Palette.kToDark,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Fetching Token Details",
                    style: whiteStyle.copyWith(
                      fontSize: 14,
                      color: Colors.white.withOpacity(.5),
                    ),
                  )
                ],
              )
            : Scrollbar(
                controller: _scrollController,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  controller: _scrollController,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10000),
                            child: Image.network(
                              _details!.logo,
                              fit: BoxFit.cover,
                              width: 90,
                              height: 90,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                      text: _details!.name,
                                      style: whiteStyle,
                                      children: [
                                        if (isPresale) ...{
                                          TextSpan(
                                            text: " (Presale)",
                                            style: whiteStyle.copyWith(
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        },
                                      ]),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Wrap(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Palette.kToDark.shade100,
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        "KYC : ${isKYCVerified ? "Verified" : "Not Verified"}",
                                        style: whiteStyle.copyWith(
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Palette.kToDark.shade100,
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        "WHITELIST : ${saleTypeisWhiteListed ? "Enabled" : "Disabled"}",
                                        style: whiteStyle.copyWith(
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: double.maxFinite,
                        padding: const EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          color: base.lighten().withOpacity(.7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "About ${_details!.name}",
                              style: whiteStyle.copyWith(
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              _details!.description,
                              style: whiteStyle.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      if (isPresale) ...{
                        DottedBorder(
                          padding: const EdgeInsets.all(25),
                          dashPattern: [7],
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          color: Palette.borderColor,
                          child: SizedBox(
                            width: double.maxFinite,
                            child: Column(
                              children: [
                                Text(
                                  "Presale Ends in :",
                                  style: whiteStyle.copyWith(
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "${presaleDifference.inDays.toString().padLeft(2, "0")} : ${presaleDifference.inHours.remainder(24).toString().padLeft(2, "0")} : ${presaleDifference.inMinutes.remainder(60).toString().padLeft(2, "0")} : ${presaleDifference.inSeconds.remainder(60).toString().padLeft(2, "0")}",
                                  style: whiteStyle.copyWith(
                                    fontSize: 33,
                                    color: Palette.kToDark,
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text: "Progress : ",
                                            style: whiteStyle.copyWith(
                                              color: Palette.borderColor
                                                  .withOpacity(.5),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: "98%",
                                                style: whiteStyle.copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  color: Palette.borderColor
                                                      .withOpacity(.5),
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          "18,324",
                                          style: whiteStyle.copyWith(
                                            color: Palette.borderColor
                                                .withOpacity(.5),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Container(
                                        width: double.maxFinite,
                                        height: 18,
                                        color: Colors.white,
                                        child: LayoutBuilder(
                                          builder: (_, constraint) => Align(
                                            alignment: AlignmentDirectional
                                                .centerStart,
                                            child: Container(
                                              width: constraint.maxWidth * .95,
                                              height: 18,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: const Color(0xff21CDD8),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 35,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: SizedBox(
                                    width: double.maxFinite,
                                    height: 60,
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
                                              height: 60,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Positioned.fill(
                                          child: MaterialButton(
                                            padding: const EdgeInsets.all(0),
                                            onPressed: () async {
                                              // await LaunchApp.openApp(
                                              //   androidPackageName:
                                              //       'io.metamask',
                                              //   iosUrlScheme: 'metamask://',
                                              //   // appStoreLink:
                                              //   //     'itms-apps://itunes.apple.com/us/app/pulse-secure/id945832041',
                                              //   // openStore: false
                                              // ).whenComplete(() async {
                                              //   await myMetaWallet!.ethProvider
                                              //       .sendTransaction(
                                              //     gas: 100000,
                                              //     gasPrice: BigInt.one,
                                              //     to: '0x73fd919e6b4525ea8b205e56ea2Ffe4dE3eBe161',
                                              //     from: myMetaWallet!
                                              //         .session.accounts[0],
                                              //     data: Uint8List.fromList(
                                              //       "0x001BC0341CFC7e6f3B3DD67bcBBd44aB55Ed3cb9"
                                              //           .codeUnits,
                                              //     ),
                                              //   );
                                              // });
                                              // await myMetaWallet!.provider
                                              //     .sendTransaction(
                                              //   TransactionRequest(
                                              //     to: myMetaWallet!
                                              //         .session.accounts[0],
                                              //     from: myMetaWallet!
                                              //         .session.accounts[0],
                                              //     gasLimit: BigInt.from(10000),
                                              //     gasPrice: BigInt.one,
                                              //     value: BigInt.from(1000000),
                                              //     chainId: 97,
                                              //   ),
                                              // );
                                              // _creds.provider!.signTransaction(
                                              //   from: from,
                                              // );
                                              // _walletService.sessionStatus.
                                              // _walletService.connector
                                              //     .createSession(
                                              //   chainId: myChainId,
                                              //   onDisplayUri: (uri) async => {
                                              //     print(uri),
                                              //     await launchUrl(
                                              //       Uri.parse(uri),
                                              //     ),
                                              //   },
                                              // );
                                              // final BigInt _amount =
                                              //     BigInt.from(230500);
                                              // final WalletConnectEthereumCredentials
                                              //     _wallet =
                                              //     WalletConnectEthereumCredentials(
                                              //   provider: _creds.provider!,
                                              // );
                                              // await _wallet
                                              //     .sendTransaction(
                                              //       Transaction(
                                              //         from: EthereumAddress
                                              //             .fromHex(
                                              //           accountId!,
                                              //         ),
                                              //         to: EthereumAddress
                                              //             .fromHex(
                                              //           accountId!,
                                              //         ),
                                              //         gasPrice:
                                              //             EtherAmount.inWei(
                                              //                 BigInt.one),
                                              //         maxGas: 0,
                                              //         value: EtherAmount.inWei(
                                              //           BigInt.from(1000000),
                                              //         ),
                                              //       ),
                                              //     )
                                              //     .then((value) =>
                                              //         print("VALUE : $value"))
                                              //     .whenComplete(() =>
                                              //         Fluttertoast.showToast(
                                              //             msg:
                                              //                 "TRANSACTION COMPLETE"));
                                            },
                                            height: 60,
                                            child: SizedBox(
                                              width: double.maxFinite,
                                              child: Center(
                                                child: Text(
                                                  "Buy with BNB",
                                                  style: whiteStyle.copyWith(
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
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      },
                      twinRow(
                        base,
                        isStatus: true,
                        title1: "Status",
                        value1: isPresale ? "In Progress" : "Completed",
                        title2: "Sale type",
                        value2: !saleTypeisWhiteListed ? "Public" : "Private",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      twinRow(
                        base,
                        title1: "Min Buy",
                        value1: "$minBuy BNB",
                        title2: "Max Buy",
                        value2: "$maxBuy BNB",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      contentContainer(
                        base,
                        title: "Total Contributors",
                        value: "162",
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      // contentContainer(
                      //   base,
                      //   forAddress: true,
                      //   title: "Presale Address",
                      //   value: _contract.self.address.hex,
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      twinRow(
                        base,
                        title1: "Token Name",
                        value1: _details!.name,
                        title2: "Token Symbol",
                        value2: symbol,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      contentContainer(
                        base,
                        forAddress: true,
                        title: "Token Address",
                        value: saleAddress,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      contentContainer(
                        base,
                        title: "Total Supply",
                        value: "${totalSupply.toInt()} $symbol",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      contentContainer(
                        base,
                        title: "Tokens for Presale",
                        value: "${totalSupply.toInt()} $symbol",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      contentContainer(
                        base,
                        title: "Tokens for Liquidity",
                        value: "$tokensForLiquidity $symbol",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      contentContainer(
                        base,
                        title: "Presale Rate",
                        value: "1 BNB = $presaleRate $symbol",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      contentContainer(
                        base,
                        title: "Lisitng Rate",
                        value: "1 BNB = ${1 / listingPrice} $symbol",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      twinRow(
                        base,
                        title1: "Soft Cap",
                        value1: "$softCap BNB",
                        title2: "Hard Cap",
                        value2: "$hardCap BNB",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      contentContainer(
                        base,
                        title: "Presale Start Time",
                        value: DateFormat().format(_startDate.toUtc()),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      contentContainer(
                        base,
                        title: "Presale End Time",
                        value: DateFormat().format(_endDate.toUtc()),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      contentContainer(
                        base,
                        title: "Liquidity Percent",
                        value: "$liquidityPercent%",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      contentContainer(
                        base,
                        title: "Liquidity Percent",
                        value: "$liquidityLockupTime days after pool ends",
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget contentContainer(
    Color base, {
    bool forAddress = false,
    required String title,
    required String value,
  }) =>
      Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: base.lighten().withOpacity(.7),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: whiteStyle.copyWith(
                fontSize: 15,
                height: 1.5,
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(.5),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    value,
                    maxLines: forAddress ? 1 : null,
                    overflow: forAddress
                        ? TextOverflow.ellipsis
                        : TextOverflow.visible,
                    style: whiteStyle.copyWith(
                      fontSize: 15,
                      height: 1.5,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                if (forAddress) ...{
                  IconButton(
                    onPressed: () {
                      print("COPY TO CLIPBOARD");
                      FlutterClipboard.copy(value).then(
                        (value) => Fluttertoast.showToast(
                          msg: "Address copied to clipboard",
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.copy_rounded,
                      color: Colors.white,
                    ),
                  ),
                },
              ],
            )
          ],
        ),
      );
  Widget twinRow(
    Color base, {
    bool isStatus = false,
    required String title1,
    required String value1,
    required String title2,
    required String value2,
  }) =>
      SizedBox(
        height: 90,
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: base.lighten().withOpacity(.7),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title1,
                      style: whiteStyle.copyWith(
                        fontSize: 15,
                        height: 1.5,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(.5),
                      ),
                    ),
                    Text(
                      value1,
                      style: whiteStyle.copyWith(
                        fontSize: 15,
                        height: 1.5,
                        fontWeight: FontWeight.w700,
                        color: isStatus ? Palette.kToDark : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: base.lighten().withOpacity(.7),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title2,
                      style: whiteStyle.copyWith(
                        fontSize: 15,
                        height: 1.5,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(.5),
                      ),
                    ),
                    Text(
                      value2,
                      style: whiteStyle.copyWith(
                        fontSize: 15,
                        height: 1.5,
                        fontWeight: FontWeight.w700,
                        // color: Palette.kToDark,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
