import 'package:cherry_toast/cherry_toast.dart';
import 'package:eazy_pay/app/pages/nav_bar.dart';
import 'package:eazy_pay/app/services/domain/banking_response.dart';
import 'package:eazy_pay/app/widgets/loader.dart';
import 'package:eazy_pay/core/system/navigation.dart';
import 'package:flutter/material.dart';

import '../../core/style/color_constants.dart';
import '../services/auth/auth.dart';
import '../widgets/button.dart';
import '../widgets/textfield.dart';

class InputPin extends StatefulWidget {
  const InputPin({Key? key}) : super(key: key);

  @override
  State<InputPin> createState() => _SetPinState();
}

class _SetPinState extends State<InputPin> {
  String pin = '';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => FocusScope.of(context).unfocus()),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.only(
            top: 40,
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              // welcome user text
              Row(
                children: [
                  Text(
                    'Welcome back,\nNifesi',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: primaryDarkBlue,
                    ),
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/images/logo.png',
                    width: 105,
                    height: 75,
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Text(
                'Please enter your pin to login.',
                style: TextStyle(
                  height: 1.5,
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                  color: primaryTextGrey,
                ),
              ),

              const SizedBox(height: 40),

              CustomInputOtpField(
                onChanged: (v) {
                  pin = v;
                },
              ),

              const Spacer(),

              // custom button
              CustomButton(
                buttonTextColor: primaryWhite,
                text: 'Login',
                onPressed: () => _login(),
                buttonWidth: double.maxFinite,
                validator: () {
                  return pin != '';
                },
              ),

              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _login() {
    showLoader(context);
    BankingResponse validatePin = Auth().validatePin(pin: pin);
    pop(context);
    if (validatePin.status) {
      Future.delayed(const Duration(seconds: 2), () {
        pushToAndClearStack(context, const NavBar());
      });
    } else {
      CherryToast.error(
        autoDismiss: true,
        title: Text(validatePin.message!),
      ).show(context);
    }
  }
}
