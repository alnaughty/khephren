import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kprn/constant/palette.dart';
import 'package:kprn/extensions/color_extension.dart';
import 'package:kprn/views/carousel/custom_carousel.dart';
import 'package:kprn/views/carousel_container/carousel_container.dart';
import 'package:kprn/views/staking_screen/second_page/stake_on_token/stake_on_token_page.dart';
import 'package:kprn/views/staking_screen/second_page/token_hl/token_hl_widget.dart';

class TokenStakingScreen extends StatefulWidget {
  const TokenStakingScreen({
    Key? key,
    required this.onBackPressed,
  }) : super(key: key);
  final Function()? onBackPressed;

  @override
  State<TokenStakingScreen> createState() => _TokenStakingScreenState();
}

class _TokenStakingScreenState extends State<TokenStakingScreen>
    with HelperContainer {
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
    final Color base = AppBarTheme.of(context).backgroundColor!;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: LayoutBuilder(
        builder: (_, constraint) {
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
                    title: const Text("Token Staking"),
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
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Text(
                    "Top Pools",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: constraint.maxWidth,
                  height: 215,
                  child: CustomCarousel(
                    changeDuration: const Duration(
                      seconds: 4,
                    ),
                    viewportFraction: .9,
                    children: List.generate(
                      5,
                      (index) => pageContainer(
                        onPressed: () {},
                        bgColor: base.lighten().withOpacity(.8),
                        title: "Earn BNB",
                        subtitle: "Stake USDT",
                        aprPercentage: 67.34,
                      ),
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
                        "High APR, low risk.",
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
                        itemBuilder: (_, index) => TokenHLWidget(
                          tokEarnSymbol: "TRX",
                          tokSymbol: "BNB",
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
                                    StakeOnTokenPage(
                                  onStakeConfirm: (double value) {
                                    Fluttertoast.showToast(
                                        msg:
                                            "You have staked ${value.toStringAsFixed(2)} BNB");
                                    Navigator.of(context).pop(null);
                                    indexesEnabled.remove(index);
                                    setState(() {});
                                  },
                                  tokenSymbol: "BNB",
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
        },
      ),
    );
  }
}
