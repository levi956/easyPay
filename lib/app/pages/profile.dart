import 'package:eazy_pay/app/pages/input_pin.dart';
import 'package:eazy_pay/core/system/navigation.dart';
import 'package:flutter/material.dart';

import '../../core/style/color_constants.dart';
import '../widgets/button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              'Profile',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: primaryDarkBlue,
                  radius: 35,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Odumirin Nifesi',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      children: const [
                        Text(
                          '@username',
                          style: TextStyle(
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    const SizedBox(
                      height: 17,
                    ),
                    Text(
                      'Edit',
                      style: TextStyle(
                        color: primaryDarkBlue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                print('Talk with us pressed');
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 15,
                    height: 60,
                    color: greyWhitish,
                  ),
                  Icon(
                    Icons.messenger_outline_rounded,
                    color: primaryDarkBlue,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Talk with us',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: primaryDarkBlue,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: primaryDarkBlue,
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 15,
                    height: 60,
                  ),
                  Icon(
                    Icons.help_outline_outlined,
                    color: primaryDarkBlue,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Help',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: primaryDarkBlue,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: primaryDarkBlue,
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 15,
                    height: 60,
                  ),
                  Icon(
                    Icons.share,
                    color: primaryDarkBlue,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Share',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: primaryDarkBlue,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: primaryDarkBlue,
                  ),
                ],
              ),
            ),
            const Spacer(),
            CustomButton(
              text: 'Sign Out',
              onPressed: () => pushToAndClearStack(context, const InputPin()),
              buttonWidth: double.maxFinite,
            )
          ],
        ),
      ),
    );
  }
}
