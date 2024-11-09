import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/config/ui_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavigationWidget extends StatelessWidget {
  const CustomNavigationWidget({super.key, required this.selectedIndex, required this.onPageChanged});
  final int selectedIndex;
  final Function(int newIndex) onPageChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: const BoxDecoration(
        color: UiColors.scaffoldBgColor
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _NavItem(
                iconPath: "assets/svg/home.svg",
                selected: selectedIndex == 0,
                onTap: () => onPageChanged(0),
            ),
            _NavItem(
                iconPath: "assets/svg/search.svg",
              selected: selectedIndex == 1,
              onTap: () => onPageChanged(1),
                ),
            _NavItem(
              iconPath: "assets/svg/grid.svg",
              selected: selectedIndex == 3,
              onTap: () => onPageChanged(3),
            ),
            _NavItem(
                iconPath: "assets/svg/profile.svg",
              selected: selectedIndex == 4,
              onTap: () => onPageChanged(4),
            ),
          ],
        ),
      ),
    );
  }
}





class _NavItem extends StatelessWidget {
  const _NavItem({super.key, required this.iconPath, required this.selected, required this.onTap});
  final String iconPath;
  final bool selected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
          iconPath,
          colorFilter: ColorFilter.mode(
              selected ? UiColors.primaryColor : UiColors.greyColor,
              BlendMode.srcIn
          ),
      ),
    );
  }
}
