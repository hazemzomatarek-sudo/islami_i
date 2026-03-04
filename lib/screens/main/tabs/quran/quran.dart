import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:islami_i/screens/sura_details/sura_details.dart';
import 'package:islami_i/utils/Constants.dart';
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.logoPng),
             SizedBox(height: 16,),
             buildSuraNameTextField(),
              SizedBox(height: 20,),
             // Expanded(flex: 3, child: buildMostRecentList()),
            Text("Suras List", style: AppStyles.whiteBold16, textAlign: TextAlign.start,),
              Expanded(flex: 7, child: buildSuraList()),
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

  Widget buildSuraList() {
    return ListView.separated(
      itemCount: suras.length ,
        itemBuilder: (context, index){
        return buildSuraItem(context,suras[index]);
        },
      separatorBuilder: (_, _) => Divider(),
    );
  }
  Widget buildSuraItem(BuildContext context,SuraDM sura,) => InkWell(
    onTap: (){
      Navigator.pushNamed(context, SuraDetails.routeName, arguments: sura);
    },
    child: Row(
    children: [
    Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage(AppAssets.imgSurNumberFrame,),
          ),
      ),
      child: Text("${sura.index + 1}",style: AppStyles.whiteBold14,),
    ),
    SizedBox(width:24,),
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(sura.nameEn,style: AppStyles.whiteBold20,),
         Text("${sura.verses}Verses", style: AppStyles.whiteBold14,),
      ],),
    ),
    Text(sura.nameAr,style: AppStyles.whiteBold20,)
    ],
    ),
  );
  }
  class SuraDM{
  String nameEn;
  String nameAr;
  String verses;
  int index;

  SuraDM(
      {
        required this.nameEn,
        required this.nameAr,
        required this.verses,
        required this.index
      }
      );

  }

