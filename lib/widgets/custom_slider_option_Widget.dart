
import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/config/ui_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';



class CustomSliderOptionWidget extends StatelessWidget {
  const CustomSliderOptionWidget({
    super.key, required this.title, required this.iconPath, this.onChanged, required this.value,
  });
  final String title,iconPath;
  final double value;
  final Function(double newValue)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: GoogleFonts.manrope(fontSize: 14,color: UiColors.greyColor)),
        Row(
          children: [
            Expanded(
              child: Slider(
                value: value,
                max: 100,
                thumbColor: UiColors.whiteColor,
                activeColor: UiColors.primaryColor,
                inactiveColor: UiColors.greyColor,
                overlayColor: WidgetStatePropertyAll(UiColors.whiteColor.withOpacity(0.20)),
                onChanged: (value) {
                  onChanged!(value);
                },),
            ),

            SvgPicture.asset(iconPath)
          ],
        )
      ],
    );
  }
}