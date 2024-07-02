import 'package:animate_do/animate_do.dart';
import 'package:create_cv/Screens/UserDirection/Dashboard/widgets/type_of_job_body.dart';
import 'package:create_cv/Screens/UserDirection/Dashboard/widgets/type_of_job_header.dart';
import 'package:flutter/material.dart';

import 'custom_background_container.dart';

class IncomeSection extends StatelessWidget {
  const IncomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
        child: Column(
      children: [
        FadeInLeft(
            delay: const Duration(milliseconds: 800),
            duration: const Duration(milliseconds: 900),
            child: const IncomeSectionHeader()),
        FadeInRight(
            delay: const Duration(milliseconds: 800),
            duration: const Duration(milliseconds: 900),
            child: const IncomSectionBody())
      ],
    ));
  }
}
