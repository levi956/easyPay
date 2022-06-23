import 'package:cherry_toast/cherry_toast.dart';
import 'package:eazy_pay/app/services/domain/banking_response.dart';
import 'package:eazy_pay/app/services/transactions/transactions.dart';
import 'package:eazy_pay/core/system/navigation.dart';
import 'package:flutter/material.dart';

import '../../core/style/color_constants.dart';
import '../services/auth/auth.dart';
import '../services/domain/user.dart';
import '../widgets/button.dart';
import '../widgets/textfield.dart';

class Fund extends StatefulWidget {
  final User? user;
  final Function()? notifyParent;
  const Fund({Key? key, this.user, this.notifyParent}) : super(key: key);

  @override
  State<Fund> createState() => _FundState();
}

class _FundState extends State<Fund> {
  TextEditingController amount = TextEditingController();
  String source = '';
  String transferPin = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 25, top: 45),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () {
                    pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  )),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Fund Wallet',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Please enter the amount you want to fund wallet',
                style: TextStyle(
                  color: primaryDarkBlue,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                isHidden: false,
                label: 'Amount',
                textEditingController: amount,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                isHidden: false,
                label: 'Funding Source',
                onChanged: (v) {
                  setState(() {
                    source = v.trim();
                  });
                },
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                isHidden: true,
                label: 'Eazy pay pin',
                onChanged: (v) {
                  setState(() {
                    transferPin = v.trim();
                  });
                },
                keyboardType: TextInputType.number,
              ),
              const Spacer(),
              Center(
                child: CustomButton(
                  text: 'PROCEED',
                  onPressed: () {
                    BankingResponse verify =
                        Auth().validatePin(pin: transferPin);
                    if (verify.status) {
                      _fundWallet();
                    } else if (transferPin == '') {
                      CherryToast.error(
                        autoDismiss: true,
                        title: const Text('Please enter your pin!'),
                      ).show(context);
                    } else {
                      CherryToast.error(
                        autoDismiss: true,
                        title: const Text('Invalid Pin'),
                      ).show(context);
                    }
                  },
                  buttonWidth: double.maxFinite,
                  validator: () {
                    return source != '' && amount.text != '';
                  },
                  buttonTextColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _fundWallet() {
    BankingResponse init = BankingTransactions().fundWallet(
      amount: int.parse(amount.text),
      balance: widget.user!.accountBalance,
    );
    if (init.status) {
      // return success dialog
      CherryToast.success(
        title: Text(init.message!),
      ).show(context);
      setState(() {
        widget.user!.accountBalance = init.data;
      });
      widget.notifyParent!();
    }
  }
}
