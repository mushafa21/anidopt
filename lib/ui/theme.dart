import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dimen.dart';
import 'type.dart';
import 'color.dart';

class AppTheme {
  // Settings Light Theme
  static ThemeData get light {
    return ThemeData(
        fontFamily: "Inter",
        useMaterial3: true,
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: primaryColor,
            onPrimary: onPrimaryColor,
            primaryContainer: primaryContainerColor,
            onPrimaryContainer: onPrimaryContainerColor,
            secondary: secondaryColor,
            onSecondary: onSecondaryColor,
            secondaryContainer: secondaryContainerColor,
            onSecondaryContainer: onSecondaryContainerColor,
            error: errorColor,
            onError: onErrorColor,
            background: backgroundColor,
            onBackground: onBackgroundColor,
            surface: surfaceColor,
            onSurface: onSurfaceColor),
        textTheme: TextTheme(
          displayLarge: lBold.copyWith(color: textColor),
          displayMedium: mlBold.copyWith(color: textColor),
          displaySmall: mBold.copyWith(color: textColor),
          headlineLarge: lSemiBold.copyWith(color: textColor),
          headlineMedium: mlSemiBold.copyWith(color: textColor),
          headlineSmall: mSemiBold.copyWith(color: textColor),
          titleLarge: smMedium.copyWith(color: textColor),
          titleMedium: sMedium.copyWith(color: textColor),
          titleSmall: xsMedium.copyWith(color: textColor),
          bodyLarge: smRegular.copyWith(color: textColor),
          bodyMedium: sRegular.copyWith(color: textColor),
          bodySmall: xsRegular.copyWith(color: textColor),
          labelLarge: sRegular.copyWith(color: textColor),
          labelMedium: xsRegular.copyWith(color: textColor),
          labelSmall: xxsRegular.copyWith(color: textColor),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // actionIconTheme: _actionIconThemeData,
        appBarTheme: _appBarTheme,
        inputDecorationTheme: _inputDecorationTheme,
        outlinedButtonTheme: _outlinedButtonThemeData,
        elevatedButtonTheme: _elevatedButtonThemeData,
        scaffoldBackgroundColor: backgroundColor,
        textButtonTheme: _textButtonThemeData,
        iconButtonTheme: _iconButtonThemeData,
        chipTheme: _chipThemeData,
        bottomSheetTheme: _bottomSheetThemeData,
        radioTheme: _radioTheme,
        floatingActionButtonTheme: _floatingActionButtonThemeData,
        cardTheme: _cardTheme);
  }

  static ThemeData get dark {
    return ThemeData(
        fontFamily: "Inter",
        useMaterial3: true,
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: primaryColor,
            onPrimary: onPrimaryColor,
            primaryContainer: primaryContainerColor,
            onPrimaryContainer: onPrimaryContainerColor,
            secondary: secondaryColor,
            onSecondary: onSecondaryColor,
            secondaryContainer: secondaryContainerColor,
            onSecondaryContainer: onSecondaryContainerColor,
            error: errorColor,
            onError: onErrorColor,
            background: backgroundColor,
            onBackground: onBackgroundColor,
            surface: surfaceColor,
            onSurface: onSurfaceColor),
        textTheme: TextTheme(
          displayLarge: lBold.copyWith(color: textColor),
          displayMedium: mlBold.copyWith(color: textColor),
          displaySmall: mBold.copyWith(color: textColor),
          headlineLarge: lSemiBold.copyWith(color: textColor),
          headlineMedium: mlSemiBold.copyWith(color: textColor),
          headlineSmall: mSemiBold.copyWith(color: textColor),
          titleLarge: smMedium.copyWith(color: textColor),
          titleMedium: sMedium.copyWith(color: textColor),
          titleSmall: xsMedium.copyWith(color: textColor),
          bodyLarge: smRegular.copyWith(color: textColor),
          bodyMedium: sRegular.copyWith(color: textColor),
          bodySmall: xsRegular.copyWith(color: textColor),
          labelLarge: sRegular.copyWith(color: textColor),
          labelMedium: xsRegular.copyWith(color: textColor),
          labelSmall: xxsRegular.copyWith(color: textColor),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // actionIconTheme: _actionIconThemeData,
        appBarTheme: _appBarTheme,
        inputDecorationTheme: _inputDecorationTheme,
        outlinedButtonTheme: _outlinedButtonThemeData,
        elevatedButtonTheme: _elevatedButtonThemeData,
        scaffoldBackgroundColor: backgroundColor,
        textButtonTheme: _textButtonThemeData,
        iconButtonTheme: _iconButtonThemeData,
        chipTheme: _chipThemeData,
        bottomSheetTheme: _bottomSheetThemeData,
        radioTheme: _radioTheme,
        floatingActionButtonTheme: _floatingActionButtonThemeData,
        cardTheme: _cardTheme);
  }

  // static final ActionIconThemeData _actionIconThemeData = ActionIconThemeData(
  //   backButtonIconBuilder: (BuildContext context) => IconButton(
  //     onPressed: () => Navigator.maybePop(context),
  //     icon: SvgPicture.asset('assets/images/ic_back.svg',width: 12,height: 12,),
  //   ),
  // );

  static const AppBarTheme _appBarTheme = AppBarTheme(
      iconTheme: IconThemeData(
        color: textColor, //change your color here
      ),
      backgroundColor: backgroundColor,
      elevation: 0,
      titleTextStyle: smMedium,
      centerTitle: false,
      scrolledUnderElevation: 0);

  static const CardTheme _cardTheme = CardTheme(color: whiteColor);

  static const RadioThemeData _radioTheme = RadioThemeData(
    fillColor: MaterialStatePropertyAll<Color>(primaryColor),
  );

  static final InputDecorationTheme _inputDecorationTheme =
      InputDecorationTheme(
    hintStyle: sRegular.copyWith(color: gray6Color),
    labelStyle: sRegular.copyWith(color: gray6Color),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: spacing5,
      vertical: spacing5,
    ),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: gray9Color,
        )),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: primaryColor)),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: errorColor)),
  );

  static final OutlinedButtonThemeData _outlinedButtonThemeData =
      OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: Size.zero,
              padding: const EdgeInsets.symmetric(
                  horizontal: spacing7, vertical: spacing3),
              textStyle: smBold.copyWith(color: primaryColor),
              backgroundColor: primaryContainerColor,
              foregroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radiusXxl)),
              side: const BorderSide(
                color: primaryColor,
              )));

  static final ElevatedButtonThemeData _elevatedButtonThemeData =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    minimumSize: Size.zero,
    padding:
        const EdgeInsets.symmetric(horizontal: spacing5, vertical: spacing3),
    foregroundColor: onPrimaryColor,
    backgroundColor: primaryColor,
    disabledForegroundColor: gray7Color,
    disabledBackgroundColor: gray8Color,
    textStyle: smSemiBold,
  ));

  static final ChipThemeData _chipThemeData = ChipThemeData(
      backgroundColor: gray11Color,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusXl)),
      side: BorderSide(color: gray10Color, width: 1));

  static final TextButtonThemeData _textButtonThemeData = TextButtonThemeData(
      style: TextButton.styleFrom(
    minimumSize: Size.zero,
    padding: EdgeInsets.zero,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  ));

  static final IconButtonThemeData _iconButtonThemeData = IconButtonThemeData(
      style: IconButton.styleFrom(
    minimumSize: Size.zero,
    padding: EdgeInsets.zero,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  ));

  static final BottomSheetThemeData _bottomSheetThemeData =
      BottomSheetThemeData(
    backgroundColor: backgroundColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topLeft: Radius.circular(radiusLg),
      topRight: Radius.circular(radiusLg),
    )),
  );

  static final FloatingActionButtonThemeData _floatingActionButtonThemeData =
      FloatingActionButtonThemeData(
    backgroundColor: primaryColor.withOpacity(0.20),
  );

  /// Base
// // Settings Light Theme
// static ThemeData get light {
//   return ThemeData(
//     fontFamily: "Jakarta",
//     useMaterial3: true,
//     colorScheme: const ColorScheme(
//         brightness: Brightness.light,
//         primary: primaryColorLight,
//         onPrimary: onPrimaryColorLight,
//         primaryContainer: primaryContainerColorLight,
//         onPrimaryContainer: onPrimaryContainerColorLight,
//         secondary: secondaryColorLight,
//         onSecondary: onSecondaryColorLight,
//         secondaryContainer: secondaryContainerColorLight,
//         onSecondaryContainer: onSecondaryContainerColorLight,
//         error: errorColorLight,
//         onError: onErrorColorLight,
//         background: backgroundColorLight,
//         onBackground: onBackgroundColorLight,
//         surface: surfaceColorLight,
//         onSurface: onSurfaceColorLight),
//     textTheme: TextTheme(
//         displayLarge : bold22.copyWith(color: textColorLight),
//         displayMedium: bold18.copyWith(color: textColorLight),
//         displaySmall: bold14.copyWith(color: textColorLight),
//         headlineLarge: semiBold22.copyWith(color: textColorLight),
//         headlineMedium: semiBold18.copyWith(color: textColorLight),
//         headlineSmall: semiBold14.copyWith(color: textColorLight),
//         titleLarge: medium18.copyWith(color: textColorLight),
//         titleMedium: medium14.copyWith(color: textColorLight),
//         titleSmall: medium12.copyWith(color: textColorLight),
//         bodyLarge: reguler18.copyWith(color: textColorLight),
//         bodyMedium: reguler14.copyWith(color: textColorLight),
//         bodySmall: reguler12.copyWith(color: textColorLight),
//         labelLarge: reguler14.copyWith(color: textColorLight),
//         labelMedium: reguler12.copyWith(color: textColorLight),
//         labelSmall: reguler9.copyWith(color: textColorLight),
//     ),
//     visualDensity: VisualDensity.adaptivePlatformDensity,
//   );
// }
//
// static ThemeData get dark {
//   return ThemeData(
//     fontFamily: "Jakarta",
//     useMaterial3: true,
//     colorScheme: const ColorScheme(
//         brightness: Brightness.dark,
//         primary: primaryColorDark,
//         onPrimary: onPrimaryColorDark,
//         primaryContainer: primaryContainerColorDark,
//         onPrimaryContainer: onPrimaryContainerColorDark,
//         secondary: secondaryColorDark,
//         onSecondary: onSecondaryColorDark,
//         secondaryContainer: secondaryContainerColorDark,
//         onSecondaryContainer: onSecondaryContainerColorDark,
//         error: errorColorDark,
//         onError: onErrorColorDark,
//         background: backgroundColorDark,
//         onBackground: onBackgroundColorDark,
//         surface: surfaceColorDark,
//         onSurface: onSurfaceColorDark),
//     textTheme: TextTheme(
//       displayLarge : bold22.copyWith(color: textColorDark),
//       displayMedium: bold18.copyWith(color: textColorDark),
//       displaySmall: bold14.copyWith(color: textColorDark),
//       headlineLarge: semiBold22.copyWith(color: textColorDark),
//       headlineMedium: semiBold18.copyWith(color: textColorDark),
//       headlineSmall: semiBold14.copyWith(color: textColorDark),
//       titleLarge: medium18.copyWith(color: textColorDark),
//       titleMedium: medium14.copyWith(color: textColorDark),
//       titleSmall: medium12.copyWith(color: textColorDark),
//       bodyLarge: reguler18.copyWith(color: textColorDark),
//       bodyMedium: reguler14.copyWith(color: textColorDark),
//       bodySmall: reguler12.copyWith(color: textColorDark),
//       labelLarge: reguler14.copyWith(color: textColorDark),
//       labelMedium: reguler12.copyWith(color: textColorDark),
//       labelSmall: reguler9.copyWith(color: textColorDark),
//     ),
//     visualDensity: VisualDensity.adaptivePlatformDensity,
//   );
// }
}
