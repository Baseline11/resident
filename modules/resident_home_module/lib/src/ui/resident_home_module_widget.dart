import 'package:flutter/material.dart';
import 'package:resident_home_module/riverflow/config/config.dart';
import 'package:riverflow/widgets/module_widget.dart';

class ResidentHomeModule extends StatelessWidget {
  const ResidentHomeModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModuleWidget(
      configure: configureResidentHomeModule,
      builder: (BuildContext context) {
        return Scaffold(
          body: Column(
            children: const [
              Text("Home module"),
            ],
          ),
        );
      },
    );
  }
}
