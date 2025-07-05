// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shell_page.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$shellPageRoute];

RouteBase get $shellPageRoute => ShellRouteData.$route(
  factory: $ShellPageRouteExtension._fromState,
  routes: [
    GoRouteData.$route(path: '/shell/1', factory: _$ShellPage1Route._fromState),
    GoRouteData.$route(path: '/shell/2', factory: _$ShellPage2Route._fromState),
  ],
);

extension $ShellPageRouteExtension on ShellPageRoute {
  static ShellPageRoute _fromState(GoRouterState state) =>
      const ShellPageRoute();
}

mixin _$ShellPage1Route on GoRouteData {
  static ShellPage1Route _fromState(GoRouterState state) =>
      const ShellPage1Route();

  @override
  String get location => GoRouteData.$location('/shell/1');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$ShellPage2Route on GoRouteData {
  static ShellPage2Route _fromState(GoRouterState state) =>
      const ShellPage2Route();

  @override
  String get location => GoRouteData.$location('/shell/2');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
