import 'package:flutter/material.dart';

import '../utils/size_config.dart';
import 'detailed_income_chart.dart';
import 'job_details_chart.dart';
import 'job_details_details.dart';


class JobDetailsBody extends StatelessWidget {
  const JobDetailsBody({
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
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              JobDetailsChart(),
              const SizedBox(height: 20),
              const JobDetailsDetails(),
            ],
          );
  }
}
