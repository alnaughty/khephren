import 'package:badges/badges.dart';
import 'package:clipboard/clipboard.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kprn/constant/palette.dart';
import 'package:kprn/data_listeners_and_handlers/landing_page_data_processor.dart';
import 'package:kprn/data_listeners_and_handlers/landing_page_handler.dart';
import 'package:kprn/extensions/color_extension.dart';
import 'package:kprn/models/user_model.dart';
import 'package:kprn/views/welcome_screen/welcome_screen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({
    Key? key,
    required this.user,
  }) : super(key: key);
  final UserModel user;
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> with LandingDataProcessor {
  final GlobalKey<ScaffoldState> _kScaffold = GlobalKey<ScaffoldState>();
  final LandingPageHandler _handler = LandingPageHandler.instance;
  final Palette _palette = Palette();

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      print(widget.user.chainId);
      await run(97).whenComplete(() => setState(() {}));
    });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color appbarColor = AppBarTheme.of(context).backgroundColor!;
    return Scaffold(
      key: _kScaffold,
      drawer: Drawer(
        backgroundColor: Colors.transparent,
        child: LayoutBuilder(builder: (context, drwConstraint) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(40),
              ),
              color: appbarColor,
            ),
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "Wallet Info",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        IconButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () {
                            Navigator.of(context).pop(null);
                          },
                          icon: const Icon(
                            Icons.close_rounded,
                            color: Colors.white,
                            size: 31,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(10),
                            ),
                            child: Container(
                              width: drwConstraint.maxWidth * .5,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                gradient: _palette.buttonGradient,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/logo-small.png",
                                    width: 20,
                                    height: 20,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    "STAKEHOLDER",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.italic),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: drwConstraint.maxWidth,
                          padding: const EdgeInsets.all(12.5),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            color: _palette.greyColor,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.account_balance_wallet_outlined,
                                color: _palette.kNToDark,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  widget.user.address.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  print("COPY TO CLIPBOARD");
                                  FlutterClipboard.copy("accountId!").then(
                                    (value) => Fluttertoast.showToast(
                                      msg: "Public address copied to clipboard",
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.copy_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        DottedBorder(
                          padding: const EdgeInsets.all(0),
                          color: Colors.white.withOpacity(.5),
                          dashPattern: const [
                            7,
                          ],
                          child: SizedBox(
                            width: drwConstraint.maxWidth,
                            height: 0,
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        const Text(
                          "Your Tokens",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(
                            width: drwConstraint.maxWidth,
                            // height: 130,
                            child: Stack(
                              children: [
                                ShaderMask(
                                  shaderCallback: (bounds) => _palette
                                      .buttonGradient
                                      .createShader(bounds),
                                  child: Container(
                                    width: drwConstraint.maxWidth,
                                    height: 130,
                                    color: _palette.kNToDark.lighten(.2),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: -10,
                                          right: -10,
                                          child: Image.asset(
                                            "assets/images/logo.png",
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Container(
                                    padding: const EdgeInsets.all(25),
                                    child: ListTile(
                                      contentPadding: const EdgeInsets.all(0),
                                      title: RichText(
                                        text: const TextSpan(
                                          text: "Owned",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: " asdasa",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      // subtitle: StreamBuilder<double>(
                                      //   stream: _myKHPRNBalance.stream$,
                                      //   builder: (_, snapshot) {
                                      //     return RichText(
                                      //       text: TextSpan(
                                      //         text:
                                      //             "${snapshot.hasData && !snapshot.hasError ? snapshot.data : "---"}",
                                      //         style: const TextStyle(
                                      //           color: Colors.white,
                                      //           fontWeight: FontWeight.w700,
                                      //           fontSize: 22,
                                      //         ),
                                      //         children: [
                                      //           TextSpan(
                                      //             text: " $tokenSymbol",
                                      //           )
                                      //         ],
                                      //       ),
                                      //     );
                                      //   },
                                      //   // builder: (_, snapshot) => Text(
                                      //   //   "${snapshot.hasData && !snapshot.hasError ? snapshot.data : "---ja ksldf klajsdfhk lasjfhaskdljfhsfjs"} KHPRN",
                                      //   //   maxLines: 2,
                                      //   //   overflow: TextOverflow.ellipsis,
                                      //   // style: const TextStyle(
                                      //   //   color: Colors.white,
                                      //   //   fontWeight: FontWeight.w700,
                                      //   //   fontSize: 22,
                                      //   // ),
                                      //   // ),
                                      // ),
                                      // subtitle: const Text(
                                      //   "82,158.953 KHPRN",
                                      // style: TextStyle(
                                      //   color: Colors.white,
                                      //   fontWeight: FontWeight.w700,
                                      //   fontSize: 22,
                                      // ),
                                      // ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        // DrawerOtherTokens(
                        //   onViewAllTokens: (bool value) async {
                        //     if (value) {
                        //       //                         previousPage: previousPage,
                        //       // onReturn: (int index) async {
                        //       //   setState(() {
                        //       //     previousPage = currentPage;
                        //       //     currentPage = index;
                        //       //   });
                        //       // await _pageController.animateToPage(
                        //       //   index,
                        //       //   duration: const Duration(
                        //       //     milliseconds: 500,
                        //       //   ),
                        //       //   curve: Curves.decelerate,
                        //       // );
                        //       // },
                        //       Navigator.of(context).pop(null);
                        //       setState(() {
                        //         toAdd = TokensAndStakes(
                        //           previousPage: previousPage,
                        //           onReturn: () async {
                        //             setState(() {
                        //               previousPage = currentPage;
                        //               currentPage = 0;
                        //             });
                        //             await _pageController.animateToPage(
                        //               0,
                        //               duration: const Duration(
                        //                 milliseconds: 500,
                        //               ),
                        //               curve: Curves.decelerate,
                        //             );
                        //           },
                        //         );
                        //       });
                        //       await _pageController.animateToPage(
                        //         1,
                        //         duration: const Duration(
                        //           milliseconds: 500,
                        //         ),
                        //         curve: Curves.decelerate,
                        //       );
                        //     }
                        //   },
                        // ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(null);
                        // Navigator.pushReplacementNamed(
                        //   context,
                        //   "/start_screen",
                        // );
                        // _myKHPRNBalance.populate(0.0);
                        // _service.disconnect();
                        // cacher!.removeToken();
                        setState(() {});
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/logout.png",
                            color: Colors.red,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text(
                            "Disconnect Wallet",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
      appBar: AppBar(
        elevation: 0,
        actions: [
          SizedBox(
            width: 50,
            height: 50,
            child: IconButton(
              onPressed: () {},
              icon: Center(
                child: Badge(
                  toAnimate: true,
                  badgeContent: const Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                  child: const Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
        leading: IconButton(
          onPressed: () {
            if (_kScaffold.currentState!.hasDrawer) {
              _kScaffold.currentState!.openDrawer();
            }
          },
          icon: Image.asset(
            "assets/icons/menu_icon.png",
            color: Colors.white,
            width: 22,
            height: 22,
          ),
        ),
        title: GestureDetector(
          onTap: () async {
            _handler.reset();
            // setState(() {
            //   previousPage = 0;
            // });
            // await _pageController.animateToPage(
            //   0,
            // duration: const Duration(
            //   milliseconds: 500,
            // ),
            // curve: Curves.decelerate,
            // );
          },
          child: Hero(
            tag: "logo",
            child: Image.asset(
              "assets/images/logo-small.png",
            ),
          ),
        ),
      ),
      body: StreamBuilder<int>(
        stream: _handler.stream,
        builder: (_, snapshot) {
          if (!snapshot.hasData || snapshot.hasError) {
            return Container();
          }
          // final int currentIndex = snapshot.data!;
          return LayoutBuilder(
            builder: (_, constraint) => SizedBox(
              width: constraint.maxWidth,
              height: constraint.maxHeight,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _handler.pageController,
                children: [
                  WelcomeScreen(
                    launchpads: upcomingLaunchpads,
                  ),
                  _handler.secondPage,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
