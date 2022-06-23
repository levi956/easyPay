import 'package:flutter/material.dart';

import '../../core/style/color_constants.dart';

void showLoader(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: primaryDarkBlue,
        strokeWidth: 3.0,
      ),
    ),
  );
}
