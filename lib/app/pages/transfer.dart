// user transfer money page

import 'package:cherry_toast/cherry_toast.dart';
import 'package:eazy_pay/app/services/transactions/transactions.dart';
import 'package:eazy_pay/app/widgets/loader.dart';
import 'package:eazy_pay/core/system/navigation.dart';
import 'package:flutter/material.dart';

import '../../core/style/color_constants.dart';
import '../services/auth/auth.dart';
import '../services/domain/banking_response.dart';
import '../services/domain/user.dart';
import '../widgets/button.dart';
import '../widgets/textfield.dart';

class Transfer extends StatefulWidget {
  final User? user;
  final Function()? notifyParent;
  const Transfer({Key? key, this.user, this.notifyParent}) : super(key: key);

  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  TextEditingController amount = TextEditingController();
  TextEditingController accounNumber = TextEditingController();
  String bankName = '';
  String note = '';
  String transferPin = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 45),
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
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Transfer',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Please fill in the credentials below:',
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
                  label: 'Bank',
                  onChanged: (v) {
                    setState(() {
                      bankName = v.trim();
                    });
                  },
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  isHidden: false,
                  label: 'Account Number',
                  textEditingController: accounNumber,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  isHidden: false,
                  label: 'Add A Note',
                  onChanged: (v) {
                    setState(() {
                      note = v.trim();
                    });
                  },
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 20,
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
                const SizedBox(
                  height: 130,
                ),
                Center(
                  child: CustomButton(
                    text: 'PROCEED',
                    onPressed: () {
                      BankingResponse verify =
                          Auth().validatePin(pin: transferPin);
                      if (verify.status) {
                        _transfer();
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
                    // onPressed: () => _transfer(),
                    buttonWidth: double.maxFinite,
                    validator: () {
                      return bankName != '' &&
                          amount.text != '' &&
                          accounNumber.text != '';
                    },
                    buttonTextColor: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _transfer() {
    showLoader(context);
    BankingResponse response = BankingTransactions().transfer(
      amount: int.parse(amount.text),
      recipentNumber: int.parse(accounNumber.text),
      balance: widget.user!.accountBalance,
    );
    pop(context);
    if (response.status) {
      // success dialog
      CherryToast.success(
        autoDismiss: true,
        title: Text(response.message!),
      ).show(context);
      setState(() {
        widget.user!.accountBalance = response.data;
      });
    } else {
      // error dialog
      CherryToast.error(
        autoDismiss: true,
        title: Text(response.message!),
      ).show(context);
    }
    widget.notifyParent!();
    // notifyParent here
  }
}
