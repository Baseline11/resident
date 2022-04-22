import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/widgets/module_widget.dart';

class RootModule extends StatelessWidget {
  static Future<ProviderContainer> initRootModule() async {
    final container = ProviderContainer();
    return container;
  }

  final WidgetBuilder builder;
  final ProviderContainer providerContainer;

  const RootModule(
      {Key? key, required this.builder, required this.providerContainer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModuleWidget(
      configure: () => providerContainer,
      builder: builder,
    );
  }
}
