import 'package:flutter/material.dart';
import 'package:kprn/models/user_model.dart';
import 'package:kprn/view_models/logged_user_vm.dart';
import 'package:kprn/views/landing_page/landing_page.dart';
import 'package:kprn/views/start_screen/start_screen.dart';

class DecisionScreen extends StatelessWidget {
  const DecisionScreen({Key? key}) : super(key: key);
  static final LoggedUserVm _vm = LoggedUserVm.instance;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserModel?>(
      stream: _vm.stream,
      builder: (_, snapshot) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (child, Animation<double> anim) {
            return FadeTransition(
              opacity: anim,
              child: ScaleTransition(
                scale: anim,
                child: child,
              ),
            );
          },
          child: !snapshot.hasData || snapshot.hasError
              ? const StartScreenPage()
              : LandingPage(
                  user: snapshot.data!,
                ),
        );
      },
    );
  }
}
