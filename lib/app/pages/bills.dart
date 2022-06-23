import 'package:flutter/material.dart';

import '../widgets/button.dart';
import '../widgets/textfield.dart';

class BillPage extends StatefulWidget {
  const BillPage({Key? key}) : super(key: key);

  @override
  State<BillPage> createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController amount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Bills',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Please Select Your Network',
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    text: 'MTN',
                    onPressed: () {},
                    buttonWidth: 65,
                  ),
                  CustomButton(
                    text: 'GLO',
                    onPressed: () {},
                    buttonWidth: 65,
                  ),
                  CustomButton(
                    text: 'AIRTEL',
                    onPressed: () {},
                    buttonWidth: 65,
                  ),
                  CustomButton(
                    text: '9MOBILE',
                    onPressed: () {},
                    buttonWidth: 65,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                isHidden: false,
                label: 'Phone number',
                textEditingController: phoneNumber,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                isHidden: false,
                label: 'Select Amount',
                textEditingController: amount,
                keyboardType: TextInputType.number,
              ),
              const Spacer(),
              CustomButton(
                text: 'PROCEED',
                onPressed: () {},
                buttonWidth: double.maxFinite,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
