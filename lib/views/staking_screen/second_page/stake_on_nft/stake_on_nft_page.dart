import 'package:flutter/material.dart';
import 'package:kprn/constant/palette.dart';

class StakeOnNFTPage extends StatefulWidget {
  StakeOnNFTPage({
    Key? key,
    required this.network,
    required this.maxTokenOwned,
    required this.minTokenToStake,
    required this.onStakeConfirm,
    this.tokenIcon,
  }) : super(key: key);
  final String network;
  final double maxTokenOwned;
  final double minTokenToStake;
  final Widget? tokenIcon;
  final ValueChanged<double> onStakeConfirm;
  @override
  State<StakeOnNFTPage> createState() => _StakeOnNFTPageState();
}

class _StakeOnNFTPageState extends State<StakeOnNFTPage> {
  final Palette _palette = Palette();
  final TextStyle whiteStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontSize: 22,
    height: 1,
  );
  @override
  Widget build(BuildContext context) {
    final Color base = AppBarTheme.of(context).backgroundColor!;
    return LayoutBuilder(
      builder: (context, constraint) {
        return Container(
          decoration: BoxDecoration(
            color: base,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(40),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                width: constraint.maxWidth,
                child: Center(
                  child: Container(
                    height: 6,
                    width: constraint.maxWidth * .3,
                    decoration: BoxDecoration(
                      color: _palette.kNToDark,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Text(
                        "Stake NFT",
                        style: whiteStyle,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Stake :",
                            style: whiteStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          Row(
                            children: [
                              if (widget.tokenIcon != null) ...{
                                widget.tokenIcon!,
                                const SizedBox(
                                  width: 10,
                                ),
                              },
                              Text(
                                widget.network,
                                style: whiteStyle.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      // SizedBox(
                      //   height: isAvailable ? 20 : constraint.maxHeight * .2,
                      // ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
