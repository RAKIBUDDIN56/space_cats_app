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

class SignupScreen extends ConsumerStatefulWidget {
  static SignupScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const SignupScreen();
  const SignupScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateTaskScreenState();
}

class _CreateTaskScreenState extends ConsumerState<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary,
        centerTitle: true,
        title: const DisplayWhiteText(
          text: 'Sign Up',
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
                hintText: 'Full Name',
                title: 'Full Name',
                controller: _nameController,
              ),
              const Gap(30),
              CommonTextField(
                hintText: 'Phone Number',
                title: 'Phone Number',
                maxLines: 1,
                maxLength: 11,
                keyboardType: TextInputType.number,
                controller: _phoneNumberController,
              ),
              const Gap(30),
              CommonTextField(
                hintText: 'Email',
                title: 'Email',
                maxLines: 1,
                controller: _emailController,
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
                onPressed: _signup,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: DisplayWhiteText(
                    text: 'Sign Up',
                  ),
                ),
              ),
              const Gap(30),
              TextButton(
                  onPressed: () {
                    context.push(RouteLocation.signIn);
                  },
                  child: const Text(
                    "Sign In ?",
                    style: TextStyle(),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void _signup() async {
    final name = _nameController.text.trim();
    final phoneNumber = _phoneNumberController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (name.isNotEmpty ||
        phoneNumber.isNotEmpty ||
        email.isNotEmpty ||
        password.isNotEmpty) {
      final task = User(
        name: name,
        phoneNumber: phoneNumber,
        email: email,
        password: password,
      );

      await ref.read(usersProvider.notifier).createUser(task).then((value) {
        AppAlerts.displaySnackbar(context, 'Sign Up Successful');

        context.go(RouteLocation.home, extra: {"user_id:": value});
      }, onError: (error) {
        print(error);
      });
    } else {
      AppAlerts.displaySnackbar(context, 'Fill all fields');
    }
  }
}
