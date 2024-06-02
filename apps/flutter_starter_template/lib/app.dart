import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter_template/flavors.dart';
import 'package:flutter_starter_template/routing/app_router.dart';
import 'package:flutter_starter_template/routing/bootstrap.dart';
import 'package:flutter_starter_template/theme/dark_theme.dart';
import 'package:flutter_starter_template/theme/light_theme.dart';
import 'package:flutter_starter_template/theme/selected_theme.dart';

class App extends ConsumerStatefulWidget {
  const App({required this.appFlavor, super.key});

  final Flavor appFlavor;

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(flavorNotifierProvider.notifier).setFlavor(widget.appFlavor);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appStartupState = ref.watch(appStartupProvider(widget.appFlavor));
    final goRouter = ref.watch(goRouterProvider(widget.appFlavor));

    return MaterialApp.router(
      routerConfig: goRouter,
      theme: lightTheme,
      darkTheme: darkTheme,
      // Currently, the downside of using the `selectedThemeProvider` is that
      // the loading (and error) screens will have the system theme, and not the
      // theme that was selected by the user.
      // To fix this I could wrap the 3 different state screens in their own
      // MaterialApp but that seems overkill.
      // Alternatively, I could fetch the theme mode from shared preferences
      // and pass it into the MaterialApp here but this defeats the purpose of
      // the appStatupProvider.
      themeMode: ref.watch(selectedThemeProvider).maybeWhen(
            orElse: () => ThemeMode.system,
            data: (themeMode) => themeMode,
          ),
      builder: (context, child) {
        return appStartupState.when(
          skipLoadingOnRefresh: false,
          data: (_) => child!,
          loading: () => const AppStartupLoadingWidget(),
          error: (e, st) => AppStartupErrorWidget(
            message: e.toString(),
            onRetry: () => ref.invalidate(appStartupProvider(widget.appFlavor)),
          ),
        );
      },
    );
  }
}

class AppStartupLoadingWidget extends StatelessWidget {
  const AppStartupLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class AppStartupErrorWidget extends StatelessWidget {
  const AppStartupErrorWidget({
    required this.message,
    required this.onRetry,
    super.key,
  });
  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Unexpected error!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            ElevatedButton(
              onPressed: onRetry,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
