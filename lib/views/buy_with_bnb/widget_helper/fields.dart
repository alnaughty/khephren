import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kprn/constant/palette.dart';
import 'package:kprn/extensions/color_extension.dart';
import 'package:kprn/services/extension/comma_formatter.dart';

class BuyWithBnbHelper {
  Widget field(
    Color base, {
    Image? image,
    required TextEditingController controller,
    required TextStyle whiteStyle,
    Function()? onPressedMax,
    required String hintText,
    required double minBuy,
    required double maxBuy,
    bool isEnabled = true,
    Function(String)? onChanged,
    bool hasValidator = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: base.lighten().withOpacity(.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          if (image != null) ...{
            image,
            // Image.network(
            //   "https://assets.coingecko.com/coins/images/825/small/bnb-icon2_2x.png?1644979850",
            //   width: 25,
            //   height: 25,
            // ),
            const SizedBox(
              width: 10,
            ),
          },
          Expanded(
            child: TextFormField(
              enabled: isEnabled,
              controller: controller,
              style: whiteStyle,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              onChanged: onChanged,
              inputFormatters: [
                // TextInputFormatter()
                CommaFormatter(),
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,10}')),
              ],
              validator: hasValidator
                  ? (text) {
                      if (text == null) return "Do not leave empty";
                      final double val = double.tryParse(text) ?? minBuy;
                      if (val < minBuy) {
                        return "Please reach the minimum purchase";
                      } else if (val > maxBuy) {
                        return "Puchase exceeds the limit";
                      }
                    }
                  : null,
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: hintText,
                hintStyle: whiteStyle.copyWith(
                  color: Colors.white10,
                ),
              ),
            ),
          ),
          if (onPressedMax != null) ...{
            TextButton(
              onPressed: onPressedMax,
              child: Text(
                "MAX",
                style: whiteStyle.copyWith(
                  color: Palette().kNToDark,
                ),
              ),
            )
          },
        ],
      ),
    );
  }
}
