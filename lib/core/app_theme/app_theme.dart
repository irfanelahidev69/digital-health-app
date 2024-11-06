import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utilities/colors.dart';


class AppTheme {
  ThemeData get lightTheme => ThemeData(
        useMaterial3: false,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
        ),
        primaryColor: AppColors.kOrangeColor,
        fontFamily: GoogleFonts.sourceSansPro().fontFamily,
        textTheme: TextTheme(
          displayLarge: GoogleFonts.sourceSansPro(fontSize: 30, fontWeight: FontWeight.w600, color: AppColors.kBlack),
          displayMedium: GoogleFonts.sourceSansPro(fontSize: 26, fontWeight: FontWeight.w600, color: AppColors.kBlack),
          displaySmall: GoogleFonts.sourceSansPro(fontSize: 24, fontWeight: FontWeight.w600, color: AppColors.kBlack),
          headlineLarge: GoogleFonts.sourceSansPro(fontSize: 30, fontWeight: FontWeight.w600, color: AppColors.kBlack),
          headlineMedium: GoogleFonts.sourceSansPro(fontSize: 24, fontWeight: FontWeight.w400, color: AppColors.kBlack),
          headlineSmall: GoogleFonts.sourceSansPro(fontSize: 22, fontWeight: FontWeight.w400, color: AppColors.kBlack),
          titleLarge: GoogleFonts.sourceSansPro(fontSize: 20, fontWeight: FontWeight.w400, color: AppColors.kBlack),
          titleSmall: GoogleFonts.sourceSansPro(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.kBlack),
          titleMedium: GoogleFonts.sourceSansPro(fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.kBlack),
          bodyLarge: GoogleFonts.sourceSansPro(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.kBlack),
          bodyMedium: GoogleFonts.sourceSansPro(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.kBlack),
          bodySmall: GoogleFonts.sourceSansPro(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.kBlack),
          labelLarge: GoogleFonts.sourceSansPro(fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.kBlack),
          labelMedium: GoogleFonts.sourceSansPro(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.kBlack),
          labelSmall: GoogleFonts.sourceSansPro(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.kBlack),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.kBlack,
          elevation: 5,
          iconTheme: IconThemeData(color: AppColors.kWhiteColor),
          titleTextStyle: TextStyle(color: AppColors.kWhiteColor,fontSize: 24, fontWeight: FontWeight.w500),

        ),
        bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
      );
}
