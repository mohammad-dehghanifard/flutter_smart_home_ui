import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/config/ui_colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsCardWidget extends StatelessWidget {
  const SettingsCardWidget({
    super.key, required this.isActive, this.onChanged, required this.value, required this.title, required this.iconPath,
  });

  final bool isActive;
  final Function(bool)? onChanged;
  final int value;
  final String title,iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 200,
      decoration: BoxDecoration(
          color: UiColors.brownColor,
          borderRadius: BorderRadius.circular(24)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "$value%",
                  style: GoogleFonts.manrope(
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                      color: UiColors.whiteColor),
                ),
                SvgPicture.asset(iconPath)
              ],
            ),
            const SizedBox(height: 16),
            Text(title,style: GoogleFonts.manrope(
                fontSize: 12,
                color: UiColors.whiteTextColor),),
            const SizedBox(height: 32),
            const Divider(color: UiColors.lightBrownColor),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(isActive ?"On" : "Off",style: GoogleFonts.manrope(
                    fontSize: 12,
                    color: UiColors.whiteTextColor)),

                Switch(
                  trackColor:  WidgetStateProperty.resolveWith(
                        (states) {
                      if(states.contains(WidgetState.selected)) {
                        return UiColors.primaryColor;
                      } else {
                        return UiColors.lightBrownColor;
                      }
                    },
                  ),
                  thumbColor: WidgetStateProperty.resolveWith(
                        (states) {
                      if(states.contains(WidgetState.selected)) {
                        return UiColors.brownColor;
                      } else {
                        return UiColors.greyColor;
                      }
                    },
                  ),
                  trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
                  activeColor:UiColors.primaryColor,
                  activeTrackColor: UiColors.primaryColor,
                  value: isActive, onChanged: (bool value) { onChanged!(value); },)

              ],
            )
          ],
        ),
      ),
    );
  }
}