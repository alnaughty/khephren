import 'package:ethers/ethers.dart';
import 'package:flutter/material.dart';
import 'package:kprn/constant/palette.dart';
import 'package:kprn/models/abi_model/sales/salesContract.g.dart';

class ProgressViewer extends StatefulWidget {
  const ProgressViewer(
      {Key? key,
      required this.contract,
      required this.type,
      required this.softCap,
      required this.hardCap})
      : super(key: key);
  final SalesContract contract;
  final String type;
  final double softCap;
  final double hardCap;
  @override
  State<ProgressViewer> createState() => _ProgressViewerState();
}

class _ProgressViewerState extends State<ProgressViewer> {
  double? balance;
  final Ethers ethers = Ethers();
  void getBalance() async {
    await widget.contract.raised().then((value) {
      setState(() {
        balance = double.parse(ethers.utils.formatEther(value));
      });
    });
  }

  final TextStyle whiteStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    height: 1,
    fontSize: 22,
  );
  @override
  void initState() {
    getBalance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return balance == null
        ? Container()
        : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Progress : ",
                      style: whiteStyle.copyWith(
                        color: Palette.borderColor.withOpacity(.5),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text:
                              "${((balance! / (widget.type == "0x0" ? widget.hardCap : widget.softCap)) * 100).toStringAsFixed(2)}%",
                          style: whiteStyle.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Palette.borderColor.withOpacity(.5),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "$balance",
                    style: whiteStyle.copyWith(
                      color: Palette.borderColor.withOpacity(.5),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: double.maxFinite,
                  height: 18,
                  color: Colors.white,
                  child: LayoutBuilder(
                    builder: (_, constraint) => Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Container(
                        width: constraint.maxWidth *
                            (balance! /
                                (widget.type == "0x0"
                                    ? widget.hardCap
                                    : widget.softCap)),
                        height: 18,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xff21CDD8),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
