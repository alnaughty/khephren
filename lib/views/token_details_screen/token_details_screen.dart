import 'dart:async';

import 'package:clipboard/clipboard.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:ethers/ethers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:kprn/constant/khprn.dart';
import 'package:kprn/constant/palette.dart';
import 'package:kprn/extensions/color_extension.dart';
import 'package:kprn/models/abi_model/sales/salesContract.g.dart';
import 'package:kprn/models/contract/constant_contracts.dart';
import 'package:kprn/models/launchpad_data.dart';
import 'package:kprn/models/user_model.dart';
import 'package:kprn/services/wallet_connect.dart';
import 'package:kprn/view_models/logged_user_vm.dart';
import 'package:kprn/views/buy_with_bnb/buy_with_bnb.dart';
import 'package:kprn/views/progress_viewer/progress_viewer.dart';
import 'package:web3dart/web3dart.dart';

class TokenDetails extends StatefulWidget {
  const TokenDetails({
    Key? key,
    required this.onReturn,
    required this.data,
  }) : super(key: key);
  final Function() onReturn;
  final LaunchpadData data;
  @override
  State<TokenDetails> createState() => _TokenDetailsState();
}

class _TokenDetailsState extends State<TokenDetails> {
  late final ScrollController _scrollController;
  late final symbol = widget.data.token.symbol;
  late final UserModel user = _vm.current!;
  double? balance;
  late bool isPresale =
      DateTime.now().compareTo(widget.data.startDate.toUtc()) > 0 &&
          DateTime.now().compareTo(widget.data.endDate) < 0;
  late bool presaleNotStarted =
      DateTime.now().compareTo(widget.data.startDate.toUtc()) < 0;
  late final String? description = widget.data.projectDetails[0];

  late final SalesContract _contract = SalesContract(
    address: EthereumAddress.fromHex(
      widget.data.saleAddress,
    ),
    client: Web3Client(
      rpcUrl,
      Client(),
    ),
    chainId: user.chainId,
  );
  Timer? timer;
  final LoggedUserVm _vm = LoggedUserVm.instance;
  void getBalance() async {
    await _contract.raised().then((value) {
      setState(() {
        balance = double.parse(ethers.utils.formatEther(value));
      });
    });
  }

  Duration? presaleDifference;
  void initPresaleCounter() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      presaleDifference = (isPresale
              ? widget.data.endDate
              : presaleNotStarted
                  ? widget.data.startDate
                  : DateTime.now())
          .difference(
        DateTime.now(),
      );
      setState(() {});
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

  final TextStyle whiteStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    height: 1,
    fontSize: 22,
  );
  @override
  void initState() {
    getBalance();
    if (widget.data.state == 0) {
      initPresaleCounter();
    }
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    disposeTimer();
    // TODO: implement dispose
    super.dispose();
  }

  final Ethers ethers = Ethers();
  final WalletConnectService _wcs = WalletConnectService.instance;

  Future<double> getMaxBuy() async {
    bool isFairLunch = widget.data.type != "0x0";
    final double walletBal = await _wcs.connector.getBalance();
    if (isFairLunch) {
      return walletBal;
    }
    final TotalContributions totalContributions =
        await _contract.totalContributions(user.address);
    final BigInt total = totalContributions.var1;
    print(ethers.utils.formatEther(total));
    double initMax = widget.data.maxBuy -
        double.parse(
          ethers.utils.formatEther(total),
        );

    double result = initMax;
    if (initMax > (widget.data.hardCap - balance!)) {
      print("dd1");
      result = (widget.data.hardCap - balance!);
    } else if (initMax > walletBal) {
      print("dd");
      result = walletBal;
    }
    print("MAX : $result");
    return double.parse(result.toStringAsFixed(16));
  }

  @override
  Widget build(BuildContext context) {
    final Color base = AppBarTheme.of(context).backgroundColor!;
    final Size size = MediaQuery.of(context).size;
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
        child: Scrollbar(
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
                      child: widget.data.projectDetails[2]
                              .toString()
                              .contains(".svg")
                          ? SvgPicture.network(
                              widget.data.projectDetails[2],
                              fit: BoxFit.cover,
                              width: 90,
                              height: 90,
                            )
                          : Image.network(
                              widget.data.projectDetails[2],
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
                                text: widget.data.token.name,
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
                                  "KYC : ${widget.data.verified == 1 ? "Verified" : "Not Verified"}",
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
                                  "WHITELIST : ${widget.data.whitelist == 1 ? "Enabled" : "Disabled"}",
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
                if (description != null) ...{
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
                          "About ${widget.data.token.name}",
                          style: whiteStyle.copyWith(
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.data.projectDetails[0],
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
                },
                if (presaleDifference != null &&
                    (presaleNotStarted || isPresale)) ...{
                  DottedBorder(
                    padding: const EdgeInsets.all(25),
                    dashPattern: const [7],
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    color: Palette.borderColor,
                    child: SizedBox(
                      width: double.maxFinite,
                      child: Column(
                        children: [
                          Text(
                            "Presale ${presaleNotStarted ? "Starts" : "Ends"} in :",
                            style: whiteStyle.copyWith(
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "${presaleDifference!.inDays.toString().padLeft(2, "0")} : ${presaleDifference!.inHours.remainder(24).toString().padLeft(2, "0")} : ${presaleDifference!.inMinutes.remainder(60).toString().padLeft(2, "0")} : ${presaleDifference!.inSeconds.remainder(60).toString().padLeft(2, "0")}",
                            style: whiteStyle.copyWith(
                              fontSize: 33,
                              color: Palette.kToDark,
                            ),
                          ),
                          if (balance != null) ...{
                            const SizedBox(
                              height: 30,
                            ),
                            ProgressViewer(
                              contract: _contract,
                              type: widget.data.type,
                              softCap: widget.data.softCap,
                              hardCap: widget.data.hardCap,
                            ),
                          },
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
                                      shaderCallback: (Rect bounds) => Palette()
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
                                        double max = await getMaxBuy();
                                        await showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          // isDismissible: true,
                                          backgroundColor: Colors.transparent,
                                          constraints: BoxConstraints(
                                            maxHeight: size.height,
                                          ),
                                          builder: (
                                            _,
                                          ) =>
                                              BuyWithBnb(
                                            minBuy: widget.data.minBuy,
                                            maxBuy: max,
                                            bnbEquivalent:
                                                widget.data.presaleRate,
                                            tokenImage: Image.network(
                                              widget.data.projectDetails[2],
                                              fit: BoxFit.cover,
                                              width: 30,
                                              height: 30,
                                            ),
                                            tokenSymbol: symbol,
                                            salesAddress:
                                                widget.data.saleAddress,
                                            contract: _contract,
                                          ),
                                        );
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
                  value1: widget.data.state == 0 ? "In Progress" : "Completed",
                  title2: "Sale type",
                  value2: widget.data.whitelist == 0 ? "Public" : "Private",
                ),
                const SizedBox(
                  height: 20,
                ),
                twinRow(
                  base,
                  title1: "Min Buy",
                  value1: "${widget.data.minBuy} BNB",
                  title2: "Max Buy",
                  value2: "${widget.data.maxBuy} BNB",
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
                const SizedBox(
                  height: 20,
                ),
                twinRow(
                  base,
                  title1: "Token Name",
                  value1: widget.data.token.name,
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
                  value: widget.data.saleAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                contentContainer(
                  base,
                  title: "Total Supply",
                  value: "${widget.data.tokenForSale.toInt()} $symbol",
                ),
                const SizedBox(
                  height: 20,
                ),
                contentContainer(
                  base,
                  title: "Tokens for Presale",
                  value: "${widget.data.tokenForSale.toInt()} $symbol",
                ),
                const SizedBox(
                  height: 20,
                ),
                contentContainer(
                  base,
                  title: "Tokens for Liquidity",
                  value: "${widget.data.tokenForLiquidity.toInt()} $symbol",
                ),
                const SizedBox(
                  height: 20,
                ),
                contentContainer(
                  base,
                  title: "Presale Rate",
                  value: "1 BNB = ${widget.data.presaleRate} $symbol",
                ),
                const SizedBox(
                  height: 20,
                ),
                contentContainer(
                  base,
                  title: "Listing Rate",
                  value: "1 BNB = ${(widget.data.listingRate)} $symbol",
                ),
                const SizedBox(
                  height: 20,
                ),
                twinRow(
                  base,
                  title1: "Soft Cap",
                  value1: "${widget.data.softCap} BNB",
                  title2: "Hard Cap",
                  value2: "${widget.data.hardCap} BNB",
                ),
                const SizedBox(
                  height: 20,
                ),
                contentContainer(
                  base,
                  title: "Presale Start Time",
                  value: DateFormat().format(widget.data.startDate.toUtc()),
                ),
                const SizedBox(
                  height: 20,
                ),
                contentContainer(
                  base,
                  title: "Presale End Time",
                  value: DateFormat().format(widget.data.endDate.toUtc()),
                ),
                const SizedBox(
                  height: 20,
                ),
                contentContainer(
                  base,
                  title: "Liquidity Percent",
                  value: "${widget.data.liquidityPercent}%",
                ),
                const SizedBox(
                  height: 20,
                ),
                contentContainer(
                  base,
                  title: "Liquidity Percent",
                  value:
                      "${widget.data.liquidityLockupTime} days after pool ends",
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
