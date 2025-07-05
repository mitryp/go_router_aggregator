import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_aggregator_example/pages/shell/shell_page.dart';

part 'home_page.g.dart';

@TypedGoRoute<HomePageRoute>(path: '/home')
class HomePageRoute extends GoRouteData with _$HomePageRoute {
  const HomePageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              OutlinedButton(
                onPressed: () => const ShellPage1Route().push(context),
                child: Text('Shell route 1'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
