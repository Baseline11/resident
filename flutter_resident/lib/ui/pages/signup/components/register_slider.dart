import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_resident/ui/pages/signup/components/components.dart';

class RegisterSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double totalHeight = MediaQuery.of(context).size.height;
    final double cardHeight = totalHeight * 0.38;

    return CarouselSlider(
      options: CarouselOptions(
        height: cardHeight,
        enlargeCenterPage: true,
        viewportFraction: 0.75,
      ),
      items: [
        ItemRegisterSlider(
          height: cardHeight,
        ),
      ],
    );
  }
}
