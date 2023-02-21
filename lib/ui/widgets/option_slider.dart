part of 'option_bar.dart';

class _OptionSlider extends StatelessWidget {
  final String title;
  final double width;
  final double leftIndent;

  const _OptionSlider({
    Key? key,
    required this.title,
    required this.width,
    required this.leftIndent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 1000),
      left: leftIndent,
      height: kOptionHeight,
      width: width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        child: Center(
          child: Text(
            title,
            style: AppFonts.optionSliderFont,
          ),
        ),
      ),
    );
  }
}
