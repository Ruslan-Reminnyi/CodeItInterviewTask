import 'package:code_it_interview_task/config/app_colors.dart';
import 'package:code_it_interview_task/config/app_fonts.dart';
import 'package:flutter/material.dart';

part 'option_slider.dart';

const double kOptionHeight = 50.0;
const double kBorderRadius = 28.0;
const double kHorizontalPadding = 16.0;

class OptionBar extends StatefulWidget {
  final List<String> optionsList;

  const OptionBar({
    Key? key,
    required this.optionsList,
  }) : super(key: key);

  @override
  State<OptionBar> createState() => _OptionBarState();
}

class _OptionBarState extends State<OptionBar> {
  final ValueNotifier<double> _sliderPosition = ValueNotifier(0.0);
  late double _optionWidth;
  late Map<int, String> _currentOption;

  @override
  void initState() {
    _currentOption = {0: widget.optionsList[0]};
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final screenWidth = MediaQuery.of(context).size.width;
    final optionBarWidth = screenWidth - (kHorizontalPadding * 2);
    final optionsAmount = widget.optionsList.length;
    _optionWidth = optionBarWidth / optionsAmount;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Center(
        child: SizedBox(
          height: kOptionHeight,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.lightBlue,
              borderRadius: BorderRadius.circular(kBorderRadius),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: widget.optionsList
                      .asMap()
                      .entries
                      .map(
                        (option) => GestureDetector(
                          onTap: () {
                            final optionIndex = option.key;
                            final optionTitle = option.value;

                            _currentOption = {optionIndex: optionTitle};
                            _sliderPosition.value = optionIndex * _optionWidth;
                          },
                          child: Text(
                            option.value,
                            style: AppFonts.commonFont,
                          ),
                        ),
                      )
                      .toList(),
                ),
                ValueListenableBuilder(
                  valueListenable: _sliderPosition,
                  builder: (_, double indent, __) => _OptionSlider(
                    title: _currentOption.values.first,
                    width: _optionWidth,
                    leftIndent: indent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
