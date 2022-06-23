// ignore_for_file: equal_elements_in_set

import 'dart:math';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kprn/constant/palette.dart';
import 'package:kprn/extensions/color_extension.dart';

// ignore: must_be_immutable
class TokenHLNFTWidget extends StatefulWidget {
  TokenHLNFTWidget({
    Key? key,
    required this.subtitle,
    required this.title,
    required this.aprPercentage,
    required this.isEnabled,
    required this.nftEarnSymbol,
    required this.onPressed,
    required this.networkSymbol,
    this.isNft = false,
  }) : super(key: key);
  final bool isNft;
  final String title;
  final String nftEarnSymbol;
  final String subtitle;
  final double aprPercentage;
  final String networkSymbol;
  bool isEnabled;
  final Function() onPressed;
  @override
  State<TokenHLNFTWidget> createState() => _TokenHLNFTWidgetState();
}

class _TokenHLNFTWidgetState extends State<TokenHLNFTWidget> {
  final TextStyle earnedTitleStyle = TextStyle(
    color: Colors.grey.shade600,
    fontSize: 30,
    fontWeight: FontWeight.w700,
    height: 1,
  );
  late final TextStyle earnedSubTitleStyle = TextStyle(
    color: Colors.grey.shade600,
    fontSize: 16,
    height: 1,
  );
  TextStyle stakedStyle = const TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  Widget button([bool isNFT = false]) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: double.maxFinite,
          height: 60,
          decoration: BoxDecoration(
            gradient: _palette.buttonGradient,
          ),
          child: MaterialButton(
            onPressed: widget.onPressed,
            // elevation: 0,
            color: null,
            child: Center(
              child: Text(
                widget.isEnabled ? "Stake ${isNFT ? "NFT" : ""}" : "Enable",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      );
  final Palette _palette = Palette();
  @override
  Widget build(BuildContext context) {
    final Color base = AppBarTheme.of(context).backgroundColor!;
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 500,
        ),
        width: double.maxFinite,
        height: widget.isEnabled ? 570 : 340,
        color: base.lighten().withOpacity(.8),
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        widget.subtitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            DottedBorder(
              dashPattern: const [
                4,
              ],
              borderType: BorderType.RRect,
              radius: const Radius.circular(10),
              color: Colors.grey.shade200.withOpacity(.5),
              padding: const EdgeInsets.all(25),
              // borderType: BorderType.Oval,
              child: SizedBox(
                width: double.maxFinite,
                // height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "APR",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "${widget.aprPercentage.toStringAsFixed(2)} %",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          "assets/icons/calculator.png",
                          color: _palette.kNToDark,
                          width: 20,
                          height: 20,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            if (widget.isEnabled) ...{
              const Spacer(),
              RichText(
                text: TextSpan(
                  text: widget.nftEarnSymbol,
                  style: TextStyle(
                    color: _palette.kNToDark,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                  children: const [
                    TextSpan(
                      text: " Earned",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "0",
                          style: earnedTitleStyle.copyWith(
                            color: Colors.grey.shade600,
                            // color: hasStaking
                            //     ? Colors.white
                            //     : Colors.grey.shade600,
                          ),
                        ),
                        Text(
                          "(0 USD)",
                          style: earnedSubTitleStyle,
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade800.withOpacity(.4),
                        // gradient: _palette.buttonGradient,
                      ),
                      child: MaterialButton(
                        onPressed: () {},
                        height: 60,
                        child: const Center(
                          child: Text(
                            "Collect",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              RichText(
                text: TextSpan(
                  text: "Stake NFT from",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  children: [
                    TextSpan(
                      text: " ${widget.networkSymbol} Network",
                      style: TextStyle(
                        color: _palette.kNToDark,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              button(true),
              const SizedBox(
                height: 20,
              ),
              Text(
                "1.02% change to get a random NFT",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey.shade200.withOpacity(.5),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              DottedBorder(
                color: Colors.grey.shade200.withOpacity(.5),
                dashPattern: const [6],
                padding: const EdgeInsets.all(0),
                child: Container(
                  width: double.maxFinite,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Ends in :",
                      style: stakedStyle,
                    ),
                  ),
                  Text(
                    DateFormat("hh : mm : ss").format(DateTime.now()),
                    style: stakedStyle.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              )
            } else ...{
              const Spacer(),
              RichText(
                text: TextSpan(
                  text: "Stake NFT from",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  children: [
                    TextSpan(
                      text: " ${widget.networkSymbol} Network",
                      style: TextStyle(
                        color: _palette.kNToDark,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
              // RichText(
              //   text: TextSpan(
              //     text: "Stake ${widget.isNft ? "NFT" : ""}",
              //     style: const TextStyle(
              //       color: Colors.white,
              //       fontSize: 15,
              //     ),
              //     children: [
              //       TextSpan(
              //         text: widget.tokSymbol,
              //         style: TextStyle(
              //           color: _palette.kNToDark,
              //           fontWeight: FontWeight.w700,
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              const SizedBox(
                height: 25,
              ),
              button(true),
            },
          ],
        ),
      ),
    );
  }
}
