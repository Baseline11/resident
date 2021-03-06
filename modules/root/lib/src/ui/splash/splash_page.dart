import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:root/riverflow/bootstrap/signal/bootstrap_signal.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      ref.watch(bootstrapSignalProvider).dispatch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.blue,
        child: const Center(
          child: Text('Splash'),
        ),
      ),
    );
  }
}
