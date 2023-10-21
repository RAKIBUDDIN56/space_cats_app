import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:space_cats_app/config/config.dart';
import 'package:space_cats_app/providers/providers.dart';
import 'package:space_cats_app/providers/user/user.dart';
import 'package:space_cats_app/utils/utils.dart';
import 'package:space_cats_app/widgets/widgets.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userProvider);
    var isDarkMode = ref.watch(appThemeProvider);

    return Scaffold(
      appBar: AppBar(),
      drawer: DrawerWidget(isDarkMode: isDarkMode),
      body: Body(userState: userState, isDarkMode: isDarkMode),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
    required this.userState,
    required this.isDarkMode,
  });

  final HomeState userState;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(15),
        height: deviceSize.height * .6,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: userState.status == HomeStateStatus.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    const Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          size: 56,
                        ),
                      ),
                    ),
                    DisplayWhiteText(
                      text: AppLocalizations.of(context).fullName,
                    ),
                    ContentWidget(
                      title: userState.user!.name,
                      isDark: isDarkMode,
                    ),
                    const Gap(15),
                    DisplayWhiteText(
                      text: AppLocalizations.of(context).email,
                    ),
                    ContentWidget(
                      title: userState.user!.email,
                      isDark: isDarkMode,
                    ),
                    const Gap(15),
                    DisplayWhiteText(
                        text: AppLocalizations.of(context).phoneNumber),
                    ContentWidget(
                      title: userState.user!.phoneNumber,
                      isDark: isDarkMode,
                    ),
                  ]),
      ),
    );
  }
}

class DrawerWidget extends ConsumerWidget {
  DrawerWidget({
    super.key,
    required this.isDarkMode,
  });

  final bool isDarkMode;
  final List<String> list = <String>[
    'English',
    'বাংলা',
    'عربي',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isDarkMode = ref.watch(appThemeProvider);
    final userState = ref.watch(userProvider);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.grey : Colors.cyan,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                Gap(10),
                Text(
                  userState.user!.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  userState.user!.email,
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
          ),
          ListTileWidget(
            title: AppLocalizations.of(context).changeTheme,
            trailing: Switch(
                activeColor: Colors.orange,
                onChanged: (value) {
                  ref.read(appThemeProvider.notifier).state = value;
                },
                value: isDarkMode),
          ),
          ListTileWidget(
            title: AppLocalizations.of(context).changeLanguge,
            trailing: DropdownButton<String>(
              value: ref.watch(appLanguageListProvider),
              icon: const Icon(Icons.arrow_drop_down_circle),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 0,
              ),
              onChanged: (String? value) {
                ref.read(appLanguageListProvider.notifier).state = value!;
                switch (value) {
                  case "English":
                    ref.read(appLanguageProvider.notifier).state = 'en';
                  case "বাংলা":
                    ref.read(appLanguageProvider.notifier).state = 'bn';
                  case "عربي":
                    ref.read(appLanguageProvider.notifier).state = 'ar';
                }
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,
                      style: Theme.of(context).textTheme.titleLarge),
                );
              }).toList(),
            ),
          ),
          ListTileWidget(
            title: AppLocalizations.of(context).logout,
            trailing: IconButton(
              onPressed: () {
                ref.read(userProvider.notifier).signout();
                ref.read(appThemeProvider.notifier).state = false;
              
                context.go(
                  RouteLocation.signUp,
                );
              },
              icon: const Icon(
                Icons.logout,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  final String title;
  final Widget trailing;

  const ListTileWidget(
      {super.key, required this.title, required this.trailing});
  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(title), trailing: trailing);
  }
}

class ContentWidget extends StatelessWidget {
  final String title;
  final bool isDark;

  const ContentWidget({super.key, required this.title, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    return Container(
        width: deviceSize.width * .9,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isDark ? Colors.black : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(
                0,
                2,
              ),
            ),
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(32),
          ),
        ),
        child: Text(title, style: Theme.of(context).textTheme.titleLarge));
  }
}
