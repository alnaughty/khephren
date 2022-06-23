import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kprn/constant/palette.dart';
import 'package:kprn/views/staking_screen/second_page/stake_on_nft/stake_on_nft_page.dart';
import 'package:kprn/views/staking_screen/second_page/token_hl/token_hl_nft_widget.dart';

class NFTStakingScreen extends StatefulWidget {
  const NFTStakingScreen({
    Key? key,
    required this.onBackPressed,
  }) : super(key: key);
  final Function()? onBackPressed;
  @override
  State<NFTStakingScreen> createState() => _NFTStakingScreenState();
}

class _NFTStakingScreenState extends State<NFTStakingScreen> {
  final Palette _palette = Palette();
  List<int> indexesEnabled = [];
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: LayoutBuilder(builder: (_, constraint) {
        return SingleChildScrollView(
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
                  title: const Text("NFT Staking"),
                  backgroundColor: Colors.transparent,
                  leading: BackButton(
                    color: Colors.white,
                    onPressed: widget.onBackPressed,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: constraint.maxWidth,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Earn with NFTs!",
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
                            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      itemBuilder: (_, index) => TokenHLNFTWidget(
                        networkSymbol: "ETH",
                        nftEarnSymbol: "TRX",
                        aprPercentage: index * Random().nextDouble() * 5.0,
                        isEnabled: indexesEnabled.contains(index),
                        onPressed: () {
                          if (indexesEnabled.contains(index)) {
                            /// is enabled
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              context: context,
                              isScrollControlled: true,
                              constraints: BoxConstraints(
                                maxHeight: constraint.maxHeight * .75,
                                minHeight: 0,
                              ),
                              builder: (
                                _,
                              ) =>
                                  StakeOnNFTPage(
                                onStakeConfirm: (double value) {
                                  Fluttertoast.showToast(
                                      msg:
                                          "You have staked ${value.toStringAsFixed(2)} BNB");
                                  Navigator.of(context).pop(null);
                                  indexesEnabled.remove(index);
                                  setState(() {});
                                },
                                network: "ETH",
                                maxTokenOwned:
                                    index * Random().nextDouble() * 200000.0,
                                minTokenToStake: 20000,
                              ),
                            );
                          } else {
                            indexesEnabled.add(index);
                            setState(() {});
                          }
                        },
                        title: 'Earn TRX',
                        subtitle: 'Stake BNB',
                      ),
                      separatorBuilder: (_, index) => Container(
                        height: 20,
                      ),
                      itemCount: 5,
                    ),
                  ],
                ),
              ),
              const SafeArea(
                child: SizedBox(
                  height: 20,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
