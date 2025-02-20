import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:sizer/sizer.dart';

import '../../CV/build_options_page.dart';
import '../../CompanyDirection/HomePageCompany/Top Jobs/top_job_list_view.dart';
import '../../CompanyDirection/HomePageCompany/search.dart';
import '../../CompanyDirection/HomePageCompany/show_all_top_job.dart';
import '../Dashboard/views/dashboard_view.dart';
import '../Profile/profile_screen.dart';
import 'Companies/show_all_companies.dart';
import 'My Resumes/show_all_my_resume.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          leadingWidth: 75,
          leading: FadeInLeft(
              delay: const Duration(milliseconds: 800),
              duration: const Duration(milliseconds: 900),
              child: Image.asset('assets/Images/Logo.png')),
          actions: <Widget>[
            SizedBox(
              width: 150,
              child: Center(
                child: FadeInRight(
                  delay: const Duration(milliseconds: 800),
                  duration: const Duration(milliseconds: 900),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        // ignore: prefer_const_constructors
                        child: const Text(
                          'Hi, Shady Mohamed',
                          style: TextStyle(
                              fontFamily: 'Satoshi',
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      const Text(
                        'Let\'s start your career life',
                        style: TextStyle(
                            fontFamily: 'Satoshi',
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 60,
            ),
            FadeInRight(
              delay: const Duration(milliseconds: 800),
              duration: const Duration(milliseconds: 900),
              child: IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
              ),
            ),
          ],
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
          index: 2,
          backgroundColor: const Color(0xFF139487).withOpacity(0.5),
          color: const Color(0xFF139487),
          animationDuration: const Duration(milliseconds: 300),
          items: [
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Sizer(
                      builder: (context, orientation, deviceType) =>
                          const BuildOptionsPage(),
                    ),
                  ),
                );
              },
              child: const Icon(Icons.switch_account_outlined,
                  size: 30, color: Colors.white),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Sizer(
                      builder: (context, orientation, deviceType) =>
                          const DashBoradView(),
                    ),
                  ),
                );
              },
              child: const Icon(Icons.dashboard, size: 30, color: Colors.white),
            ),
            const Icon(Icons.home, size: 30, color: Colors.white),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Sizer(
                      builder: (context, orientation, deviceType) =>
                          const ProfileScreen(),
                    ),
                  ),
                );
              },
              child: const Icon(Icons.account_circle,
                  size: 30, color: Colors.white),
            ),
          ]),
      body: Column(
        children: [
          const SizedBox(height: 5),
          Expanded(
            flex: 6,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: FadeInUp(
                delay: const Duration(milliseconds: 600),
                duration: const Duration(milliseconds: 700),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 3, left: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: const Border(
                              bottom: BorderSide(color: Color(0xFF139487)),
                              top: BorderSide(color: Color(0xFF139487)),
                              left: BorderSide(color: Color(0xFF139487)),
                              right: BorderSide(color: Color(0xFF139487)),
                            )),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 5,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Sizer(
                                  builder: (context, orientation, deviceType) =>
                                      const SearchPage(),
                                ),
                              ),
                            );
                          },
                          color: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.search,
                                color: Color(0xFF139487),
                              ),
                              const Text(
                                "search here ...",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                highlightColor: const Color(0xFF139487),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.tune,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          FadeInLeft(
                            delay: const Duration(milliseconds: 800),
                            duration: const Duration(milliseconds: 900),
                            child: const Text(
                              "Top Jobs",
                              style: TextStyle(
                                fontFamily: 'Satoshi',
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const Spacer(),
                          MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Sizer(
                                    builder:
                                        (context, orientation, deviceType) =>
                                            const ShowAllTopJob(),
                                  ),
                                ),
                              );
                            },
                            color: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            // ignore: prefer_const_constructors
                            child: FadeInLeft(
                              delay: const Duration(milliseconds: 800),
                              duration: const Duration(milliseconds: 900),
                              child: const Row(
                                children: [
                                  Text(
                                    "SHOW ALL",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      color: Color(0xFF139487),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF139487),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FadeInUp(
                          delay: const Duration(milliseconds: 800),
                          duration: const Duration(milliseconds: 900),
                          child: const TopJobListView()),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          FadeInLeft(
                            delay: const Duration(milliseconds: 800),
                            duration: const Duration(milliseconds: 900),
                            child: const Text(
                              "Companies",
                              style: TextStyle(
                                fontFamily: 'Satoshi',
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const Spacer(),
                          MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Sizer(
                                    builder:
                                        (context, orientation, deviceType) =>
                                            const ShowAllCompanies(),
                                  ),
                                ),
                              );
                            },
                            color: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            // ignore: prefer_const_constructors
                            child: FadeInRight(
                              delay: const Duration(milliseconds: 800),
                              duration: const Duration(milliseconds: 900),
                              child: const Row(
                                children: [
                                  Text(
                                    "SHOW ALL",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      color: Color(0xFF139487),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF139487),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      FadeInUp(
                        delay: const Duration(milliseconds: 800),
                        duration: const Duration(milliseconds: 900),
                        child: SizedBox(
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            shrinkWrap: true,
                            itemBuilder: ((context, index) {
                              return const Padding(
                                padding: EdgeInsets.all(8),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 40,
                                  backgroundImage: AssetImage(
                                      'assets/icons/office-building.png'),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          FadeInLeft(
                            delay: const Duration(milliseconds: 800),
                            duration: const Duration(milliseconds: 900),
                            child: const Text(
                              "My Resumes",
                              style: TextStyle(
                                fontFamily: 'Satoshi',
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const Spacer(),
                          MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Sizer(
                                    builder:
                                        (context, orientation, deviceType) =>
                                            const ShowAllMyResumes(),
                                  ),
                                ),
                              );
                            },
                            color: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            // ignore: prefer_const_constructors
                            child: FadeInRight(
                              delay: const Duration(milliseconds: 800),
                              duration: const Duration(milliseconds: 900),
                              child: const Row(
                                children: [
                                  Text(
                                    "SEE ALL",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      color: Color(0xFF139487),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF139487),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 100,
                        width: 150,
                        padding: const EdgeInsets.only(top: 3, left: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: const Border(
                              bottom: BorderSide(color: Colors.black),
                              top: BorderSide(color: Colors.black),
                              left: BorderSide(color: Colors.black),
                              right: BorderSide(color: Colors.black),
                            )),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 5,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Sizer(
                                  builder: (context, orientation, deviceType) =>
                                      const BuildOptionsPage(),
                                ),
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.add,
                            color: Color(0xFF139487),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
