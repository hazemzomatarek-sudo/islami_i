import 'package:flutter/material.dart';
import 'package:islami_i/utils/app_colors.dart';

abstract final class AppStyles{
  static const TextStyle whiteBold20 = TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColors.white,
      fontSize:20
  );
  static const TextStyle whiteBold14 = TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColors.white,
      fontSize:14
  );
  static const TextStyle whiteBold16 = TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColors.white,
      fontSize:16
  );
  static const TextStyle goldBold20 = TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColors.gold,
      fontSize:20
  );
  static const TextStyle lightBlackBold16 = TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColors.lightBlack,
      fontSize:16
  );
  static const TextStyle lightBlackBold24 = TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColors.lightBlack,
      fontSize:24
  );
  static const TextStyle lightBlackBold14 = TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColors.lightBlack,
      fontSize:14
  );
}