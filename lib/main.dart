import 'package:bloc/bloc.dart';
import 'package:create_cv/shared/shared.dart';
import 'package:flutter/material.dart';

import 'Screens/CV/build_options_page.dart';
import 'Screens/CV/options/achievement_page.dart';
import 'Screens/CV/options/carrier_objective_page.dart';
import 'Screens/CV/options/contact_info_page.dart';
import 'Screens/CV/options/declaration_page.dart';
import 'Screens/CV/options/education_page.dart';
import 'Screens/CV/options/experience_page.dart';
import 'Screens/CV/options/interest_hobbies_page.dart';
import 'Screens/CV/options/personal_details_page.dart';
import 'Screens/CV/options/projects_page.dart';
import 'Screens/CV/options/reference_page.dart';
import 'Screens/CV/options/technical_skills_page.dart';
import 'Screens/CV/pdf_page.dart';
import 'Screens/splash_screen.dart';
import 'bloc/blocobserve.dart';

void main()async  {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheNetwork.cacheInitialization();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        "build_option_page": (context) => const BuildOptionsPage(),
        "contact_info_page": (context) => const ContactInfoPage(),
        "carrier_objective_page": (context) => const CarrierObjectivePage(),
        "personal_details_page": (context) => const PersonalDetailsPage(),
        "education_page": (context) => const EducationPage(),
        "experience_page": (context) => const ExperiencePage(),
        "technical_skills_page": (context) => const TechnicalSkillsPage(),
        "interest_hobbies_page": (context) => const InterestHobbiesPage(),
        "projects_page": (context) => const ProjectsPage(),
        "achievement_page": (context) => const AchievementPage(),
        "reference_page": (context) => const ReferencePage(),
        "declaration_page": (context) => const DeclarationPage(),
        "pdf_page": (context) => const PDFPage(),
      },
    ),);
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
