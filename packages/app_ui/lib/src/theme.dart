import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

const _smallTextScaleFactor = 0.80;
const _largeTextScaleFactor = 1.20;

/// Namespace for the App [ThemeData].
class AppTheme {
  /// Standard `ThemeData` for App UI.
  static ThemeData get standard {
    return ThemeData(
      // primaryColor: AppColors.primary,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
      ),
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      iconTheme: const IconThemeData(
        color: AppColors.iconPrimaryColor,
      ),
      useMaterial3: true,
      appBarTheme: _appBarTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      filledButtonTheme: _filledButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      textButtonTheme: _textButtonThemeData,
      iconButtonTheme: _iconButtonThemeData,
      textTheme: _textTheme,
      dialogBackgroundColor: AppColors.white,
      dialogTheme: _dialogTheme,
      tooltipTheme: _tooltipTheme,
      bottomSheetTheme: _bottomSheetTheme,
      tabBarTheme: _tabBarTheme,
      dividerTheme: _dividerTheme,
      splashColor: AppColors.splashColor,
    );
  }

  /// `ThemeData` for App UI for small screens.
  static ThemeData get small {
    return standard.copyWith(textTheme: _smallTextTheme);
  }

  /// `ThemeData` for App UI for medium screens.
  static ThemeData get medium {
    return standard.copyWith(textTheme: _smallTextTheme);
  }

  /// `ThemeData` for App UI for large screens.
  static ThemeData get large {
    return standard.copyWith(textTheme: _largeTextTheme);
  }

  static TextTheme get _textTheme {
    return TextTheme(
      displayLarge: AppTextStyle.headline1,
      displayMedium: AppTextStyle.headline2,
      displaySmall: AppTextStyle.headline3,
      headlineMedium: AppTextStyle.headline4,
      headlineSmall: AppTextStyle.headline5,
      titleLarge: AppTextStyle.headline6,
      titleMedium: AppTextStyle.subtitle1,
      titleSmall: AppTextStyle.subtitle2,
      bodyLarge: AppTextStyle.bodyText1,
      bodyMedium: AppTextStyle.bodyText2,
      bodySmall: AppTextStyle.caption,
      labelSmall: AppTextStyle.overline,
      labelLarge: AppTextStyle.button,
    );
  }

  static TextTheme get _smallTextTheme {
    return TextTheme(
      displayLarge: AppTextStyle.headline1.copyWith(
        fontSize: _textTheme.displayLarge!.fontSize! * _smallTextScaleFactor,
      ),
      displayMedium: AppTextStyle.headline2.copyWith(
        fontSize: _textTheme.displayMedium!.fontSize! * _smallTextScaleFactor,
      ),
      displaySmall: AppTextStyle.headline3.copyWith(
        fontSize: _textTheme.displaySmall!.fontSize! * _smallTextScaleFactor,
      ),
      headlineMedium: AppTextStyle.headline4.copyWith(
        fontSize: _textTheme.headlineMedium!.fontSize! * _smallTextScaleFactor,
      ),
      headlineSmall: AppTextStyle.headline5.copyWith(
        fontSize: _textTheme.headlineSmall!.fontSize! * _smallTextScaleFactor,
      ),
      titleLarge: AppTextStyle.headline6.copyWith(
        fontSize: _textTheme.titleLarge!.fontSize! * _smallTextScaleFactor,
      ),
      titleMedium: AppTextStyle.subtitle1.copyWith(
        fontSize: _textTheme.titleMedium!.fontSize! * _smallTextScaleFactor,
      ),
      titleSmall: AppTextStyle.subtitle2.copyWith(
        fontSize: _textTheme.titleSmall!.fontSize! * _smallTextScaleFactor,
      ),
      bodyLarge: AppTextStyle.bodyText1.copyWith(
        fontSize: _textTheme.bodyLarge!.fontSize! * _smallTextScaleFactor,
      ),
      bodyMedium: AppTextStyle.bodyText2.copyWith(
        fontSize: _textTheme.bodyMedium!.fontSize! * _smallTextScaleFactor,
      ),
      bodySmall: AppTextStyle.caption.copyWith(
        fontSize: _textTheme.bodySmall!.fontSize! * _smallTextScaleFactor,
      ),
      labelSmall: AppTextStyle.overline.copyWith(
        fontSize: _textTheme.labelSmall!.fontSize! * _smallTextScaleFactor,
      ),
      labelLarge: AppTextStyle.button.copyWith(
        fontSize: _textTheme.labelLarge!.fontSize! * _smallTextScaleFactor,
      ),
    );
  }

  static TextTheme get _largeTextTheme {
    return TextTheme(
      displayLarge: AppTextStyle.headline1.copyWith(
        fontSize: _textTheme.displayLarge!.fontSize! * _largeTextScaleFactor,
      ),
      displayMedium: AppTextStyle.headline2.copyWith(
        fontSize: _textTheme.displayMedium!.fontSize! * _largeTextScaleFactor,
      ),
      displaySmall: AppTextStyle.headline3.copyWith(
        fontSize: _textTheme.displaySmall!.fontSize! * _largeTextScaleFactor,
      ),
      headlineMedium: AppTextStyle.headline4.copyWith(
        fontSize: _textTheme.headlineMedium!.fontSize! * _largeTextScaleFactor,
      ),
      headlineSmall: AppTextStyle.headline5.copyWith(
        fontSize: _textTheme.headlineSmall!.fontSize! * _largeTextScaleFactor,
      ),
      titleLarge: AppTextStyle.headline6.copyWith(
        fontSize: _textTheme.titleLarge!.fontSize! * _largeTextScaleFactor,
      ),
      titleMedium: AppTextStyle.subtitle1.copyWith(
        fontSize: _textTheme.titleMedium!.fontSize! * _largeTextScaleFactor,
      ),
      titleSmall: AppTextStyle.subtitle2.copyWith(
        fontSize: _textTheme.titleSmall!.fontSize! * _largeTextScaleFactor,
      ),
      bodyLarge: AppTextStyle.bodyText1.copyWith(
        fontSize: _textTheme.bodyLarge!.fontSize! * _largeTextScaleFactor,
      ),
      bodyMedium: AppTextStyle.bodyText2.copyWith(
        fontSize: _textTheme.bodyMedium!.fontSize! * _largeTextScaleFactor,
      ),
      bodySmall: AppTextStyle.caption.copyWith(
        fontSize: _textTheme.bodySmall!.fontSize! * _largeTextScaleFactor,
      ),
      labelSmall: AppTextStyle.overline.copyWith(
        fontSize: _textTheme.labelSmall!.fontSize! * _largeTextScaleFactor,
      ),
      labelLarge: AppTextStyle.button.copyWith(
        fontSize: _textTheme.labelLarge!.fontSize! * _largeTextScaleFactor,
      ),
    );
  }

  static AppBarTheme get _appBarTheme {
    return const AppBarTheme(
      color: AppColors.white,
      scrolledUnderElevation: 0,
      centerTitle: true,
    );
  }

  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.primary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        fixedSize: const Size(208, 54),
      ),
    );
  }

  static IconButtonThemeData get _iconButtonThemeData {
    return IconButtonThemeData(
      style: IconButton.styleFrom(
        elevation: 0,
        padding: EdgeInsets.all(Dimens.d12.responsive()),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(Dimens.d12.responsive())),
          // side: const BorderSide(),
        ),
        fixedSize: Size(Dimens.d44.responsive(), Dimens.d44.responsive()),
      ),
    );
  }

  static FilledButtonThemeData get _filledButtonTheme {
    return FilledButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(Dimens.d12.responsive())),
        ),
        minimumSize: Size(Dimens.d100.responsive(), Dimens.d48.responsive()),
      ),
    );
  }

  static TextButtonThemeData get _textButtonThemeData {
    return TextButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(Dimens.d12.responsive())),
        ),
        minimumSize: Size(Dimens.d100.responsive(), Dimens.d48.responsive()),
      ),
    );
  }

  static OutlinedButtonThemeData get _outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        side: const BorderSide(color: AppColors.white, width: 2),
        fixedSize: const Size(208, 54),
      ),
    );
  }

  static TooltipThemeData get _tooltipTheme {
    return const TooltipThemeData(
      decoration: BoxDecoration(
        color: AppColors.charcoal,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      padding: EdgeInsets.all(10),
      textStyle: TextStyle(color: AppColors.white),
    );
  }

  static DialogTheme get _dialogTheme {
    return DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  static BottomSheetThemeData get _bottomSheetTheme {
    return const BottomSheetThemeData(
      backgroundColor: AppColors.whiteBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
    );
  }

  static TabBarTheme get _tabBarTheme {
    return const TabBarTheme(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 2,
          color: AppColors.primary,
        ),
      ),
      labelColor: AppColors.primary,
      unselectedLabelColor: AppColors.black25,
      indicatorSize: TabBarIndicatorSize.tab,
    );
  }

  static DividerThemeData get _dividerTheme {
    return const DividerThemeData(
      // space: 0,
      // thickness: 1,
      color: AppColors.dividerColor,
    );
  }
}
