import 'package:code_it_interview_task/config/app_colors.dart';
import 'package:code_it_interview_task/ui/screens/main_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interview Task',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.darkBlue,
      ),
      home: const MainScreen(),
    );
  }
}
