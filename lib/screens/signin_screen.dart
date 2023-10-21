import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:space_cats_app/data/models/user.dart';
import 'package:space_cats_app/providers/user/user.dart';
import 'package:space_cats_app/utils/utils.dart';
import 'package:space_cats_app/widgets/widgets.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../config/routes/routes_location.dart';
import '../widgets/common_text_field.dart';

class SigninScreen extends ConsumerStatefulWidget {
  static SigninScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const SigninScreen();
  const SigninScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateTaskScreenState();
}

class _CreateTaskScreenState extends ConsumerState<SigninScreen> {
  final TextEditingController _phoneNumerController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _phoneNumerController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary,
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        centerTitle: true,
        title: const DisplayWhiteText(
          text: 'Sign In',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CommonTextField(
                hintText: 'Phone Number',
                title: 'Phone Number',
                maxLines: 1,
                maxLength: 11,
                controller: _phoneNumerController,
              ),
              const Gap(30),
              CommonTextField(
                hintText: 'Password',
                title: 'Password',
                maxLines: 1,
                obscureText: true,
                controller: _passwordController,
              ),
              const Gap(30),
              ElevatedButton(
                onPressed: _signin,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: DisplayWhiteText(
                    text: 'Sign In',
                  ),
                ),
              ),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }

  void _signin() async {
    final phoneNumber = _phoneNumerController.text.trim();
    final password = _passwordController.text.trim();

    if (phoneNumber.isNotEmpty || password.isNotEmpty) {
      final user = User(
        name: "",
        phoneNumber: phoneNumber,
        email: "",
        password: password,
      );

      await ref.read(usersProvider.notifier).signin(user).then((value) {
        print(value);
        if (value.isEmpty) {
          AppAlerts.displaySnackbar(
              context, 'Phone number or password is wrong');
        } else {
          AppAlerts.displaySnackbar(context, 'Sign In Successful');
          context.go(RouteLocation.home);
        }
      }, onError: (error) {
        print(error);
      });
    } else {
      AppAlerts.displaySnackbar(context, 'Fill all fields');
    }
  }
}
