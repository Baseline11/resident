import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_resident/ui/components/components.dart';
import 'package:flutter_resident/ui/helpers/helpers.dart';

class ItemRegisterSlider extends StatelessWidget {
  final double height;

  ItemRegisterSlider({
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            RegisterAssets.sliderBackground1Png,
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.only(
          top: height * 0.2,
          right: height * 0.05,
          left: height * 0.05,
          bottom: height * 0.1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(
                  right: height * 0.07,
                ),
                child: AutoSizeText.rich(
                  TextSpan(
                    children: R.strings.signUp.sliderCard1Body(context),
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            AutoSizeText(
              R.strings.signUp.sliderCard1Bottom,
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 2.5,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
