import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/config/ui_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavigationWidget extends StatelessWidget {
  const CustomNavigationWidget({super.key, required this.onChangePage,this.selectedPageIndex = 0});
  final Function(int newPageIndex) onChangePage;
  final int selectedPageIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 65,
      decoration: BoxDecoration(
        color: UiColors.brownColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(32),
          topLeft: Radius.circular(32),
        ),
        border: Border(top: BorderSide(color: UiColors.primaryColor.withOpacity(0.45)))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _NavItem(
              iconPath: "assets/svg/home.svg",
              selected: selectedPageIndex == 0,
              onTap: () =>onChangePage(0)),
          _NavItem(
            iconPath: "assets/svg/search.svg",
              selected: selectedPageIndex == 1,
              onTap: () =>onChangePage(1)),
          _NavItem(
            iconPath: "assets/svg/grid.svg",
              selected: selectedPageIndex == 2,
              onTap: () =>onChangePage(2)),
          _NavItem(
            iconPath: "assets/svg/profile.svg",
              selected: selectedPageIndex == 3,
              onTap: () =>onChangePage(3)),
        ],
      ),
    );
  }
}



class _NavItem extends StatelessWidget {
  const _NavItem({super.key, required this.iconPath, this.selected = false, required this.onTap});
  final String iconPath;
  final bool selected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
          iconPath,
        colorFilter: ColorFilter.mode(selected? UiColors.primaryColor : UiColors.greyColor,BlendMode.srcIn),
      ),
    );
  }
}
