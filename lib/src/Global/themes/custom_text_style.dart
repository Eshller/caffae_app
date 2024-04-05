// ignore_for_file: unused_element

import 'package:caffae_app/src/Global/Utils/size_utils.dart';
import 'package:caffae_app/src/Global/themes/theme_helper.dart';
import 'package:flutter/material.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyMediumBlueA700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueA700,
      );
  static get bodyMediumWhiteA700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodySmall12 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 12.fSize,
      );
  static get bodySmall8 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 8.fSize,
      );
  static get bodySmallBlueA70004 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueA70004,
        fontSize: 10.fSize,
      );
  static get bodySmallBlueA7000412 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueA70004,
        fontSize: 12.fSize,
      );
  static get bodySmallBluegray90001 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueGray90001,
        fontSize: 12.fSize,
      );
  static get bodySmallGray60001 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray60001,
        fontSize: 12.fSize,
      );
  static get bodySmallGray6000110 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray60001,
        fontSize: 10.fSize,
      );
  static get bodySmallGray60002 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray60002,
        fontSize: 12.fSize,
      );
  static get bodySmallGreen700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.green700,
        fontSize: 12.fSize,
      );
  static get bodySmallInterBlueA70002 =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: appTheme.blueA70002,
        fontSize: 10.fSize,
      );
  static get bodySmallInterWhiteA700 =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: appTheme.whiteA700,
        fontSize: 8.fSize,
      );
  static get bodySmallPrimary => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.2),
        fontSize: 10.fSize,
      );
  static get bodySmallRedA700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.redA700,
        fontSize: 12.fSize,
      );
  static get bodySmallWhiteA700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 8.fSize,
      );
  static get bodySmallWhiteA70010 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 10.fSize,
      );
  static get bodySmallWhiteA70012 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 12.fSize,
      );
  // Headline text style
  static get headlineLargePrimary => theme.textTheme.headlineLarge!.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
      );
  static get headlineLargePrimary_1 => theme.textTheme.headlineLarge!.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
      );
  static get headlineLargeWhiteA700 => theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.whiteA700,
      );
  // Label text style
  static get labelLargeBluegray90001 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.blueGray90001,
        fontSize: 13.fSize,
      );
  static get labelLargeBluegray90001_1 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.blueGray90001,
      );
  static get labelLargeInterBlueA70004 =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: appTheme.blueA70004,
      );
  static get labelLargeInterBlueA70004_1 =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: appTheme.blueA70004,
      );
  static get labelLargeInterBluegray90001 =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: appTheme.blueGray90001,
      );
  static get labelLargeInterBluegray90001SemiBold =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: appTheme.blueGray90001,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeInterBluegray90001_1 =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: appTheme.blueGray90001,
      );
  static get labelLargeInterGray500 =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: appTheme.gray500,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeInterPrimary =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
      );
  static get labelLargeInterPrimary_1 =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
      );
  static get labelLargePrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
      );
  static get labelMediumBluegray80001 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.blueGray80001,
      );
  static get labelMediumBluegray90001 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.blueGray90001,
      );
  static get labelMediumGray60001 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.gray60001,
      );
  static get labelMediumInter => theme.textTheme.labelMedium!.inter.copyWith(
        fontSize: 11.fSize,
        fontWeight: FontWeight.w600,
      );
  static get labelMediumPrimary => theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
      );
  static get labelSmallBlack900 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.black900,
      );
  static get labelSmallBluegray80001 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.blueGray80001,
        fontSize: 8.fSize,
      );
  static get labelSmallBluegray90001 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.blueGray90001,
        fontSize: 8.fSize,
      );
  static get labelSmallInter => theme.textTheme.labelSmall!.inter.copyWith(
        fontSize: 8.fSize,
      );
  static get labelSmallInterWhiteA700 =>
      theme.textTheme.labelSmall!.inter.copyWith(
        color: appTheme.whiteA700,
        fontSize: 8.fSize,
      );
  static get labelSmallWhiteA700 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 8.fSize,
      );
  static get labelSmallWhiteA700_1 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.whiteA700,
      );
  // Title text style
  static get titleMediumBluegray90001 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray90001,
      );
  static get titleMediumInterBlueA70003 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: appTheme.blueA70003,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleSmallBlueA70007 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueA70007,
      );
  static get titleSmallBluegray90001 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray90001,
      );
  static get titleSmallGray700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray700,
      );
  static get titleSmallSemiBold => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleSmallWhiteA700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
      );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}
