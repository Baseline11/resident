import 'package:flutter/material.dart';

import 'base_widget.dart';

class PrimaryActionButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Icon? trailingIcon;

  const PrimaryActionButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.trailingIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      widget: GestureDetector(
        onTap: () => onPressed(),
        behavior: HitTestBehavior.translucent,
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                //Todo: Changed based on theme
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        text,
                        style:
                            const TextStyle(color: Colors.blue, fontSize: 17),
                      ),
                      if (trailingIcon != null) trailingIcon!
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
