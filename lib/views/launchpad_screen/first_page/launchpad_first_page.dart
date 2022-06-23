import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kprn/constant/palette.dart';
import 'package:kprn/data_listeners_and_handlers/launchpad_page_handler.dart';
import 'package:kprn/models/token_network.dart';
import 'package:kprn/views/launchpad_screen/launchpad_token_and_progress/launchpad_token_and_progress_page.dart';
import 'package:kprn/views/token_details_screen/token_details_screen.dart';

class LaunchpadFirstPage extends StatefulWidget {
  const LaunchpadFirstPage({
    Key? key,
    required this.onBackPressed,
    required this.handler,
  }) : super(key: key);
  final Function()? onBackPressed;
  final LaunchpadPageHandler handler;

  @override
  State<LaunchpadFirstPage> createState() => _LaunchpadFirstPageState();
}

class _LaunchpadFirstPageState extends State<LaunchpadFirstPage> {
  final Palette _palette = Palette();
  late final TextEditingController _searchController;
  final FocusNode focusNode = FocusNode();
  bool _stakedOnly = false;
  String? selectedSort;
  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color base = AppBarTheme.of(context).backgroundColor!;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: LayoutBuilder(
        builder: (_, constraint) {
          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                PreferredSize(
                  preferredSize: const Size.fromHeight(60),
                  child: AppBar(
                    elevation: 0,
                    centerTitle: true,
                    title: const Text("Launchpad"),
                    backgroundColor: Colors.transparent,
                    leading: BackButton(
                      color: Colors.white,
                      onPressed: widget.onBackPressed,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: constraint.maxWidth,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Newest Projects!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        focusNode: focusNode,
                        style: TextStyle(
                          color: _palette.kNToDark,
                        ),
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: "Search Pool.",
                          prefixIcon: Icon(
                            Icons.search,
                            color: focusNode.hasFocus
                                ? _palette.kNToDark
                                : Colors.grey.shade600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: 0,
                              maxWidth: constraint.maxWidth * .5,
                            ),
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              width: double.maxFinite,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                border: Border.all(
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  dropdownColor: Theme.of(context)
                                      .appBarTheme
                                      .backgroundColor,
                                  isExpanded: true,
                                  hint: Text(
                                    "Sort by",
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  items: ["1", '2']
                                      .map(
                                        (e) => DropdownMenuItem<String>(
                                          value: e,
                                          child: Text(
                                            e,
                                            style: TextStyle(
                                              color: selectedSort == null
                                                  ? Colors.grey.shade600
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  iconEnabledColor: selectedSort == null
                                      ? Colors.grey.shade600
                                      : Colors.white,
                                  value: selectedSort,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedSort = value;
                                    });
                                  },
                                ),
                              ),
                              // color: Colors.red,÷
                            ),
                          ),
                          // const Spacer(),
                          Row(
                            children: [
                              const Text(
                                "Staked\nOnly :",
                                style: TextStyle(
                                  color: Colors.white,
                                  height: 1,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Switch.adaptive(
                                activeColor: _palette.kNToDark,
                                // thumbColor: MaterialStateProperty.resolveWith(
                                //     (states) => Colors.red),
                                inactiveTrackColor: _palette.greyColor,
                                inactiveThumbColor: _palette.kNToDark,
                                value: _stakedOnly,
                                onChanged: (val) {
                                  setState(() {
                                    _stakedOnly = val;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) =>
                            LaunchPadTokenDetailsAndProgress(
                          onPressed: () async {
                            widget.handler.fore(
                              TokenDetails(
                                onReturn: () {
                                  widget.handler.back();
                                },
                                tokenAddress:
                                    "0x001BC0341CFC7e6f3B3DD67bcBBd44aB55Ed3cb9",
                              ),
                            );
                            // setState(() {
                            //   toCheckAddressInfo =
                            //       "0x6174E388588f116728d250Bdf2123816E7ECf88c";
                            // });
                            // await _pageController.animateToPage(
                            //   1,
                            //   curve: Curves.decelerate,
                            //   duration: const Duration(milliseconds: 500),
                            // );
                          },
                          name: "Baby Bonk",
                          symbol: "BONK",
                          maxProgressRate: Random().nextInt(200000) + 10,
                          networkImage:
                              "https://assets.coingecko.com/coins/images/19153/small/dobo.png?1640080606",
                          network: const TokenNetwork(
                            usdtEquivalent: 0.32,
                            name: "BNB",
                            tokenEquivalent: 700,
                            networkIconPath:
                                "https://assets.coingecko.com/coins/images/825/small/bnb-icon2_2x.png?1644979850",
                            softCap: 85,
                            hardCap: 170,
                          ),
                          progress: Random().nextDouble(),
                          startDate: DateTime.now(),
                          endDate: DateTime(
                            int.parse("20${(Random().nextInt(30) + 23)}"),
                            Random().nextInt(12) + 1,
                            Random().nextInt(31) + 1,
                          ),
                          address: "0x6174E388588f116728d250Bdf2123816E7ECf88c",
                        ),
                        separatorBuilder: (_, index) => const SizedBox(
                          height: 25,
                        ),
                        itemCount: 3,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
