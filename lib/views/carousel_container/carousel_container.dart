import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kprn/constant/palette.dart';

class HelperContainer {
  final Palette _palette = Palette();
  Widget pageContainer({
    Function()? onPressed,
    required Color bgColor,
    required String title,
    required String subtitle,
    required double aprPercentage,
  }) =>
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          width: double.maxFinite,
          height: 215,
          // color: bgColor,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(10),
          //   color: bgColor,
          // ),
          // padding: const EdgeInsets.all(25),
          child: MaterialButton(
            color: bgColor,
            disabledColor: bgColor,
            onPressed: onPressed,
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            subtitle,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Up to",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "${aprPercentage.toStringAsFixed(2)} %",
                        style: TextStyle(
                          color: Palette().kNToDark,
                          fontWeight: FontWeight.w700,
                          fontSize: 35,
                        ),
                      ),
                      const Text(
                        "APR",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );

  Widget tokenInfoMinContainer(
    double width, {
    String? symbol,
    required Color bgColor,
    required String title,
    required String subtitle,
    String? imageUrl,
    required double hardCap,
    required double softCap,
    Function()? onPressed,
  }) =>
      Container(
        width: width,
        height: 260,
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (imageUrl != null && imageUrl.isNotEmpty) ...{
                  ClipRRect(
                    borderRadius: BorderRadius.circular(120),
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: imageUrl.contains(".svg")
                          ? SvgPicture.network(
                              imageUrl,
                              alignment: Alignment.topLeft,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              imageUrl,
                              alignment: Alignment.topLeft,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  // Container(
                  //   width: 60,
                  //   height: 60,
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     shape: BoxShape.circle,
                  //     image: DecorationImage(
                  //       fit: BoxFit.cover,
                  //       alignment: Alignment.center,
                  //       image: NetworkImage(
                  //         imageUrl,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    width: 10,
                  ),
                },
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: title.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 22,
                              height: 1,
                            ),
                            children: [
                              if (symbol != null) ...{
                                TextSpan(
                                  text: " ($symbol)",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white.withOpacity(.5),
                                  ),
                                ),
                              }
                            ]),
                      ),
                      Text(
                        subtitle.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Soft / Hard Cap",
                    style: TextStyle(
                      color: Colors.white.withOpacity(.5),
                      fontSize: 15,
                      height: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "$softCap BNB - $hardCap BNB",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      height: 1,
                    ),
                  )
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: double.maxFinite,
                height: 60,
                decoration: BoxDecoration(
                  gradient: _palette.buttonGradient,
                ),
                child: TextButton(
                  onPressed: onPressed,
                  child: const SizedBox(
                    width: double.maxFinite,
                    child: Center(
                      child: Text(
                        "Token Details",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
}
