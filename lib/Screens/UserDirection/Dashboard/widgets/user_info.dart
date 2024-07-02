import 'package:create_cv/Screens/UserDirection/Dashboard/widgets/user_info_design.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        UserInfoDesign(),
        SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
