import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_i/screens/main/tabs/quran/quran.dart';
import 'package:islami_i/utils/app_assets.dart';
import 'package:islami_i/utils/app_colors.dart';
import 'package:islami_i/utils/app_styles.dart';
class SuraDetails extends StatefulWidget {
  static const routeName = 'SuraDetails';
  SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
late SuraDM suraDm;

String suraContent = "";
@override
void initState() {
  super.initState();
}
  @override
  Widget build(BuildContext context) {
    suraDm = ModalRoute.of(context)!.settings.arguments as SuraDM;
    if(suraContent.isEmpty) {
      readFile();
    }
    return Scaffold(
      backgroundColor: AppColors.lightBlack,
      appBar: AppBar(
        title: Text(suraDm.nameEn, style: AppStyles.goldBold20,),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 18),
        child: Column(
          children: [
            Row(
              children: [
              Image.asset(AppAssets.leftCornerImg),
                Spacer(),
                Text(suraDm.nameAr,style: AppStyles.goldBold20,),
                Spacer(),
                Image.asset(AppAssets.rightCornerImg),
              ],
            ),
            SizedBox(height: 12,),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  suraContent,
                  style: AppStyles.goldBold20,
                  textDirection:
                  TextDirection.rtl,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Image.asset(AppAssets.mosque),
          ],
        ),
      ),
    );
  }

  readFile() async {
    var fileName = "assets/files/Quran/${suraDm.index + 1}.txt";
    suraContent = await rootBundle.loadString(fileName);
    suraContent = suraContent.trim();
    List<String> suraLines = suraContent.split("\n");
    for(int i = 0; i < suraLines.length; i++){
      suraLines[i] += "{${i+1}}";
    }
    suraContent = suraLines.join();
setState(() {});
  }
}
