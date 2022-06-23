import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kprn/constant/palette.dart';
import 'package:kprn/extensions/color_extension.dart';

class StakeOnTokenPage extends StatefulWidget {
  const StakeOnTokenPage({
    Key? key,
    required this.tokenSymbol,
    required this.maxTokenOwned,
    required this.minTokenToStake,
    required this.onStakeConfirm,
    this.tokenIcon,
  }) : super(key: key);
  final String tokenSymbol;
  final double maxTokenOwned;
  final double minTokenToStake;
  final Widget? tokenIcon;
  final ValueChanged<double> onStakeConfirm;
  // final Function()? onStakeConfirm;
  @override
  State<StakeOnTokenPage> createState() => _StakeOnTokenPageState();
}

class _StakeOnTokenPageState extends State<StakeOnTokenPage> {
  double sliderValue = 1;
  final Palette _palette = Palette();
  final TextStyle whiteStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontSize: 22,
    height: 1,
  );

  final List<Map> _percentageSelection = [
    {
      "label": "25%",
      "value": .25,
    },
    {
      "label": "space",
    },
    {
      "label": "50%",
      "value": .5,
    },
    {
      "label": "space",
    },
    {
      "label": "75%",
      "value": .75,
    },
    {
      "label": "space",
    },
    {
      "label": "max",
      "value": 1.0,
    },
  ];
  late double toStakeAmount = widget.maxTokenOwned * sliderValue;

  late final bool isAvailable = widget.minTokenToStake < widget.maxTokenOwned;
  @override
  Widget build(BuildContext context) {
    final Color base = AppBarTheme.of(context).backgroundColor!;
    return LayoutBuilder(builder: (context, constraint) {
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
                      "Add Stake",
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
                              widget.tokenSymbol,
                              style: whiteStyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: isAvailable ? 20 : constraint.maxHeight * .2,
                    ),
                    Container(
                      width: constraint.maxWidth,
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: base.lighten().withOpacity(.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: isAvailable
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  toStakeAmount.toStringAsFixed(2),
                                  style: whiteStyle,
                                ),
                                Text(
                                  "${(widget.maxTokenOwned * 0.001).toStringAsFixed(2)} USD",
                                  style: whiteStyle.copyWith(
                                    color: Colors.white.withOpacity(.35),
                                    fontSize: 15,
                                    height: 1.5,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            )
                          : Center(
                              child: Text(
                                "Insufficient Fund",
                                style: whiteStyle,
                              ),
                            ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.info,
                          color: Colors.white.withOpacity(.35),
                          size: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                            "Minimum ${widget.minTokenToStake.toStringAsFixed(2)} ${widget.tokenSymbol.toLowerCase()}",
                            style: whiteStyle.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.white.withOpacity(.35),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    if (isAvailable) ...{
                      Slider.adaptive(
                        autofocus: true,
                        value: sliderValue,
                        onChangeStart: (value) {},
                        onChangeEnd: (value) {
                          final double _toStakeAmount =
                              widget.maxTokenOwned * value;
                          print("END");
                          if (_toStakeAmount < widget.minTokenToStake) {
                            setState(() {
                              toStakeAmount = widget.minTokenToStake;
                              sliderValue =
                                  toStakeAmount / widget.maxTokenOwned;
                            });
                          }
                        },
                        onChanged: (value) {
                          final double _toStakeAmount =
                              widget.maxTokenOwned * value;
                          setState(() {
                            toStakeAmount = _toStakeAmount;
                            sliderValue = value;
                          });
                        },
                        min: 0,
                        max: 1,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: _percentageSelection
                            .map(
                              (e) => e['label'] == "space"
                                  ? const SizedBox(
                                      width: 10,
                                    )
                                  : Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: sliderValue == e['value']
                                                    ? Colors.transparent
                                                    : Colors.white),
                                          ),
                                          child: MaterialButton(
                                            height: 60,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            color: sliderValue == e['value']
                                                ? _palette.kNToDark
                                                : null,
                                            onPressed: () {
                                              final double _ff =
                                                  widget.maxTokenOwned *
                                                      e['value'];
                                              if (_ff >=
                                                  widget.minTokenToStake) {
                                                setState(() {
                                                  sliderValue = e['value'];
                                                  toStakeAmount = _ff;
                                                });
                                              } else {
                                                Fluttertoast.showToast(
                                                  msg:
                                                      "${e['label']} of your token is insufficient.",
                                                );
                                              }
                                            },
                                            child: Center(
                                              child: Text(
                                                e['label']
                                                    .toString()
                                                    .toUpperCase(),
                                                style: whiteStyle.copyWith(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                            )
                            .toList(),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                          width: constraint.maxWidth,
                          height: 60,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: ShaderMask(
                                  shaderCallback: (Rect bounds) => _palette
                                      .buttonGradient
                                      .createShader(bounds),
                                  child: Container(
                                    color: Colors.white,
                                    width: double.maxFinite,
                                    height: 60,
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                child: MaterialButton(
                                  onPressed: () {
                                    widget.onStakeConfirm(toStakeAmount);
                                  },
                                  disabledColor: _palette.greyColor
                                      .lighten()
                                      .withOpacity(.5),
                                  child: Center(
                                    child: Text(
                                      "Confirm",
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
                      )
                    },
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
