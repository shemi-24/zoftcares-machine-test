
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoftcare_machine_test/presentation/screens/posts/screens/posts_listing_screen.dart';

import '../common_widgets/default_page_transition.dart';
import '../screens/authentication/getx/auth_controller.dart';
import 'login_screen_wrapper.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    return AnimatedBuilder(
        animation: authController,
        builder: (context, child) {
          return DefaultPageTransition(
            child: authController.userEntity == null
                ? const LoginViewWrapper()
                : const PostsListingScreen(),
          );
        });
  }
}
