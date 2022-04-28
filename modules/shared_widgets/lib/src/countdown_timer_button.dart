import "package:flutter/material.dart";
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:shared_widgets/shared_widgets.dart';
import 'package:shared_widgets/src/base_widget.dart';

class CountdownTimerButton extends StatefulWidget {
  final String text;
  final int seconds;
  final Function onPressed;

  const CountdownTimerButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.seconds,
  }) : super(key: key);

  @override
  State<CountdownTimerButton> createState() => _CountdownTimerButtonState();
}

class _CountdownTimerButtonState extends State<CountdownTimerButton> {
  var isDisabled = true;
  final timerStyle = const TextStyle(color: Color(0xFFE9E9EB), fontSize: 17);

  @override
  Widget build(BuildContext context) {
    return BaseWidget(widget: isDisabled ? _disabledState : _enabledState);
  }

  Widget get _disabledState {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white, width: 2.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.text,
            style: const TextStyle(fontSize: 17, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: CountdownTimer(
              endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 30,
              widgetBuilder: (_, time) {
                if (time == null) {
                  return Text(
                    '0:00',
                    style: timerStyle,
                  );
                }
                return Text(
                  "${time.hours ?? "0"}:${time.sec}",
                  style: timerStyle,
                );
              },
              onEnd: () {
                setState(() {
                  isDisabled = false;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  Widget get _enabledState {
    return PrimaryActionButton(
        onPressed: () {
          setState(() {
            isDisabled = true;
          });
          widget.onPressed();
        },
        text: "Resend PIN");
  }
}
