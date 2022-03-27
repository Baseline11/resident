import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import './../../components/theme/theme.dart';
import './../../helpers/helpers.dart';
import './../../mixins/mixins.dart';

import './../../components/assets/assets.dart';
import './splash.dart';

class IosSplashPage extends StatefulWidget implements SplashPage {
  final SplashPresenter presenter;

  IosSplashPage({required this.presenter});

  @override
  State<IosSplashPage> createState() => _IosSplashPageState();
}

class _IosSplashPageState extends State<IosSplashPage> with NavigationManager {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      handleNavigation(stream: widget.presenter.navigateToStream);

      widget.presenter.checkAccount();
      Locale myLocale = Localizations.localeOf(context);
      R.load(myLocale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.colorLightTintsBlue,
      body: Center(
        child: SvgPicture.asset(
          SplashAssets.brandLogoSvg,
        ),
      ),
    );
  }
}
