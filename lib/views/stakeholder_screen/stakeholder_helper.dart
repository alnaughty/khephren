import 'package:flutter/material.dart';
import 'package:kprn/constant/palette.dart';
import 'package:kprn/extensions/color_extension.dart';

class StakeholderHelper {
  final Palette _palette = Palette();
  Widget itemContainer(
    double width, {
    Function()? onPressed,
    bool isOrange = false,
    required Color bgColor,
    required String title,
    required String subtitle,
  }) =>
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          width: width - 40,
          height: 155,
          child: Stack(
            children: [
              if (isOrange) ...{
                Positioned.fill(
                  child: ShaderMask(
                    shaderCallback: (_) =>
                        _palette.buttonGradient.createShader(_),
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Image.asset(
                    "assets/icons/star.png",
                    color: _palette.kNToDark.withOpacity(.3),
                  ),
                ),
              } else ...{
                Positioned.fill(
                  child: Container(
                    color: bgColor.lighten().withOpacity(.8),
                  ),
                )
              },
              Positioned.fill(
                child: MaterialButton(
                  onPressed: onPressed,
                  padding: const EdgeInsets.all(25),
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: (width - 40) * .65,
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: (width - 40) * .6,
                          child: Text(
                            subtitle,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
