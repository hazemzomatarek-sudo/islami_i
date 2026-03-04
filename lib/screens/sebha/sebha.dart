import 'package:flutter/material.dart';
import 'package:islami_i/utils/app_assets.dart';
import 'package:islami_i/utils/app_styles.dart';
class Sebha extends StatelessWidget {

  const Sebha({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppAssets.sebhaBg),fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              Image.asset(AppAssets.logoPng),
              SizedBox(height: 20,),
              Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى ",style: AppStyles.whiteBold36,),
              SizedBox(height: 16,),
              Image.asset(AppAssets.sebhaImg),
            ],
          ),
        ),
      ),
    );
  }
}
