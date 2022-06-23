import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../core/style/color_constants.dart';

class CustomInputPinField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  const CustomInputPinField({this.onChanged, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      cursorColor: Colors.transparent,
      keyboardType: TextInputType.number,
      appContext: context,
      length: 5,
      obscureText: true,
      animationType: AnimationType.none,
      pinTheme: PinTheme(
        activeColor: primaryOrange,
        selectedFillColor: Colors.transparent,
        selectedColor: primaryOrange,
        inactiveColor: greyWhitish,
        inactiveFillColor: greyWhitish,
        fieldHeight: 56,
        fieldWidth: 56,
        activeFillColor: Colors.white,
      ),
      enableActiveFill: true,
      onChanged: onChanged!,
    );
  }
}

class CustomInputOtpField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  const CustomInputOtpField({this.onChanged, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      cursorColor: Colors.transparent,
      keyboardType: TextInputType.number,
      appContext: context,
      length: 5,
      obscureText: true,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        activeColor: Colors.transparent,
        selectedFillColor: Colors.transparent,
        selectedColor: greyWhitish,
        inactiveColor: greyWhitish,
        inactiveFillColor: greyWhitish,
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(15),
        fieldHeight: 56,
        fieldWidth: 56,
        activeFillColor: Colors.white,
      ),
      enableActiveFill: true,
      onChanged: onChanged!,
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final TextInputType? keyboardType;
  final TextEditingController? textEditingController;
  final ValueChanged<String>? onChanged;

  const CustomTextField(
      {Key? key,
      required this.label,
      this.keyboardType,
      this.textEditingController,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(
          height: 8,
        ),
        Container(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
          decoration: BoxDecoration(
            color: grey2,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  cursorColor: primaryDarkBlue,
                  keyboardType: keyboardType,
                  controller: textEditingController,
                  onChanged: onChanged,
                  decoration: const InputDecoration.collapsed(hintText: ''),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
