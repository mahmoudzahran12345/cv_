import 'package:create_cv/Screens/UserDirection/Dashboard/widgets/profile_strength_section.dart';
import 'package:create_cv/Screens/UserDirection/Dashboard/widgets/type_of_job_section.dart';
import 'package:create_cv/Screens/UserDirection/Dashboard/widgets/user_info.dart';
import 'package:flutter/material.dart';

import 'all_expensess_and_quick_invoice_section.dart';
import 'job_details_section.dart';



class DashBoardMobileLayout extends StatelessWidget {
  const DashBoardMobileLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          AllExpensessAndQuickInvoiceSection(),
          JobDetails(),
          SizedBox(
            height: 16,
          ),
          IncomeSection(),
          SizedBox(
            height: 16,
          ),
          UserInfo(),
          SizedBox(
            height: 16,
          ),
          ProfileStrengthSection(),
        ],
      ),
    );
  }
}
