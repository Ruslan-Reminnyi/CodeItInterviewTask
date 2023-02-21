import 'package:code_it_interview_task/ui/widgets/option_bar.dart';
import 'package:code_it_interview_task/utils/global_constants.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OptionBar(optionsList: threeOptionsList),
    );
  }
}
