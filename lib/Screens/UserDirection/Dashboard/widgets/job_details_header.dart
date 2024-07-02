import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class JobDetailsHeader extends StatelessWidget {
  const JobDetailsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Job Details',
          style: AppStyles.styleSemiBold20(context),
        ),
      ],
    );
  }
}
