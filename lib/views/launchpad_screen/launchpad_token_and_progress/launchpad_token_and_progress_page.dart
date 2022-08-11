import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:kprn/constant/khprn.dart';
import 'package:kprn/constant/palette.dart';
import 'package:kprn/extensions/color_extension.dart';
import 'package:kprn/models/abi_model/sales/salesContract.g.dart';
import 'package:kprn/models/token_network.dart';
import 'package:kprn/models/user_model.dart';
import 'package:kprn/view_models/logged_user_vm.dart';
import 'package:kprn/views/progress_viewer/progress_viewer.dart';
import 'package:web3dart/web3dart.dart';

class LaunchPadTokenDetailsAndProgress extends StatefulWidget {
  const LaunchPadTokenDetailsAndProgress({
    Key? key,
    required this.name,
    required this.network,
    required this.progress,
    required this.startDate,
    required this.endDate,
    required this.address,
    required this.networkImage,
    required this.symbol,
    this.onPressed,
    required this.salesAddress,
    required this.type,
    // required this.maxProgressRate,
  }) : super(key: key);
  final String name;
  final String symbol;
  final TokenNetwork network;
  final double progress;
  final String salesAddress;
  // final double maxProgressRate;
  final String address;
  final DateTime startDate;
  final String? networkImage;
  final DateTime? endDate;
  final String type;
  final Function()? onPressed;
  @override
  State<LaunchPadTokenDetailsAndProgress> createState() =>
      _LaunchPadTokenDetailsAndProgressState();
}

class _LaunchPadTokenDetailsAndProgressState
    extends State<LaunchPadTokenDetailsAndProgress> {
  late final UserModel user = _vm.current!;
  late final SalesContract _contract = SalesContract(
    address: EthereumAddress.fromHex(
      widget.salesAddress,
    ),
    client: Web3Client(
      rpcUrl,
      Client(),
    ),
    chainId: user.chainId,
  );
  final LoggedUserVm _vm = LoggedUserVm.instance;
  final Palette _palette = Palette();
  final TextStyle style = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontSize: 22,
    height: 1,
  );
  @override
  Widget build(BuildContext context) {
    final Color base = AppBarTheme.of(context).backgroundColor!;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: base.lighten().withOpacity(.5),
      ),
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Row(
            children: [
              if (widget.networkImage != null ||
                  widget.networkImage!.isNotEmpty) ...{
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: NetworkImage(
                        widget.networkImage!,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              },
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: style,
                  ),
                  Row(
                    children: [
                      Text(
                        "Network :",
                        style: style.copyWith(
                          fontSize: 15,
                          color: Colors.white.withOpacity(.3),
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      if (widget.network.networkIconPath != null) ...{
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: Image.network(
                            widget.network.networkIconPath!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      },
                      Text(
                        widget.network.name,
                        style: style.copyWith(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ))
            ],
          ),
          const SizedBox(
            height: 30,
          ),
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
                padding: const EdgeInsets.all(20),
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "1 ${widget.network.name} = ${widget.network.tokenEquivalent.toInt()} ${widget.symbol}",
                      style: style.copyWith(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "Token Price : ${widget.network.usdtEquivalent.toStringAsFixed(2)}\$",
                      style: style.copyWith(
                        fontSize: 16,
                        color: Colors.white.withOpacity(.3),
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Soft/Hard Cap :",
                  style: style.copyWith(
                    fontSize: 15,
                  ),
                ),
              ),
              Text(
                "${widget.network.softCap} ${widget.network.name} - ${widget.network.hardCap} ${widget.network.name}",
                style: style.copyWith(
                  fontSize: 15,
                  color: _palette.kNToDark,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          ProgressViewer(
              contract: _contract,
              type: widget.type,
              softCap: widget.network.softCap,
              hardCap: widget.network.hardCap),
          // Row(
          //   children: [
          //     Expanded(
          //       child: Text(
          //         "Progress ${(widget.progress * 100).round()}%",
          //         style: style.copyWith(
          //           fontSize: 13,
          //           color: Colors.white.withOpacity(.3),
          //         ),
          //       ),
          //     ),
          //     Text(
          //       "${(widget.maxProgressRate * widget.progress).toInt()}",
          //       style: style.copyWith(
          //         fontSize: 13,
          //         color: Colors.white.withOpacity(.3),
          //       ),
          //     )
          //   ],
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(20),
          //   child: Container(
          //     width: double.maxFinite,
          //     height: 18,
          //     color: Colors.white,
          //     child: LayoutBuilder(
          //       builder: (_, constraint) => Align(
          //         alignment: AlignmentDirectional.centerStart,
          //         child: Container(
          //           width: constraint.maxWidth * widget.progress,
          //           height: 18,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(20),
          //             color: const Color(0xff21CDD8),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: 30,
          ),
          DottedBorder(
            borderType: BorderType.RRect,
            padding: const EdgeInsets.all(0),
            dashPattern: const [7],
            color: Colors.grey.shade500.withOpacity(.5),
            child: const SizedBox(
              height: 0,
              width: double.maxFinite,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Start Date :",
                  style: style.copyWith(
                    fontSize: 15,
                    color: Colors.white.withOpacity(.5),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Text(
                DateFormat("MMMM dd, yyyy").format(widget.startDate),
                style: style.copyWith(
                  fontSize: 15,
                ),
              )
            ],
          ),
          if (widget.endDate != null) ...{
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "End Date :",
                    style: style.copyWith(
                      fontSize: 15,
                      color: Colors.white.withOpacity(.5),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Text(
                  DateFormat("MMMM dd, yyyy").format(widget.endDate!),
                  style: style.copyWith(
                    fontSize: 15,
                  ),
                )
              ],
            ),
          },
          const SizedBox(
            height: 30,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: double.maxFinite,
              height: 60,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) =>
                          _palette.buttonGradient.createShader(bounds),
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: MaterialButton(
                      onPressed: widget.onPressed,
                      child: Center(
                        child: Text(
                          "Token Details",
                          style: style.copyWith(
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
        ],
      ),
    );
  }
}
