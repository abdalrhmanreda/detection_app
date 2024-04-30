import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constant/current_local.dart';
import '../colors/app_colors.dart';

class Style {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.kWhiteColor,
    useMaterial3: false,
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: AppColors.kPrimaryColor,
          onPrimary: AppColors.kPrimaryColor,
          onSurface: AppColors.kBlackColor,
        ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.kWhiteColor,
      elevation: 0,
      titleTextStyle: GoogleFonts.rubik(
        color: AppColors.kBlackColor,
        fontSize: 16.sp,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.kBlackColor,
        statusBarBrightness: Brightness.light,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: isArabic()
          ? GoogleFonts.rubik(
              color: AppColors.kBlackColor,
            )
          : GoogleFonts.rubik(
              color: AppColors.kBlackColor,
            ),
      bodyMedium: isArabic()
          ? GoogleFonts.rubik(
              color: AppColors.kBlackColor,
            )
          : GoogleFonts.rubik(
              color: AppColors.kBlackColor,
            ),
      bodySmall: isArabic()
          ? GoogleFonts.rubik(
              color: AppColors.kBlackColor,
            )
          : GoogleFonts.rubik(
              color: AppColors.kBlackColor,
            ),
      titleLarge: isArabic()
          ? GoogleFonts.rubik(
              color: AppColors.kBlackColor,
            )
          : GoogleFonts.rubik(
              color: AppColors.kBlackColor,
            ),
      titleMedium: isArabic()
          ? GoogleFonts.rubik(
              color: AppColors.kBlackColor,
            )
          : GoogleFonts.rubik(
              color: AppColors.kBlackColor,
            ),
      titleSmall: isArabic()
          ? GoogleFonts.rubik(
              color: AppColors.kBlackColor,
            )
          : GoogleFonts.rubik(
              color: AppColors.kBlackColor,
            ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.kPrimaryColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.kWhiteColor,
      selectedItemColor: AppColors.kPrimaryColor,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          isArabic()
              ? GoogleFonts.rubik(
                  color: AppColors.kPrimaryColor,
                )
              : GoogleFonts.rubik(
                  color: AppColors.kPrimaryColor,
                ),
        ),
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      headerBackgroundColor: AppColors.kPrimaryColor,
      todayBackgroundColor: MaterialStateProperty.all(
        AppColors.kPrimaryColor,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: AppColors.kPrimaryColor,
          onPrimary: AppColors.kPrimaryColor,
          onSurface: AppColors.kWhiteColor,
        ),
    useMaterial3: false,
    scaffoldBackgroundColor: (AppColors.kDarkPrimaryColor),
    appBarTheme: AppBarTheme(
      backgroundColor: (AppColors.kDarkPrimaryColor),
      elevation: 0,
      titleTextStyle: GoogleFonts.rubik(
        color: AppColors.kWhiteColor,
        fontSize: 18.sp,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.kWhiteColor,
    ),
    textTheme: TextTheme(
      bodyLarge: isArabic()
          ? GoogleFonts.rubik(
              color: AppColors.kWhiteColor,
            )
          : GoogleFonts.rubik(
              color: AppColors.kWhiteColor,
            ),
      bodyMedium: isArabic()
          ? GoogleFonts.rubik(
              color: AppColors.kWhiteColor,
            )
          : GoogleFonts.rubik(
              color: AppColors.kWhiteColor,
            ),
      bodySmall: isArabic()
          ? GoogleFonts.rubik(
              color: AppColors.kWhiteColor,
            )
          : GoogleFonts.rubik(
              color: AppColors.kWhiteColor,
            ),
      titleLarge: isArabic()
          ? GoogleFonts.rubik(
              color: AppColors.kWhiteColor,
            )
          : GoogleFonts.rubik(
              color: AppColors.kWhiteColor,
            ),
      titleMedium: isArabic()
          ? GoogleFonts.rubik(
              color: AppColors.kWhiteColor,
            )
          : GoogleFonts.rubik(
              color: AppColors.kWhiteColor,
            ),
      titleSmall: isArabic()
          ? GoogleFonts.rubik(
              color: AppColors.kWhiteColor,
            )
          : GoogleFonts.rubik(
              color: AppColors.kWhiteColor,
            ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.kPrimaryColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.kPrimaryColor,
      unselectedItemColor: AppColors.kWhiteColor,
      type: BottomNavigationBarType.fixed,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.kDarkThemColor,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: AppColors.kWhiteColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          GoogleFonts.rubik(
            color: AppColors.kWhiteColor,
          ),
        ),
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColors.kDarkPrimaryColor,
      headerHeadlineStyle: GoogleFonts.aBeeZee(color: Colors.white),
      headerHelpStyle: GoogleFonts.aBeeZee(color: Colors.white),
      dayStyle: GoogleFonts.aBeeZee(color: Colors.white),
      rangePickerHeaderHeadlineStyle: GoogleFonts.aBeeZee(color: Colors.white),
      rangePickerHeaderHelpStyle: GoogleFonts.aBeeZee(color: Colors.white),
      yearStyle: GoogleFonts.aBeeZee(color: Colors.white),
      weekdayStyle: GoogleFonts.aBeeZee(color: Colors.white),
      surfaceTintColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: GoogleFonts.aBeeZee(color: Colors.white),
        hintStyle: GoogleFonts.aBeeZee(color: Colors.white),
      ),
    ),
    timePickerTheme:
        const TimePickerThemeData(backgroundColor: AppColors.kDarkThemColor),
  );
}
