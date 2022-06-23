import 'package:flutter/material.dart';
import 'package:kprn/constant/palette.dart';
import 'package:kprn/extensions/color_extension.dart';

class RoiCalculator extends StatefulWidget {
  const RoiCalculator({
    Key? key,
    required this.maxStaked,
  }) : super(key: key);
  final double maxStaked;
  @override
  State<RoiCalculator> createState() => _RoiCalculatorState();
}

class _RoiCalculatorState extends State<RoiCalculator> {
  int? stakeForIndexChoice;
  int? compoundEveryIndexChoice;
  late double currentRate = widget.maxStaked;
  final List<String> stakedForChoices = [
    "1D",
    "7D",
    "30D",
    "1Y",
    "5Y",
  ];
  final List<String> compoundEveryChoices = [
    "1D",
    "7D",
    "14D",
    "30D",
  ];
  final TextStyle whiteStyle = const TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.w700,
    height: 1,
  );

  Widget contentContainer({required String title, required Widget child}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: whiteStyle.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          child,
        ],
      );
  @override
  Widget build(BuildContext context) {
    final Color base = AppBarTheme.of(context).backgroundColor!;
    return OrientationBuilder(
      builder: (context, orientation) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PreferredSize(
                  preferredSize: const Size.fromHeight(60),
                  child: AppBar(
                    automaticallyImplyLeading: false,
                    title: const Text("ROI Calculator"),
                    centerTitle: false,
                    elevation: 0,
                    actions: [
                      IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
                          Navigator.of(context).pop(null);
                        },
                        icon: const Icon(
                          Icons.close_rounded,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        contentContainer(
                          title: "KHPRN Staked",
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: base.lighten().withOpacity(.8),
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(0),
                              title: Text(
                                currentRate.toStringAsFixed(2),
                                style: whiteStyle,
                              ),
                              subtitle: Text(
                                "${(currentRate * .001).toStringAsFixed(2)} USD",
                                style: whiteStyle.copyWith(
                                  color: Colors.white.withOpacity(.3),
                                  fontSize: 15,
                                  height: 1.5,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        contentContainer(
                          title: "Staked For :",
                          child: SizedBox(
                            width: double.maxFinite,
                            height: 60,
                            child: LayoutBuilder(
                              builder: (_, constraint) => SizedBox(
                                width: constraint.maxWidth,
                                child: ListView.separated(
                                  // shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (_, index) => ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      width: (constraint.maxWidth /
                                              stakedForChoices.length) -
                                          10,
                                      // padding: const EdgeInsets.all(30),
                                      decoration: BoxDecoration(
                                        // color: Colors.blue,
                                        border: Border.all(
                                          color: stakeForIndexChoice == index
                                              ? Colors.transparent
                                              : Colors.white,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Stack(
                                        children: [
                                          if (stakeForIndexChoice == index) ...{
                                            Positioned.fill(
                                              child: ShaderMask(
                                                shaderCallback: (Rect bounds) =>
                                                    Palette()
                                                        .buttonGradient
                                                        .createShader(bounds),
                                                child: Container(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )
                                          },
                                          Positioned.fill(
                                            child: MaterialButton(
                                              onPressed: () {
                                                if (stakeForIndexChoice ==
                                                    index) {
                                                  stakeForIndexChoice = null;
                                                } else {
                                                  stakeForIndexChoice = index;
                                                }
                                                setState(() {});
                                              },
                                              padding: const EdgeInsets.all(0),
                                              child: Center(
                                                child: Text(
                                                  stakedForChoices[index],
                                                  style: whiteStyle.copyWith(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  separatorBuilder: (_, index) =>
                                      const SizedBox(
                                    width: 10,
                                  ),
                                  itemCount: stakedForChoices.length,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        contentContainer(
                          title: "Compounding Every :",
                          child: SizedBox(
                            width: double.maxFinite,
                            height: 60,
                            child: LayoutBuilder(
                              builder: (_, constraint) => SizedBox(
                                width: constraint.maxWidth,
                                child: ListView.separated(
                                  // shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (_, index) => ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      width: (constraint.maxWidth /
                                              compoundEveryChoices.length) -
                                          10,
                                      // padding: const EdgeInsets.all(30),
                                      decoration: BoxDecoration(
                                        // color: Colors.blue,
                                        border: Border.all(
                                          color:
                                              compoundEveryIndexChoice == index
                                                  ? Colors.transparent
                                                  : Colors.white,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Stack(
                                        children: [
                                          if (compoundEveryIndexChoice ==
                                              index) ...{
                                            Positioned.fill(
                                              child: ShaderMask(
                                                shaderCallback: (Rect bounds) =>
                                                    Palette()
                                                        .buttonGradient
                                                        .createShader(bounds),
                                                child: Container(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )
                                          },
                                          Positioned.fill(
                                            child: MaterialButton(
                                              onPressed: () {
                                                if (compoundEveryIndexChoice ==
                                                    index) {
                                                  compoundEveryIndexChoice =
                                                      null;
                                                } else {
                                                  compoundEveryIndexChoice =
                                                      index;
                                                }
                                                setState(() {});
                                              },
                                              padding: const EdgeInsets.all(0),
                                              child: Center(
                                                child: Text(
                                                  compoundEveryChoices[index],
                                                  style: whiteStyle.copyWith(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  separatorBuilder: (_, index) =>
                                      const SizedBox(
                                    width: 10,
                                  ),
                                  itemCount: compoundEveryChoices.length,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(
                            width: double.maxFinite,
                            height: 130,
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: ShaderMask(
                                    shaderCallback: (Rect bounds) => Palette()
                                        .buttonGradient
                                        .createShader(bounds),
                                    child: Container(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Container(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "ROI at current rates",
                                          style: whiteStyle.copyWith(
                                            fontSize: 13,
                                            height: 1.5,
                                          ),
                                        ),
                                        Text(
                                          "\$130.95",
                                          style: whiteStyle.copyWith(
                                            fontSize: 33,
                                          ),
                                        ),
                                        Text(
                                          "503.95 KHPRN",
                                          style: whiteStyle.copyWith(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            // height: 1.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
