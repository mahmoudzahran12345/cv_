import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class IncomeSectionHeader extends StatelessWidget {
  const IncomeSectionHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Type of Job',
          style: AppStyles.styleSemiBold20(context),
        ),
      ],
    );
  }
}
