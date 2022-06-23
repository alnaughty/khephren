import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kprn/constant/global.dart';
import 'package:kprn/constant/palette.dart';
import 'package:kprn/views/roi_calculator/roi_calculator.dart';

class StakeOnScreen extends StatelessWidget {
  const StakeOnScreen({
    Key? key,
    required this.from,
    required this.onBackPressed,
  }) : super(key: key);
  final int from;
  final Function()? onBackPressed;
  static final Palette _palette = Palette();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraint) {
      return SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: AppBar(
                elevation: 0,
                centerTitle: true,
                title: Text(
                    "Stake on ${from == 0 ? "KHPRN" : from == 1 ? "Staking" : "Launchpad"}"),
                backgroundColor: Colors.transparent,
                leading: BackButton(
                  color: Colors.white,
                  onPressed: onBackPressed,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DottedBorder(
                    dashPattern: const [
                      5,
                    ],
                    color: Colors.grey.shade500.withOpacity(.5),
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        width: constraint.maxWidth,
                        // height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "APR :",
                              style: titleFormat,
                            ),
                            MaterialButton(
                              onPressed: () {
                                showGeneralDialog(
                                    barrierColor: Colors.black.withOpacity(0.5),
                                    transitionBuilder:
                                        (context, a1, a2, widget) {
                                      return Transform.scale(
                                        scale: a1.value,
                                        child: Opacity(
                                          opacity: a1.value,
                                          child: const SafeArea(
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                left: 30,
                                                right: 30,
                                                bottom: 30,
                                                top: 60,
                                              ),
                                              child: RoiCalculator(
                                                maxStaked: 10000,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    transitionDuration:
                                        const Duration(milliseconds: 200),
                                    barrierDismissible: true,
                                    barrierLabel: '',
                                    context: context,
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            Container());
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  /// PERCENT
                                  const Text(
                                    "76.19%",
                                    style: titleFormat,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset(
                                    "assets/icons/calculator.png",
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "KHPRN",
                      style: titleFormat.copyWith(
                        color: _palette.kNToDark.shade100,
                      ),
                      children: const [
                        TextSpan(
                          text: " Earned",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
