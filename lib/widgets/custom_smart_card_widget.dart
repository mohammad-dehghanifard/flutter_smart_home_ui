import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/config/ui_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSmartCardWidget extends StatelessWidget {
  const CustomSmartCardWidget({
    super.key, required this.value, required this.isActive, this.onChanged, required this.iconPath, required this.title,
  });
  final String value,iconPath,title;
  final bool isActive;
  final Function(bool newValue)? onChanged;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 169,
      height: 200,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          color: UiColors.brownColor,
          borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(value,style: GoogleFonts.manrope(fontSize: 24,color: UiColors.whiteColor),),
              SvgPicture.asset(iconPath)
            ],
          ),
          const SizedBox(height: 12),
          Text(title,style: GoogleFonts.manrope(fontSize: 14,color: UiColors.greyColor,fontWeight: FontWeight.w400)),
          const SizedBox(height: 32),
          const Divider(color: UiColors.lightBrownColor),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text( isActive ? "on" : "off",style: GoogleFonts.manrope(fontSize: 14,color: UiColors.greyColor,fontWeight: FontWeight.w400)),
              Switch(
                value: isActive,
                overlayColor: WidgetStatePropertyAll(UiColors.whiteColor.withOpacity(0.50)),
                thumbColor: WidgetStateProperty.resolveWith(
                      (states) {
                    if(states.contains(WidgetState.selected)) {
                      return UiColors.whiteColor;
                    } else {
                      return UiColors.greyColor;
                    }
                  },
                ),
                trackColor: WidgetStateProperty.resolveWith(
                      (states) {
                    if(states.contains(WidgetState.selected)) {
                      return UiColors.primaryColor;
                    } else {
                      return UiColors.lightBrownColor;
                    }
                  },
                ),
                trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
                onChanged: (value) {onChanged!(value);},
              )
            ],
          )

        ],
      ),
    );
  }
}