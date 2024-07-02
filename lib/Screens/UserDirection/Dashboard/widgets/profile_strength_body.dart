import 'package:create_cv/Screens/UserDirection/Dashboard/widgets/profile_strength_chart.dart';
import 'package:create_cv/Screens/UserDirection/Dashboard/widgets/profile_strength_details.dart';
import 'package:flutter/material.dart';

import '../utils/size_config.dart';
import 'detailed_income_chart.dart';


class ProfileStrengthBody extends StatelessWidget {
  const ProfileStrengthBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return width >= SizeConfig.desktop && width < 1750
        ? const Expanded(
            child: Padding(
            padding: EdgeInsets.all(16),
            child: DetailedIncomeChart(),
          ))
        : const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 2, child: ProfileStrengthDetails()),
              Expanded(child: ProfileStrengthChart()),
            ],
          );
  }
}
