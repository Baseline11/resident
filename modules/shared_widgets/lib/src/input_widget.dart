import 'package:flutter/material.dart';
import 'package:shared_widgets/src/base_widget.dart';

class InputWidget extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final Widget? suffix;
  final dynamic initialValue;
  final FocusNode? focusNode;
  final TextInputType? textInputType;

  const InputWidget(
      {Key? key,
      this.hintText,
      this.controller,
      this.suffix,
      this.onFieldSubmitted,
      this.validator,
      this.focusNode,
      this.initialValue,
      this.textInputType,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Todo: Update with theme
    return BaseWidget(
        widget: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(14)),
      child: TextFormField(
        initialValue: initialValue,
        controller: controller,
        keyboardType: textInputType,
        focusNode: focusNode,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        validator: validator,
        decoration: InputDecoration(
            suffix: suffix,
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey)),
      ),
    ));
  }
}
