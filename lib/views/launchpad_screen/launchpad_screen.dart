import 'package:flutter/material.dart';
import 'package:kprn/data_listeners_and_handlers/launchpad_page_handler.dart';
import 'package:kprn/views/launchpad_screen/first_page/launchpad_first_page.dart';
import 'package:kprn/views/stakeholder_screen/first_page/stakeholder_first_page.dart';

class LaunchpadScreen extends StatelessWidget {
  const LaunchpadScreen({Key? key}) : super(key: key);
  static final LaunchpadPageHandler _handler = LaunchpadPageHandler();
  @override
  Widget build(BuildContext context) {
    final Color base = AppBarTheme.of(context).backgroundColor!;
    return LayoutBuilder(builder: (context, constraint) {
      final double width = constraint.maxWidth;
      return Scaffold(
        backgroundColor: base,
        body: StreamBuilder<int>(
          stream: _handler.stream,
          builder: (_, snapshot) {
            if (snapshot.hasError || !snapshot.hasData) {
              return Container();
            }
            return PageView(
              controller: _handler.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                LaunchpadFirstPage(
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
      );
    });
  }
}
