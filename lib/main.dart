import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:popa_v1/view/initial_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      routes: {
        // '/login_page': (context) => const LoginPage(
        //       accountType: AccountType.general,
        //     ),
        '/initial': (context) => const InitialPage(),
      },
      debugShowCheckedModeBanner: false,
      home: Surveillance(
        onForeground: () async {},
        onBackground: () async {},
      ),
    );
  }
}

class Surveillance extends StatefulWidget {
  final VoidCallback onForeground;
  final VoidCallback onBackground;
  const Surveillance({
    super.key,
    required this.onForeground,
    required this.onBackground,
  });
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Surveillance> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      widget.onForeground();
    } else if (state == AppLifecycleState.paused) {
      widget.onBackground();
    }
  }

  @override
  Widget build(BuildContext context) {
    return const InitialPage();
  }
}
