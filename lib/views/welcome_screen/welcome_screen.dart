import 'package:flutter/material.dart';
import 'package:kprn/constant/palette.dart';
import 'package:kprn/data_listeners_and_handlers/landing_page_handler.dart';
import 'package:kprn/extensions/color_extension.dart';
import 'package:kprn/views/carousel/custom_carousel.dart';
import 'package:kprn/views/carousel_container/carousel_container.dart';
import 'package:kprn/views/launchpad_screen/launchpad_screen.dart';
import 'package:kprn/views/stakeholder_screen/stakeholder_screen.dart';
import 'package:kprn/views/staking_screen/staking_screen.dart';
import 'package:kprn/views/token_details_screen/token_details_screen.dart';
import 'package:kprn/views/welcome_screen/welcome_helper.dart';

class WelcomeScreen extends StatelessWidget
    with WelcomeHelper, HelperContainer {
  WelcomeScreen({Key? key}) : super(key: key);
  static final LandingPageHandler _landingPageHandler =
      LandingPageHandler.instance;
  @override
  Widget build(BuildContext context) {
    final Color base = AppBarTheme.of(context).backgroundColor!;
    return LayoutBuilder(builder: (context, constraint) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Welcome!",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 0,
                        maxWidth: constraint.maxWidth * .7,
                      ),
                      child: const Text(
                        "Be part of us, Stake and Launch your own projects with khephren",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          height: 1,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    itemContainer(
                      constraint.maxWidth,
                      onPressed: () {
                        _landingPageHandler.update(
                          const StakeholderScreen(),
                          1,
                        );
                      },
                      title: "Stakeholder",
                      subtitle: "Be part of us w/ khprn tokens",
                      icon: Positioned(
                        top: -7,
                        left: 10,
                        child: Image.asset("assets/icons/coin.png"),
                      ),
                      background: ShaderMask(
                        shaderCallback: (_) =>
                            Palette().buttonGradient.createShader(_),
                        child: Container(
                          width: constraint.maxWidth,
                          height: 130,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    itemContainer(
                      constraint.maxWidth,
                      onPressed: () {
                        _landingPageHandler.update(
                          const StakingScreen(),
                          1,
                        );
                      },
                      title: "Staking",
                      subtitle: "Stake your tokens or NFT's and Earn",
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
                    itemContainer(
                      constraint.maxWidth,
                      onPressed: () {
                        _landingPageHandler.update(
                          const LaunchpadScreen(),
                          1,
                        );
                      },
                      title: "Launchpad",
                      subtitle: "Safest launchpad Multi-chain.",
                      icon: Positioned(
                        top: -20,
                        left: 0,
                        child: Image.asset(
                          "assets/icons/rocket.png",
                          height: 185,
                          width: 144,
                          fit: BoxFit.cover,
                        ),
                      ),
                      background: Container(
                        width: constraint.maxWidth,
                        height: 130,
                        color: base.lighten().withOpacity(.8),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleContainer(
                    constraint.maxWidth,
                    title: "Top Pools",
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
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              titleContainer(
                constraint.maxWidth,
                title: "Upcoming Projects",
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                separatorBuilder: (_, index) => const SizedBox(
                  height: 15,
                ),
                itemBuilder: (_, index) => tokenInfoMinContainer(
                  onPressed: () {
                    _landingPageHandler.update(
                      TokenDetails(
                        onReturn: () {
                          _landingPageHandler.reset();
                        },
                        tokenAddress:
                            "0x001BC0341CFC7e6f3B3DD67bcBBd44aB55Ed3cb9",
                      ),
                      1,
                    );
                  },
                  constraint.maxWidth,
                  bgColor: base.lighten().withOpacity(.8),
                  symbol: "BONK",
                  hardCap: 175,
                  imageUrl:
                      'https://s2.coinmarketcap.com/static/img/coins/64x64/10407.png',
                  softCap: 85,
                  subtitle: '1 BNB = 522.45',
                  title: 'BABY BONK',
                ),
              ),
              const SafeArea(
                child: SizedBox(
                  height: 20,
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
