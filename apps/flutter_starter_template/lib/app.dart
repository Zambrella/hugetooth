import 'package:auth_core/auth_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter_template/app_dependencies.dart';
import 'package:flutter_starter_template/authentication/providers/authentication_providers.dart';
import 'package:flutter_starter_template/repository_providers.dart';
import 'package:flutter_starter_template/routing/app_router.dart';
import 'package:flutter_starter_template/theme/dark_theme.dart';
import 'package:flutter_starter_template/theme/light_theme.dart';
import 'package:flutter_starter_template/theme/selected_theme.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref
      ..listen<AsyncValue<void>>(
        serviceInitialisationProvider,
        (_, state) {
          if (state.hasValue || state.hasError) {
            FlutterNativeSplash.remove();
          }
        },
      )
      ..listen<AsyncValue<AppUser?>>(authStateChangesProvider, (prev, state) async {
        if (state.asData != null && state.asData!.value == null) {
          // TODO: Move this into a FutureProvider
          final userId = state.asData!.value!.id;
          await ref.read(purchasesRepositoryProvider).setUserId(userId);
          // TODO: Add other repositories
        }
      });

    final initDependencies = ref.watch(serviceInitialisationProvider);
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: goRouter,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ref.watch(selectedThemeProvider).maybeWhen(
            orElse: () => ThemeMode.system,
            data: (themeMode) => themeMode,
          ),
      builder: (context, child) {
        // Wrap with InheritedWidgets here if needed. E.g. One that overrides the text scale factor
        return initDependencies.when(
          skipLoadingOnRefresh: false,
          data: (_) => child!,
          // Loading screen is handled by the native splash screen on the first load.
          // If there's an error and the user refreshes, the loading screen will be shown
          loading: () => const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          error: (_, __) {
            // Logging the error is handled by the provider observer.
            return const AppStartupErrorWidget();
          },
        );
      },
    );
  }
}

class AppStartupErrorWidget extends ConsumerWidget {
  const AppStartupErrorWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Unexpected error!\nPlease restart the app.',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                ref.invalidate(appDependenciesProvider);
              },
              child: const Text('Restart'),
            ),
          ],
        ),
      ),
    );
  }
}
