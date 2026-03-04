import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_i/utils/app_assets.dart';
import 'package:islami_i/utils/app_colors.dart';

import '../../../../utils/app_styles.dart';
class AhadethTab extends StatelessWidget {
  const AhadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.ahadethTab),fit: BoxFit.fill),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppAssets.logoPng),
        Expanded(child: CarouselSlider.builder(
            options: CarouselOptions(
        autoPlay: false,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        height: double.infinity,
            ),
            itemCount: 10,
          itemBuilder: (context, index, _){
        return Container(
          decoration: BoxDecoration(
            color: AppColors.gold,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(AppAssets.leftCornerImg, color: AppColors.lightBlack,),
                  Spacer(),
                  Text("الحديث",style: AppStyles.lightBlackBold24,),
                  Spacer(),
                  Image.asset(AppAssets.rightCornerImg, color: AppColors.lightBlack,),
                ],
              ),
              Text("nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn"),
            ],
          ),
        );
          },
          ),
        ),
          ],
        ),
      ),
    );
  }
}
