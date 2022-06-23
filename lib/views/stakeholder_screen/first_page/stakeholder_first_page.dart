import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kprn/constant/global.dart';
import 'package:kprn/data_listeners_and_handlers/stakeholder_page_handler.dart';
import 'package:kprn/views/stakeholder_screen/second_page/stake_on_screen.dart';
import 'package:kprn/views/stakeholder_screen/stakeholder_helper.dart';

class StakeholderFirstPage extends StatelessWidget with StakeholderHelper {
  StakeholderFirstPage({
    Key? key,
    required this.onBackPressed,
    required this.handler,
  }) : super(key: key);
  final Function()? onBackPressed;
  final StakeholderPageHandler handler;

  @override
  Widget build(BuildContext context) {
    final Color base = AppBarTheme.of(context).backgroundColor!;
    return LayoutBuilder(builder: (context, constraint) {
      return SingleChildScrollView(
        // padding: const EdgeInsets.symmetric(
        //   horizontal: 20,
        // ),
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
                title: const Text("Stakeholder"),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DottedBorder(
                    dashPattern: const [
                      5,
                    ],
                    color: Colors.grey.shade500.withOpacity(.5),
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    padding: const EdgeInsets.all(25),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/logo.png",
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Khephren",
                                      style: titleFormat,
                                    ),
                                    Text(
                                      "(KHPRN)",
                                      style: subtitleFormat,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "\$0.015338",
                                    style: titleFormat,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(
                                    Icons.arrow_drop_up_sharp,
                                    color: Colors.green,
                                    size: 25,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "1.02%",
                                    style: titleFormat.copyWith(
                                      color: Colors.green,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "1 KHPRN = .0051 BNB",
                                style: titleFormat.copyWith(
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Circulating Supply :   20,545,652",
                                style: subtitleFormat.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: constraint.maxWidth - 40,
                    child: const Text(
                      "Stake with Khprn Tokens",
                      style: TextStyle(
                        fontSize: 45,
                        height: 1.3,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  itemContainer(
                    constraint.maxWidth,
                    onPressed: () {
                      handler.fore(
                        StakeOnScreen(
                          from: 0,
                          onBackPressed: onBackPressed,
                        ),
                      );
                    },
                    bgColor: base,
                    title: "Stake on our Khprn Token",
                    subtitle:
                        "Own a part of Khprn Token and have unique access.",
                    isOrange: true,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  itemContainer(
                    constraint.maxWidth,
                    onPressed: () {
                      handler.fore(
                        StakeOnScreen(
                          from: 1,
                          onBackPressed: onBackPressed,
                        ),
                      );
                    },
                    bgColor: base,
                    title: "Stake on our Staking Project",
                    subtitle: "Earn from the fees that goes to the Staking.",
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  itemContainer(
                    onPressed: () {
                      handler.fore(
                        StakeOnScreen(
                          from: 2,
                          onBackPressed: onBackPressed,
                        ),
                      );
                    },
                    constraint.maxWidth,
                    bgColor: base,
                    title: "Stake on our Launchpad Project",
                    subtitle: "Earn from the fees that goes to the Launchpad.",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      );
    });
  }
}
