import 'dart:io';

import 'package:eazy_pay/app/pages/fund.dart';
import 'package:eazy_pay/app/pages/transfer.dart';
import 'package:eazy_pay/app/widgets/virtual_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../core/style/color_constants.dart';
import '../../core/system/navigation.dart';
import '../services/domain/user.dart';
import '../widgets/button.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //initialzie user
  User user = User(name: 'Nifesi', accountBalance: 250000);

  bool _balanceVisible = true;
  String shamBalance = '********';

  final formatCurrency = NumberFormat("#,000", "en_NG");
  String getCurrency() {
    var format =
        NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
    return format.currencySymbol;
  }

  void togglePasswordVisibile() {
    setState(() {
      _balanceVisible = !_balanceVisible;
    });
  }

  // refresh widget that expcets from child widget
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'eazy',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: primaryDarkBlue),
              ),
              const Text(
                'Pay',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 140, 125, 10)),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              //user profile photo
              const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(
                  'assets/images/nifesi.png',
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello ${user.name}',
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  const Text(
                    '0068486162 (Eazy Pay account)',
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),

          //user balance card widget
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: primaryDarkBlue,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 130,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 30, bottom: 10, right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Balance',
                          style: TextStyle(
                            fontSize: 16,
                            color: grey2,
                          ),
                        ),
                        Text(
                          _balanceVisible
                              ? '₦${formatCurrency.format(user.accountBalance)}'
                              : shamBalance,
                          style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        togglePasswordVisibile();
                      },
                      icon: Icon(
                        _balanceVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: grey2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                text: 'Fund Wallet',
                onPressed: () {
                  pushTo(context, Fund(user: user, notifyParent: refresh));
                },
                buttonWidth: 155,
              ),
              CustomButton(
                text: 'Transfer',
                onPressed: () {
                  pushTo(context, Transfer(user: user, notifyParent: refresh));
                },
                buttonWidth: 155,
              ),
            ],
          ),

          const SizedBox(
            height: 40,
          ),
          const Text(
            'My dollar virtual cards',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          // virtual card
          CreditCard(
            onTopRightButtonClicked: () {},
            cardIcon: const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
