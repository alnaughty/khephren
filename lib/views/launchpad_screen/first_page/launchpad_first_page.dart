import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kprn/constant/palette.dart';
import 'package:kprn/data_listeners_and_handlers/launchpad_page_handler.dart';
import 'package:kprn/models/launchpad_data.dart';
import 'package:kprn/models/token_network.dart';
import 'package:kprn/models/user_model.dart';
import 'package:kprn/services/API/launchpad.dart';
import 'package:kprn/view_models/logged_user_vm.dart';
import 'package:kprn/views/launchpad_screen/launchpad_token_and_progress/launchpad_token_and_progress_page.dart';
import 'package:kprn/views/token_details_screen/token_details_screen.dart';
import 'package:rxdart/rxdart.dart';

class LaunchpadFirstPage extends StatefulWidget {
  const LaunchpadFirstPage({
    Key? key,
    required this.onBackPressed,
    required this.handler,
  }) : super(key: key);
  final Function()? onBackPressed;
  final LaunchpadPageHandler handler;

  @override
  State<LaunchpadFirstPage> createState() => _LaunchpadFirstPageState();
}

class _LaunchpadFirstPageState extends State<LaunchpadFirstPage> {
  final Palette _palette = Palette();
  final LoggedUserVm _vm = LoggedUserVm.instance;
  late final UserModel user = _vm.current!;
  late final TextEditingController _searchController;
  final FocusNode focusNode = FocusNode();
  List<LaunchpadData>? launchpads;
  bool _stakedOnly = false;
  String? selectedSort;
  final BehaviorSubject<String> searchString = BehaviorSubject<String>();
  late final StreamSubscription<String> listener;
  List<String> sortBy = [
    "hard_cap",
    "soft_cap",
    'start_date',
    "end_date",
  ];
  @override
  void initState() {
    _searchController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      launchpads = await fetchLaunchPads(
        "",
      );
      setState(() {});
    });
    listener = searchString
        .debounceTime(const Duration(milliseconds: 1500))
        .listen((toSearch) async {
      setState(() {
        launchpads = null;
      });
      launchpads = await fetchLaunchPads(toSearch);
      setState(() {});
    });
    super.initState();
  }

  final LaunchpadApi api = LaunchpadApi();
  Future<List<LaunchpadData>> fetchLaunchPads(String toSearch) async {
    FocusScope.of(context).unfocus();
    return await api.fetch(
      chainId: user.chainId,
      toSearch: toSearch,
      filter: selectedSort ?? "",
    );
  }

  @override
  void dispose() {
    listener.cancel();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color base = AppBarTheme.of(context).backgroundColor!;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: LayoutBuilder(
        builder: (_, constraint) {
          return SingleChildScrollView(
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
                    title: const Text("Launchpad"),
                    backgroundColor: Colors.transparent,
                    leading: BackButton(
                      color: Colors.white,
                      onPressed: widget.onBackPressed,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: constraint.maxWidth,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Newest Projects!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        focusNode: focusNode,
                        style: TextStyle(
                          color: _palette.kNToDark,
                        ),
                        onChanged: (text) {
                          searchString.add(text);
                        },
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: "Search Pool.",
                          prefixIcon: Icon(
                            Icons.search,
                            color: focusNode.hasFocus
                                ? _palette.kNToDark
                                : Colors.grey.shade600,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              _searchController.text = "";
                              setState(() {});
                              searchString.add("");
                            },
                            child: Icon(
                              Icons.clear,
                              color: focusNode.hasFocus
                                  ? _palette.kNToDark
                                  : Colors.grey.shade600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: 0,
                              maxWidth: constraint.maxWidth * .5,
                            ),
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              width: double.maxFinite,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                border: Border.all(
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  dropdownColor: Theme.of(context)
                                      .appBarTheme
                                      .backgroundColor,
                                  isExpanded: true,
                                  hint: Text(
                                    "Sort by",
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  items: sortBy
                                      .map(
                                        (e) => DropdownMenuItem<String>(
                                          value: e,
                                          child: Text(
                                            e
                                                .replaceAll("_", " ")
                                                .toUpperCase(),
                                            style: TextStyle(
                                              color: selectedSort == null
                                                  ? Colors.grey.shade600
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  iconEnabledColor: selectedSort == null
                                      ? Colors.grey.shade600
                                      : Colors.white,
                                  value: selectedSort,
                                  onChanged: (value) async {
                                    setState(() {
                                      selectedSort = value;
                                      launchpads = null;
                                    });
                                    List<LaunchpadData> dd =
                                        await fetchLaunchPads(
                                      _searchController.text,
                                    );
                                    setState(() {
                                      launchpads = dd;
                                    });
                                  },
                                ),
                              ),
                              // color: Colors.red,÷
                            ),
                          ),
                          // const Spacer(),
                          Row(
                            children: [
                              const Text(
                                "Staked\nOnly :",
                                style: TextStyle(
                                  color: Colors.white,
                                  height: 1,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Switch.adaptive(
                                activeColor: _palette.kNToDark,
                                // thumbColor: MaterialStateProperty.resolveWith(
                                //     (states) => Colors.red),
                                inactiveTrackColor: _palette.greyColor,
                                inactiveThumbColor: _palette.kNToDark,
                                value: _stakedOnly,
                                onChanged: (val) {
                                  setState(() {
                                    _stakedOnly = val;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      if (launchpads != null) ...{
                        if (launchpads!.isNotEmpty) ...{
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (_, index) {
                              LaunchpadData data = launchpads![index];
                              return LaunchPadTokenDetailsAndProgress(
                                onPressed: () async {
                                  widget.handler.fore(
                                    TokenDetails(
                                      onReturn: () {
                                        widget.handler.back();
                                      },
                                      data: data,
                                    ),
                                  );
                                },
                                name: data.token.name,
                                symbol: data.token.symbol,
                                // maxProgressRate: Random().nextInt(200000) + 10,
                                networkImage: data.projectDetails[2],
                                network: TokenNetwork(
                                  usdtEquivalent: 0.0,
                                  name: "BNB",
                                  tokenEquivalent: data.listingRate,
                                  networkIconPath:
                                      "https://assets.coingecko.com/coins/images/825/small/bnb-icon2_2x.png?1644979850",
                                  softCap: data.softCap,
                                  hardCap: data.hardCap,
                                ),
                                progress: Random().nextDouble(),
                                startDate: data.startDate,
                                endDate: data.endDate,
                                address: data.token.address,
                                salesAddress: data.saleAddress, type: data.type,
                              );
                            },
                            separatorBuilder: (_, index) => const SizedBox(
                              height: 25,
                            ),
                            itemCount: launchpads!.length,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        } else ...{
                          const SizedBox(
                            width: double.maxFinite,
                            height: 200,
                            child: Center(
                              child: Text(
                                "NO LAUNCHPAD FOUND ON YOUR QUERY",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        },
                      } else ...{
                        const SizedBox(
                          width: double.maxFinite,
                          height: 200,
                          child: Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                        )
                      },
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
