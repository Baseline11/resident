import 'package:flutter/material.dart';
import 'package:flutter_resident/ui/pages/signup/components/register_slider.dart';
import 'package:provider/provider.dart';

import '../../../helpers/helpers.dart';
import '../../../mixins/mixins.dart';
import '../../../components/components.dart';

import './components/components.dart';
import '../signup.dart';

class IosSignUpPage extends StatefulWidget implements SignUpPage {
  final SignUpPresenter presenter;

  IosSignUpPage(this.presenter);

  @override
  State<IosSignUpPage> createState() => _IosSignUpPageState();
}

class _IosSignUpPageState extends State<IosSignUpPage>
    with KeyboardManager, LoadingManager, UIErrorManager, NavigationManager {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      handleLoading(
        context: context,
        stream: widget.presenter.isLoadingStream,
      );
      handleMainError(
        context: context,
        stream: widget.presenter.mainErrorStream,
      );
      handleNavigation(
        stream: widget.presenter.navigateToStream,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final totalWidth = mediaQuery.size.width;
    final totalHeight = mediaQuery.size.height -
        mediaQuery.padding.top -
        mediaQuery.padding.bottom;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => hideKeyboard(context),
          child: SingleChildScrollView(
            child: ListenableProvider(
              create: (_) => widget.presenter,
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: RegisterSlider(),
                    ),
                    Headline1(
                      text: R.strings.signUp.page1Title,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: UsernameInput(),
                    ),
                    FirstNameInput(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: LastNameInput(),
                    ),
                    EmailInput(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 32),
                      child: SignUpButton(
                        buttonWidth: totalWidth,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
