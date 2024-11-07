import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/config/ui_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSliderWidget extends StatelessWidget {
  const CustomSliderWidget({
    super.key, required this.sliderValue, required this.title, required this.iconPath, this.onChanged,
  });
  final double sliderValue;
  final String title,iconPath;
  final Function(double newValue)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: GoogleFonts.manrope(
            fontSize: 12,
            color: UiColors.whiteTextColor),),
        Row(
          children: [
            Expanded(
              child: Slider(
                value: sliderValue,
                max: 100,
                thumbColor: UiColors.whiteColor,
                activeColor: UiColors.primaryColor,
                inactiveColor: UiColors.greyColor,
                overlayColor: WidgetStatePropertyAll(UiColors.greyColor.withOpacity(0.50)),
                onChanged: (value) { onChanged!(value); },
              ),
            ),

            SvgPicture.asset(iconPath)
          ],
        )
      ],
    );
  }
}