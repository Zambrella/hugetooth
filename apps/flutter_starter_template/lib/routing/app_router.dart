import 'package:flutter/material.dart';
import 'package:flutter_starter_template/authentication/presentation/pages/login_page.dart';
import 'package:flutter_starter_template/authentication/providers/authentication_repository_provider.dart';
import 'package:flutter_starter_template/routing/go_router_refresh_stream.dart';
import 'package:flutter_starter_template/routing/not_found_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _jobsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'jobs');
final _entriesNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'entries');
final _accountNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'account');

enum AppRoute {
  onboarding,
  login,
  register,
  home,
}

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  // rebuild GoRouter when app startup state changes
  final authRepository = ref.watch(authenticationRepositoryProvider);
  return GoRouter(
    initialLocation: '/login',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    refreshListenable: GoRouterRefreshStream(authRepository.getUser()),
    redirect: (context, state) {
      // final onboardingRepository = ref.read(onboardingRepositoryProvider).requireValue;
      // final didCompleteOnboarding = onboardingRepository.isOnboardingComplete();
      // final path = state.uri.path;
      // if (!didCompleteOnboarding) {
      //   // Always check state.subloc before returning a non-null route
      //   // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/redirection.dart#L78
      //   if (path != '/onboarding') {
      //     return '/onboarding';
      //   }
      //   return null;
      // }
      // final isLoggedIn = authRepository.currentUser != null;
      // if (isLoggedIn) {
      //   if (path.startsWith('/startup') || path.startsWith('/onboarding') || path.startsWith('/signIn')) {
      //     return '/jobs';
      //   }
      // } else {
      //   if (path.startsWith('/startup') ||
      //       path.startsWith('/onboarding') ||
      //       path.startsWith('/jobs') ||
      //       path.startsWith('/entries') ||
      //       path.startsWith('/account')) {
      //     return '/signIn';
      //   }
      // }
      return null;
    },
    routes: [
      // GoRoute(
      //   path: '/onboarding',
      //   name: AppRoute.onboarding.name,
      //   pageBuilder: (context, state) => const NoTransitionPage(
      //     child: OnboardingScreen(),
      //   ),
      // ),
      GoRoute(
        path: '/login',
        name: AppRoute.login.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: LoginPage(),
        ),
      ),
    ],
    errorPageBuilder: (context, state) => const NoTransitionPage(
      child: NotFoundScreen(),
    ),
  );
}
