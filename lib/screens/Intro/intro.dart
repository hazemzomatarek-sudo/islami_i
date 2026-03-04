import 'package:flutter/material.dart';
import 'package:islami_i/utils/app_assets.dart';
import 'package:islami_i/utils/app_colors.dart';
import 'package:islami_i/utils/app_styles.dart';

import '../main/main.dart';

class Intro extends StatefulWidget {
  static const routeName = "Intro";
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  int currentIndex = 0;
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            children: [
              Container(
                color: AppColors.lightBlack,
                child: Column(
                  children: [
                    Image.asset(AppAssets.logoPng),
                    const SizedBox(height: 90),
                    Image.asset(AppAssets.introTextImg),
                    const SizedBox(height: 100),
                    Text(
                      "Welcome To Islmi App",
                      style: AppStyles.goldBold20,
                    ),
                  ],
                ),
              ),

              Container(
                color: AppColors.lightBlack,
                child:Column(
                  children: [
                    Image.asset(AppAssets.logoPng),
                    const SizedBox(height: 60,),
                    Image.asset(AppAssets.introMasgedImg),
                    const SizedBox(height: 20,),
                    Text('Welcome To Islami',style: AppStyles.goldBold20,),
                    const SizedBox(height: 30,),
                    Text("We Are Very Excited To Have You In Our Community",style: AppStyles.goldBold20,textAlign: TextAlign.center),
                  ],
                ),
              ),
              Container(
                color: AppColors.lightBlack,
                child:Column(
                  children: [
                    Image.asset(AppAssets.logoPng),
                    const SizedBox(height: 60,),
                    Image.asset(AppAssets.introMoshafImg),
                    const SizedBox(height: 80,),
                    Text('Reading the Quran',style: AppStyles.goldBold20,),
                    const SizedBox(height: 30,),
                    Text("Read, and your Lord is the Most Generous",style: AppStyles.goldBold20,),
                  ],
                ),
              ),
              Container(
                color: AppColors.lightBlack,
                child:Column(
                  children: [
                    Image.asset(AppAssets.logoPng),
                    const SizedBox(height: 60,),
                    Image.asset(AppAssets.introDoaaImg),
                    const SizedBox(height: 20,),
                    Text('Bearish',style: AppStyles.goldBold20,),
                    const SizedBox(height: 30,),
                    Text("Praise the name of your Lord, the Most High",style: AppStyles.goldBold20,textAlign: TextAlign.center),
                  ],
                ),
              ),
              Container(
                color: AppColors.lightBlack,
                child:Column(
                  children: [
                    Image.asset(AppAssets.logoPng),
                    const SizedBox(height: 60,),
                    Image.asset(AppAssets.introMiceImg),
                    const SizedBox(height: 20,),
                    Text('Holy Quran Radio',style: AppStyles.goldBold20,),
                    const SizedBox(height: 30,),
                    Text("You can listen to the Holy Quran Radio through the application for free and easily",style: AppStyles.goldBold20,textAlign: TextAlign.center),
                  ],
                ),
              ),
            ],
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                          (index) => buildDot(index),
                    ),
                  ),
                  const SizedBox(height: 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      if (currentIndex > 0)
                        TextButton(
                          onPressed: () {
                            _controller.previousPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Text(
                            "Back",
                            style: AppStyles.whiteBold16?.copyWith(
                              color: AppColors.gold,
                            ),
                          ),
                        )
                      else
                        const SizedBox(width: 20),


                      ElevatedButton(
                        onPressed: () {
                          if (currentIndex < 4) {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          } else {

                            Navigator.pushReplacementNamed(
                              context,
                              Main.routeName,
                            );

                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: AppColors.gold,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          currentIndex < 4 ? "Next" : "Finish",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 7),
      width: currentIndex == index ? 7 : 7,
      height: currentIndex == index ? 10 : 10,
      decoration: BoxDecoration(
        color: currentIndex == index ? AppColors.gold : const Color(0xff707070),
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
