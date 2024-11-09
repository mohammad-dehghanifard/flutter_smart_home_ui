import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/config/ui_colors.dart';
import 'package:flutter_smart_home_ui/widgets/custom_navigation_widget.dart';
import 'package:flutter_smart_home_ui/widgets/custom_slider_option_Widget.dart';
import 'package:flutter_smart_home_ui/widgets/custom_smart_card_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  bool humidFireValue = false;
  bool purifierValue = true;
  double mainLightValue = 30;
  double floorLightValue = 60;
  int selectedPage = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationWidget(
        selectedIndex: selectedPage,
        onPageChanged: (newIndex) {
          setState(() {
            selectedPage = newIndex;
          });
        },
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            // image
            SizedBox(
              width: double.infinity,
              height: 480,
              child: Image.asset("assets/png/image.png",fit: BoxFit.cover),
            ),
            // app bar
            Positioned(
              top: 60,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset("assets/svg/back.svg"),
                    Text("Bedroom",style: GoogleFonts.manrope(fontSize: 16,color: UiColors.whiteColor),),
                    SvgPicture.asset("assets/svg/bell.svg"),
                  ],
                ),
              ),
            ),

            Positioned(
              top: 400,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomSmartCardWidget(
                      value: '36%',
                      title: "HumidifierAir",
                      isActive: humidFireValue,
                      iconPath: "assets/svg/humidity.svg",
                      onChanged: (newValue) {
                        setState(() {
                          humidFireValue = newValue;
                        });
                      },
                    ),
                    CustomSmartCardWidget(
                      value: '72%',
                      title: "Purifier Air",
                      isActive: purifierValue,
                      iconPath: "assets/svg/clean.svg",
                      onChanged: (newValue) {
                        setState(() {
                          purifierValue = newValue;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              top: 650,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: 180,
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 16.0),
                decoration: BoxDecoration(
                  color: UiColors.brownColor,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  children: [
                    CustomSliderOptionWidget(
                      title: "Main light",
                      iconPath: "assets/svg/Lamp.svg",
                      value: mainLightValue,
                      onChanged: (newValue) {
                        setState(() {
                          mainLightValue = newValue;
                        });
                      },
                    ),

                    CustomSliderOptionWidget(
                      title: "Floor lamp",
                      iconPath: "assets/svg/Tablelamp.svg",
                      value: floorLightValue,
                      onChanged: (newValue) {
                        setState(() {
                          floorLightValue = newValue;
                        });
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}






