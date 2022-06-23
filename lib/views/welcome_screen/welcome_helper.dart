import 'package:flutter/material.dart';

class WelcomeHelper {
  Widget titleContainer(
    double width, {
    required String title,
  }) =>
      Container(
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      );
  Widget itemContainer(
    double width, {
    required String title,
    required String subtitle,
    required Positioned icon,
    required Widget background,
    Function()? onPressed,
  }) =>
      SizedBox(
        width: width - 40,
        height: 140,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: MaterialButton(
                  onPressed: onPressed,
                  padding: const EdgeInsets.all(0),
                  child: SizedBox(
                    width: width - 40,
                    height: 130,
                    child: Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          background,
                          Positioned(
                            right: 0,
                            child: Container(
                              width: (width - 40) * .5,
                              constraints: BoxConstraints(
                                maxWidth: (width - 40) * .5,
                              ),
                              padding: const EdgeInsets.only(
                                right: 25,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      height: 1,
                                    ),
                                  ),
                                  Text(
                                    subtitle,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            icon,
          ],
        ),
      );
}
