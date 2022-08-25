import 'package:flutter/material.dart';

class Constants {
  // Constant Color
  static const Color kPinkColor = Color(0xFFFE53BB);
  static const Color kBlueColor = Color(0xFF4373D9);
  static const Color kGreenColor = Color(0xFF09FBD3);
  static const Color kBlackColor = Color(0xFF19191B);
  static const Color kYellowColor = Color(0xFFF2A33A);
  static const Color kWhiteColor = Color(0xFFFFFFFF);
  static const Color kGreyColor = Color.fromARGB(255, 45, 45, 71);

  // Constant Icon
  static const String kIconHome = 'assets/svg/icon-home.svg';
  static const String kIconPlayOnTv = 'assets/svg/icon-playtv.svg';
  static const String kIconPlus = 'assets/svg/icon-plus.svg';
  static const String kIconCategories = 'assets/svg/icon-categories.svg';
  static const String kIconDownload = 'assets/svg/icon-download.svg';
  static const String kIconSearch = 'assets/svg/icon-search.svg';
  static const String kIconMic = 'assets/svg/icon-mic.svg';
  static const String kIconPlay = 'assets/svg/icon-play.svg';
  static const String kIconBack = 'assets/svg/icon-back.svg';
  static const String kIconMenu = 'assets/svg/icon-menu.svg';
  static const String kIconCartoon = 'assets/svg/icon-char.png';

  // Constant Mask
  static const String kMaskFirstIndex = 'assets/mask/mask_firstIndex.png';
  static const String kMaskLastIndex = 'assets/mask/mask_lastIndex.png';
  static const String kMaskCenter = 'assets/mask/mask.png';
  static const String kMaskCast = 'assets/mask/mask_cast.png';

  static BoxDecoration outerDecorationService(double iradius, Color bgcolor) {
    return BoxDecoration(
        color: bgcolor,
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 8,
            color: kBlackColor.withOpacity(0.8),
            offset: const Offset(
              -5,
              -5,
            ),
          ),
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            color: kGreyColor.withOpacity(0.5),
            offset: const Offset(
              -2,
              -2,
            ),
          ),
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 4,
            color: kBlackColor.withOpacity(0.5),
            offset: const Offset(
              4,
              4,
            ),
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(
          iradius,
        )));
  }

  static BoxDecoration getBoxDecoration(
      {Color? color, double? radius, Border? border, Gradient? gradient}) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
      boxShadow: [
        BoxShadow(
            color: kBlackColor.withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0, 5)),
      ],
      border: border ?? Border.all(color: kWhiteColor.withOpacity(0.05)),
      gradient: gradient,
    );
  }

  static roundBoxDeco({Color color = Colors.white, double radius = 15}) {
    return BoxDecoration(
        color: color, borderRadius: BorderRadius.all(Radius.circular(radius)));
  }
}
