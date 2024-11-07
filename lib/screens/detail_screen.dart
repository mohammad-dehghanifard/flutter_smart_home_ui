import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/config/ui_colors.dart';
import 'package:flutter_smart_home_ui/widgets/custom_navigation_widget.dart';
import 'package:flutter_smart_home_ui/widgets/custom_slider_widget.dart';
import 'package:flutter_smart_home_ui/widgets/settings_card_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
   bool humidifierAir = false;
   bool purifierAir = true;
   double mainLightValue = 60.0;
   double floorLampValue = 20.0;
   int selectedPageIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationWidget(
        selectedPageIndex: selectedPageIndex,
        onChangePage: (int newPageIndex) {
          setState(() {
            selectedPageIndex = newPageIndex;
          });
        },),
      body: SafeArea(
        child:  SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              // image
              Container(
                width: double.infinity,
                height: 450,
                decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/png/image.png"),fit: BoxFit.cover)
                ),
              ),

              Positioned(
                top: 10,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset("assets/svg/back.svg"),
                      Text("Bedroom",style: GoogleFonts.manrope(fontSize: 18,color: UiColors.whiteColor),),
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
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      SettingsCardWidget(
                        iconPath: "assets/svg/humidity.svg",
                        title: "HumidifierAir",
                        isActive: humidifierAir,
                        onChanged: (value) {
                          setState(() {
                            humidifierAir = value;
                          });
                        }, value: 36,
                      ),

                      const Spacer(),

                      SettingsCardWidget(
                        iconPath: "assets/svg/clean.svg",
                        title: "PurifierAir",
                        isActive: purifierAir,
                        onChanged: (value) {
                          setState(() {
                            purifierAir = value;
                          });
                        }, value: 73,
                      ),

                    ],
                  ),
                ),
              ),
              Positioned(
                top: 630,
                left: 0,
                right: 0,
                child: Container(
                  margin: const EdgeInsets.all(20.0),
                  padding: const EdgeInsets.all(20.0),
                  width: double.infinity,
                  height: 170,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: UiColors.brownColor
                  ),
                  child: Column(
                    children: [
                      CustomSliderWidget(
                        title: 'Main light',
                        sliderValue: mainLightValue,
                        iconPath: "assets/svg/Lamp.svg",
                        onChanged: (newValue) {
                            setState(() {
                              mainLightValue = newValue;
                            });
                        },
                      ),
                      CustomSliderWidget(
                        title: 'Floor lamp',
                        sliderValue: floorLampValue,
                        iconPath: "assets/svg/Tablelamp.svg",
                        onChanged: (newValue) {
                          setState(() {
                            floorLampValue = newValue;
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

      ),
    );
  }
}




