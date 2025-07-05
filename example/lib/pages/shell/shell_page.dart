import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'shell_page.g.dart';

@TypedShellRoute<ShellPageRoute>(
  routes: [
    TypedGoRoute<ShellPage1Route>(path: '/shell/1'),
    TypedGoRoute<ShellPage2Route>(path: '/shell/2'),
  ],
)
class ShellPageRoute extends ShellRouteData {
  const ShellPageRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) =>
      ShellPageBuilder(child: navigator);
}

class ShellPageBuilder extends StatelessWidget {
  final Widget child;

  const ShellPageBuilder({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: child,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => const ShellPage1Route().pushReplacement(context),
              icon: Text('1'),
            ),
            IconButton(
              onPressed: () => const ShellPage2Route().pushReplacement(context),
              icon: Text('2'),
            ),
          ],
        ),
      ),
    );
  }
}

class ShellPage1Route extends GoRouteData with _$ShellPage1Route {
  const ShellPage1Route();

  @override
  Widget build(BuildContext context, GoRouterState state) => const ShellPage1();
}

class ShellPage1 extends StatelessWidget {
  const ShellPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Shell page 1'));
  }
}

class ShellPage2Route extends GoRouteData with _$ShellPage2Route {
  const ShellPage2Route();

  @override
  Widget build(BuildContext context, GoRouterState state) => const ShellPage2();
}

class ShellPage2 extends StatelessWidget {
  const ShellPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Shell page 2'));
  }
}
