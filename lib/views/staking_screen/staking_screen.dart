import 'package:flutter/material.dart';
import 'package:kprn/data_listeners_and_handlers/staking_page_handler.dart';
import 'package:kprn/views/staking_screen/first_page/staking_choice_screen.dart';

class StakingScreen extends StatelessWidget {
  const StakingScreen({Key? key}) : super(key: key);
  static final StakingPageHandler _handler = StakingPageHandler();
  @override
  Widget build(BuildContext context) {
    final Color base = AppBarTheme.of(context).backgroundColor!;
    return LayoutBuilder(
      builder: (_, constraint) => Scaffold(
        backgroundColor: base,
        body: StreamBuilder(
          stream: _handler.stream,
          builder: (_, snapshot) {
            if (snapshot.hasError || !snapshot.hasData) {
              return Container();
            }
            return PageView(
              controller: _handler.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                StakingChoiceScreen(
                  onBackPressed: () {
                    _handler.back();
                  },
                  handler: _handler,
                ),
                _handler.secondPage,
              ],
            );
          },
        ),
      ),
    );
  }
}
