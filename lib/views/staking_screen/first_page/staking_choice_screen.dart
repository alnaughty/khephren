import 'package:flutter/material.dart';
import 'package:kprn/data_listeners_and_handlers/staking_page_handler.dart';
import 'package:kprn/extensions/color_extension.dart';
import 'package:kprn/views/staking_screen/second_page/nft_staking_screen.dart';
import 'package:kprn/views/staking_screen/second_page/token_staking_screen.dart';
import 'package:kprn/views/welcome_screen/welcome_helper.dart';

class StakingChoiceScreen extends StatelessWidget with WelcomeHelper {
  const StakingChoiceScreen({
    Key? key,
    required this.handler,
    required this.onBackPressed,
  }) : super(key: key);
  final Function()? onBackPressed;
  final StakingPageHandler handler;
  @override
  Widget build(BuildContext context) {
    final Color base = AppBarTheme.of(context).backgroundColor!;
    return LayoutBuilder(
      builder: (_, constraint) => SingleChildScrollView(
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
                title: const Text("Staking"),
                backgroundColor: Colors.transparent,
                leading: BackButton(
                  color: Colors.white,
                  onPressed: onBackPressed,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    width: constraint.maxWidth - 40,
                    child: RichText(
                      text: TextSpan(
                          text: "Stake with Tokens",
                          style: const TextStyle(
                            fontSize: 45,
                            height: 1.3,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: " or ",
                              style: TextStyle(
                                fontSize: 35,
                                color: Colors.white.withOpacity(.5),
                              ),
                            ),
                            const TextSpan(
                              text: "NFT's",
                            ),
                          ]),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  itemContainer(
                    constraint.maxWidth,
                    onPressed: () {
                      handler.fore(
                        TokenStakingScreen(onBackPressed: onBackPressed),
                      );
                    },
                    title: "Token Staking",
                    subtitle: "Stake your tokens",
                    icon: Positioned(
                      top: -14,
                      left: 0,
                      child: Image.asset(
                        "assets/icons/purse.png",
                        height: 144,
                        width: 144,
                      ),
                    ),
                    background: Container(
                      width: constraint.maxWidth,
                      height: 130,
                      color: base.lighten().withOpacity(.8),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: .5,
                            color: Colors.white.withOpacity(.5),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: const Text(
                            "OR",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: .5,
                            color: Colors.white.withOpacity(.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  itemContainer(
                    constraint.maxWidth,
                    onPressed: () {
                      handler.fore(
                        NFTStakingScreen(onBackPressed: onBackPressed),
                      );
                    },
                    title: "NFT Staking",
                    subtitle: "Stake your NFTs",
                    icon: Positioned(
                      top: -14,
                      left: 0,
                      child: Image.asset(
                        "assets/icons/nft.png",
                        height: 144,
                        width: 144,
                      ),
                    ),
                    background: Container(
                      width: constraint.maxWidth,
                      height: 130,
                      color: base.lighten().withOpacity(.8),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.info,
                        color: Colors.white.withOpacity(.3),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Only Selected NFTs can be staked!",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Colors.white.withOpacity(.3),
                        ),
                      )
                    ],
                  )
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
      ),
    );
  }
}
