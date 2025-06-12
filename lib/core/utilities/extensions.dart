import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:intl/intl.dart';

import 'app_util.dart';

extension ContextExt on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);

  double get screenWidth => screenSize.width;

  double get webConstraints => 1600;

  double get screenHeight =>
      screenSize.height - MediaQuery.paddingOf(this).bottom;

  bool get isTablet => screenWidth >= 500 && screenWidth < 1200;

  bool get isWebOrDesktop => screenWidth >= 1200;

  bool get isSmallWebOrDesktop => screenWidth >= 1200 && screenWidth < 1500;

  bool get isMobile => screenWidth < 500;

  ThemeData get currentTheme => Theme.of(this);

  ColorScheme get colorScheme => currentTheme.colorScheme;

  TextTheme get textTheme => currentTheme.textTheme;

  bool get isDarkTheme => currentTheme.brightness == Brightness.dark;

  bool get isArabicLocalization =>
      Localizations.localeOf(this).languageCode == "ar";

  double get platformBasedWidth => isMobile ? screenWidth : 230.0;

  double get maxWidthBasedOnScreenWidth =>
      screenWidth > 1500 ? 1500 : screenWidth * 0.95;
}

extension StringExt on String {
  String get spacedChars {
    final isArabicNumbers = AppUtil.arabicNumberRegex.hasMatch(this);
    final chars = split('');

    return isArabicNumbers ? chars.reversed.join(' ') : chars.join(' ');
  }

  bool get isArabic => AppUtil.arabicCharsRegex.hasMatch(this);

  bool get isEnglish => AppUtil.englishCharsRegex.hasMatch(this);
}

extension NumEXT on num {
  Widget get verticalSpace => SizedBox(height: toDouble());

  Widget get horizontalSpace => SizedBox(width: toDouble());

  Radius get circularRadius => Radius.circular(toDouble());

  BorderRadius get circularBorderRadius => BorderRadius.circular(toDouble());

  EdgeInsets get horizontalPadding =>
      EdgeInsets.symmetric(horizontal: toDouble());

  EdgeInsets get verticalPadding => EdgeInsets.symmetric(vertical: toDouble());

  EdgeInsets get allPadding => EdgeInsets.all(toDouble());

  num get pureAmount {
    if (this is double) {
      if (this % 1 > 0) {
        return roundUpToDecimalPlaces(2);
      }

      return toInt();
    }

    return this;
  }

  String get currency => NumberFormat.currency(
    locale: 'en-US',
    customPattern: '#,##0.00',
  ).format(pureAmount);

  String get compact => NumberFormat.compact(
    locale: 'en-US',
    explicitSign: toString().length > 3,
  ).format(this);

  String get compactWithOutSig =>
      NumberFormat.compact(locale: 'en-US', explicitSign: false).format(this);

  double roundUpToDecimalPlaces(int decimalPlaces) {
    final multiplier = math.pow(10, decimalPlaces);
    return (this * multiplier).ceil() / multiplier;
  }
}

extension WidgetEXT on Widget {
  Widget horizontalPadding(double padding) => Padding(
    padding: EdgeInsets.symmetric(horizontal: padding),
    child: this,
  );

  Widget verticalPadding(double padding) => Padding(
    padding: EdgeInsets.symmetric(vertical: padding),
    child: this,
  );

  Widget allPadding(double padding) =>
      Padding(padding: EdgeInsets.all(padding), child: this);

  Widget directionalPadding({
    double top = 0.0,
    double start = 0.0,
    double end = 0.0,
    double bottom = 0.0,
  }) => Padding(
    padding: EdgeInsetsDirectional.only(
      top: top,
      bottom: bottom,
      start: start,
      end: end,
    ),
    child: this,
  );

  Widget center() => Center(child: this);

  Widget align(AlignmentDirectional alignment) =>
      Align(alignment: alignment, child: this);
}

extension DateTimeExt on DateTime {
  String toFormattedDate({
    Locale locale = AppUtil.englishLocale,
    String? format,
  }) =>
      intl.DateFormat(format ?? 'EEE. dd MMM.', locale.toString()).format(this);

  String toNumbersFormat({Locale locale = AppUtil.englishLocale}) =>
      intl.DateFormat('yyyy-MM-dd', locale.toString()).format(this);

  String toNumbersFormatWithSlash({Locale locale = AppUtil.englishLocale}) =>
      intl.DateFormat('yyyy/MM/dd', locale.toString()).format(this);

  String toTimeStamp({Locale locale = AppUtil.englishLocale}) =>
      intl.DateFormat('dd/MM/yyyy hh:mm a', locale.toString()).format(this);

  String toTimeOnly({Locale locale = AppUtil.englishLocale}) =>
      intl.DateFormat.Hm(locale).format(this);

  String toTimeWithAmPmFormat({Locale locale = AppUtil.englishLocale}) {
    // if (!locale.languageCode.contains('ar')) {
    //   return intl.DateFormat.jm(locale.toString()).format(this);
    // } else {
    //   return toEnglishTimeWithArabicAmPmFormat();
    // }

    return intl.DateFormat.jm(locale.toString()).format(this);
  }

  String toEnglishTimeWithArabicAmPmFormat() => intl.DateFormat.jm(
    'en_US',
  ).format(this).replaceAll("PM", "م").replaceAll("AM", "ص");

  String toDateTimeWithAmPmFormat({
    Locale timeLocale = AppUtil.englishLocale,
    Locale dateLocale = AppUtil.englishLocale,
    bool ignoreHours = false,
  }) {
    final stringBuffer = StringBuffer('');
    final now = DateTime.now();
    final differenceInDays = difference(now).inDays;

    if (differenceInDays == 0) {
      stringBuffer.write(toTimeWithAmPmFormat(locale: timeLocale));
    } else {
      switch (differenceInDays) {
        case 0:
          stringBuffer.write(toTimeWithAmPmFormat(locale: timeLocale));
          break;
        case 1:
          stringBuffer.write(AppUtil.isLtr ? "Tomorrow" : "غداً");
          break;
        case -1:
          stringBuffer.write(AppUtil.isLtr ? "Yesterday" : "الأمس");
          break;
        case -2:
          stringBuffer.write(AppUtil.isLtr ? "Since two days" : "منذ يومين");
          break;
        case < -2 || > 1 || _:
          stringBuffer.write(toNumbersFormat(locale: dateLocale));
          break;
      }

      if (!ignoreHours) {
        stringBuffer.writeAll(['  ', toTimeWithAmPmFormat(locale: timeLocale)]);
      }
    }

    return stringBuffer.toString();
  }
}

extension WigdetListExt on List<Widget> {
  List<Widget> separateWithSpace({
    required double space,
    Axis axisDirection = Axis.vertical,
  }) {
    if (length <= 1) return this;

    final gap = axisDirection == Axis.vertical
        ? space.verticalSpace
        : space.horizontalSpace;

    return sublist(1).fold(
      [first],
      (previousWidgets, currentWidget) => [
        ...previousWidgets,
        gap,
        currentWidget,
      ],
    );
  }

  List<Widget> separateWithWidget({
    required Widget widget,
    Axis axisDirection = Axis.vertical,
  }) {
    if (length <= 1) return this;

    return sublist(1).fold(
      [first],
      (previousWidgets, currentWidget) => [
        ...previousWidgets,
        widget,
        currentWidget,
      ],
    );
  }
}
