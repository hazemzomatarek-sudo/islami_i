import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:islami_i/utils/app_assets.dart';
import 'package:islami_i/utils/app_colors.dart';
import 'package:islami_i/utils/app_styles.dart';
class Quran extends StatelessWidget {
  const Quran({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.quranTab),
        fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppAssets.logoPng),
             SizedBox(height: 16,),
             buildSuraNameTextField(),
              SizedBox(height: 20,),
              Expanded(flex: 3, child: buildMostRecentList()),
              Spacer(flex: 7,),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildSuraNameTextField(){
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColors.gold, width: 1)
    );
    return TextField(
      decoration: InputDecoration(
        labelText: "Sura Name",
        labelStyle: AppStyles.whiteBold16,
        errorBorder: border,
        focusedBorder: border,
        enabledBorder: border,
        border: border,
        prefixIcon: ImageIcon(AssetImage(AppAssets.icQuran), color: AppColors.gold,)
      ),
      cursorColor: AppColors.gold,
      style: AppStyles.whiteBold16,
    );
  }
  
  Widget buildMostRecentList(){
    return Column(
      children: [
      Text("Most Recently", style: AppStyles.whiteBold16,),
        SizedBox(height: 10,),
        Expanded(
            child: ListView.builder(
              itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                buildMostRecentSuraItem(context),
            ),
        ),
      ],
    );
  }
  buildMostRecentSuraItem(BuildContext context) =>
    Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.gold
      ),
      height: MediaQuery.of(context).size.height * .15,
      width: MediaQuery.of(context).size.width * .8,
      child: Row(
        children: [
          SizedBox(width: 16,),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Al-Anbiya",style: AppStyles.lightBlackBold24,),
              Text("الانبياء",style: AppStyles.lightBlackBold24,),
              Text("112 Verses",style: AppStyles.lightBlackBold14,),
            ],
          )),
          Image.asset(AppAssets.imgMostRecent)
        ],
      ),
    );
  }

