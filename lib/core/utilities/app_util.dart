import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:intl/intl.dart' as intl;
import '/core/utilities/extensions.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../router/router.dart' show systemOwnerRouterNavigatorState;
import '../models/extension_based_file_type.dart' show ExtensionBasedFileType;
import '../widgets/app_button.dart' show AppButton;
import '../widgets/custom_transition_page.dart'
    show FadePageTransitionPageBuilder;
import '../widgets/global_card.dart' show GlobalCard;
import '/core/utilities/constants.dart';
import '/core/utilities/custom_logger.dart';

import '../../generated/l10n.dart';
import 'color_util.dart';

class AppUtil {
  static const String ksaNumber = "966";
  static final RegExp phoneValidatorRegExp = RegExp(r"^05");
  static final RegExp passwordValidatorRegExp = RegExp(
    r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$",
  );
  static final RegExp emailValidatorRegExp = RegExp(
    r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$",
  );
  static final RegExp arabicNumberRegex = RegExp(r'[\u0660-\u0669]');
  static final RegExp arabicCharsRegex = RegExp(
    r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFDFF\uFE70-\uFEFF0-9٠-٩ ]',
  );
  static final RegExp englishUpperCharsOnlyRegex = RegExp(r'^[A-Z|]+$');
  static final RegExp englishCharsRegex = RegExp(r'[a-zA-Z0-9 ]');
  static final RegExp specialCharRegEx = RegExp(
    r'[\^$*.\[\]{}()?\-"!@#%&/\,><:;_~`+='
    "'"
    ']',
  );
  static final RegExp numRegEx = RegExp(r'^[0-9]+$');
  static final RegExp numWithDotRegEx = RegExp(r"^[.0-9]*$");
  static final RegExp englishArabicNumberRegex = RegExp(r'^[.0-9٠-٩]*$');
  static BorderRadius borderRadius0 = BorderRadius.circular(0);
  static BorderRadius borderRadius5 = BorderRadius.circular(5.0);
  static BorderRadius borderRadius8 = BorderRadius.circular(8.0);
  static BorderRadius borderRadius10 = BorderRadius.circular(10.0);
  static BorderRadius borderRadius15 = BorderRadius.circular(15.0);
  static BorderRadius borderRadius20 = BorderRadius.circular(20.0);
  static BorderRadius borderRadius25 = BorderRadius.circular(25.0);
  static BorderRadius borderRadius30 = BorderRadius.circular(30.0);
  static BorderRadius borderRadius35 = BorderRadius.circular(35.0);
  static BorderRadius borderRadiusInf = BorderRadius.circular(999.0);

  static const String englishFontFamily = "LamaSans";
  static const String arabicFontFamily = "LamaSans";
  static const String arabicBoldFontFamily = "LamaSans";
  static const Locale arabicLocale = Locale("ar", "SA");
  static const Locale englishLocale = Locale("en", "US");

  static const arToENNumbersMap = {
    '٠': '0',
    '١': '1',
    '٢': '2',
    '٣': '3',
    '٤': '4',
    '٥': '5',
    '٦': '6',
    '٧': '7',
    '٨': '8',
    '٩': '9',
  };

  static const enToARNumbersMap = {
    '0': '٠',
    '1': '١',
    '2': '٢',
    '3': '٣',
    '4': '٤',
    '5': '٥',
    '6': '٦',
    '7': '٧',
    '8': '٨',
    '9': '٩',
  };

  static const Map<String, String> arToENCharsMap = {
    "ا": "A",
    "ب": "B",
    "ح": "J",
    "د": "D",
    "ر": "R",
    "س": "S",
    "ص": "X",
    "ط": "T",
    "ع": "E",
    "ق": "G",
    "ك": "K",
    "ل": "L",
    "م": "Z",
    "ن": "N",
    "ه": "H",
    "و": "U",
    "ى": "V",
    "ي": "V",
  };

  static const Map<String, String> enToARCharsMap = {
    "A": "ا",
    "B": "ب",
    "J": "ح",
    "D": "د",
    "R": "ر",
    "S": "س",
    "X": "ص",
    "T": "ط",
    "E": "ع",
    "G": "ق",
    "K": "ك",
    "L": "ل",
    "Z": "م",
    "N": "ن",
    "H": "ه",
    "U": "و",
    "V": "ى",
  };

  static String get mainFontFamily =>
      isLtr ? englishFontFamily : arabicFontFamily;

  static String get boldFontFamily =>
      isLtr ? englishFontFamily : arabicBoldFontFamily;

  static FontWeight get boldFontWeight =>
      isLtr ? FontWeight.bold : FontWeight.w400;

  static bool get isLtr => !intl.Intl.getCurrentLocale().contains("ar");

  static Color generateRandomColor() {
    final random = math.Random.secure();

    return Color.fromARGB(
      255,
      random.nextInt(250),
      random.nextInt(250),
      random.nextInt(250),
    );
  }

  static Color getColorFromString(String hexColor) =>
      Color(int.parse('0xff${hexColor.replaceAll("#", "")}'));

  static String getHexStringFromColor(Color color) =>
      '#${color.toARGB32().toRadixString(16).padLeft(8, '0').substring(2)}';

  static OutlineInputBorder outLineInputBorder({
    Color? color,
    BorderRadius? borderRadius,
  }) => OutlineInputBorder(
    borderRadius: borderRadius ?? borderRadius15,
    borderSide: BorderSide(color: color ?? Colors.transparent, width: 1.0),
  );

  static OutlineInputBorder errorOutLineInputBorder(
    BuildContext context, {
    BorderRadius? borderRadius,
  }) => OutlineInputBorder(
    borderRadius: borderRadius ?? borderRadius15,
    borderSide: BorderSide(
      color: Theme.of(context).colorScheme.error,
      width: 1.0,
    ),
  );

  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    primaryColor: ColorUtil.primaryColor,
    fontFamily: mainFontFamily,
    scaffoldBackgroundColor: ColorUtil.whiteScaffold,
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    hintColor: ColorUtil.greyColor,
    cardColor: ColorUtil.lightGreyColor,
    dividerColor: ColorUtil.greyColor,
    splashColor: ColorUtil.greyColor,
    canvasColor: ColorUtil.blackColor,
    unselectedWidgetColor: ColorUtil.greyColor,
    checkboxTheme: CheckboxThemeData(
      checkColor: const WidgetStatePropertyAll<Color>(Colors.white),
      fillColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected)) {
          return ColorUtil.primaryColor;
        }

        return Colors.transparent;
      }),
      shape: ContinuousRectangleBorder(borderRadius: AppUtil.borderRadius8),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: ColorUtil.darkBlueColor,
      textTheme: ButtonTextTheme.primary,
      padding: EdgeInsets.symmetric(vertical: 50.0),
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: ColorUtil.whiteScaffold,
      shape: RoundedRectangleBorder(borderRadius: borderRadius0),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: ColorUtil.whiteScaffold,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorUtil.lightGreyColor,
      iconTheme: IconThemeData(color: ColorUtil.blackColor),
    ),
    iconTheme: const IconThemeData(
      color: ColorUtil.blackColor,
      size: kIconSize,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStateProperty.all<Color>(ColorUtil.blackColor),
        iconSize: WidgetStateProperty.all<double>(kIconSize),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorUtil.whiteScaffold,
      elevation: 10.0,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorUtil.blackColor,
    ),
    tabBarTheme: const TabBarThemeData(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: ColorUtil.whiteColor),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      elevation: 10.0,
      backgroundColor: ColorUtil.darkBlueColor,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(color: ColorUtil.accentColor),
    pageTransitionsTheme: PageTransitionsTheme(
      builders: Map<TargetPlatform, PageTransitionsBuilder>.fromIterable(
        TargetPlatform.values,
        value: (dynamic _) => FadePageTransitionPageBuilder(),
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      headerBackgroundColor: ColorUtil.primaryColor,
      headerForegroundColor: Colors.white,
      shape: ContinuousRectangleBorder(borderRadius: borderRadius10),
      rangePickerShape: ContinuousRectangleBorder(borderRadius: borderRadius10),
      elevation: 10.0,
      rangePickerElevation: 10.0,
    ),
    timePickerTheme: TimePickerThemeData(
      shape: ContinuousRectangleBorder(borderRadius: borderRadius10),
      elevation: 10.0,
    ),
    dialogTheme: DialogThemeData(
      shape: ContinuousRectangleBorder(borderRadius: borderRadius10),
      elevation: 10.0,
      backgroundColor: ColorUtil.whiteScaffold,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle().copyWith(
          color: ColorUtil.blackColor,
          fontSize: 16.0,
          fontWeight: boldFontWeight,
          fontFamily: mainFontFamily,
        ),
      ),
    ),
  );

  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    primaryColor: ColorUtil.primaryColor,
    scaffoldBackgroundColor: ColorUtil.darkScaffold,
    brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: mainFontFamily,
    hintColor: ColorUtil.greyColor,
    cardColor: ColorUtil.mediumDarkScaffold,
    dividerColor: ColorUtil.greyColor,
    splashColor: ColorUtil.greyColor,
    unselectedWidgetColor: ColorUtil.greyColor,
    checkboxTheme: CheckboxThemeData(
      checkColor: const WidgetStatePropertyAll<Color>(Colors.white),
      fillColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected)) {
          return ColorUtil.primaryColor;
        }

        return Colors.transparent;
      }),
      shape: ContinuousRectangleBorder(borderRadius: AppUtil.borderRadius8),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorUtil.whiteColor,
    ),
    tabBarTheme: const TabBarThemeData(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: ColorUtil.blackColor),
      ),
    ),
    canvasColor: ColorUtil.whiteColor,
    drawerTheme: DrawerThemeData(
      backgroundColor: ColorUtil.darkScaffold,
      shape: RoundedRectangleBorder(borderRadius: borderRadius0),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: ColorUtil.lightDarkScaffold,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorUtil.lightDarkScaffold,
      iconTheme: const IconThemeData(color: ColorUtil.whiteColor),
    ),
    iconTheme: const IconThemeData(
      color: ColorUtil.whiteColor,
      size: kIconSize,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStateProperty.all<Color>(ColorUtil.whiteColor),
        iconSize: WidgetStateProperty.all<double>(kIconSize),
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: ColorUtil.redColor,
      textTheme: ButtonTextTheme.primary,
      padding: EdgeInsets.symmetric(vertical: 50.0),
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: ColorUtil.lightDarkScaffold),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      elevation: 10.0,
      backgroundColor: ColorUtil.redColor,
    ),
    pageTransitionsTheme: PageTransitionsTheme(
      builders: Map<TargetPlatform, PageTransitionsBuilder>.fromIterable(
        TargetPlatform.values,
        value: (dynamic _) => FadePageTransitionPageBuilder(),
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      headerBackgroundColor: ColorUtil.primaryColor,
      headerForegroundColor: Colors.white,
      shape: ContinuousRectangleBorder(borderRadius: borderRadius10),
      rangePickerShape: ContinuousRectangleBorder(borderRadius: borderRadius10),
      elevation: 10.0,
      rangePickerElevation: 10.0,
    ),
    timePickerTheme: TimePickerThemeData(
      shape: ContinuousRectangleBorder(borderRadius: borderRadius10),
      elevation: 10.0,
    ),
    dialogTheme: DialogThemeData(
      shape: ContinuousRectangleBorder(borderRadius: borderRadius10),
      elevation: 10.0,
      backgroundColor: ColorUtil.darkScaffold,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle().copyWith(
          color: ColorUtil.whiteColor,
          fontSize: 16.0,
          fontWeight: boldFontWeight,
          fontFamily: mainFontFamily,
        ),
      ),
    ),
  );

  static String getArabicNumbers(String input) {
    StringBuffer arabicNumbers = StringBuffer();
    for (int i = 0; i < input.length; i++) {
      if (!arabicNumberRegex.hasMatch(input.substring(i, i + 1))) {
        arabicNumbers.write(enToARNumbersMap[input.substring(i, i + 1)]);
      } else {
        arabicNumbers.write(input.substring(i, i + 1));
      }
    }
    return arabicNumbers.toString().replaceAll("null", "");
  }

  static String getEnglishNumbers(String input) {
    StringBuffer englishNumbers = StringBuffer();
    for (int i = 0; i < input.length; i++) {
      if (arabicNumberRegex.hasMatch(input.substring(i, i + 1))) {
        englishNumbers.write(arToENNumbersMap[input.substring(i, i + 1)]);
      } else {
        englishNumbers.write(input.substring(i, i + 1));
      }
    }
    return englishNumbers.toString().replaceAll("null", "");
  }

  static String getEnglishChars(String input) {
    StringBuffer englishChars = StringBuffer();
    for (int i = 0; i < input.length; i++) {
      final char = input.substring(i, i + 1);

      if (!englishUpperCharsOnlyRegex.hasMatch(input.substring(i, i + 1))) {
        if (arToENCharsMap.entries.any(
          (element) => element.key == char.toUpperCase(),
        )) {
          final oldChars = englishChars.toString();
          englishChars.clear();
          englishChars.write(arToENCharsMap[char]);
          englishChars.write(oldChars);
        }
      } else {
        englishChars.write(char);
      }
    }
    return englishChars.toString().replaceAll("null", "");
  }

  static String getArabicChars(String input) {
    StringBuffer arabicChars = StringBuffer();
    for (int i = 0; i < input.length; i++) {
      final char = input.substring(i, i + 1);
      if (englishCharsRegex.hasMatch(char) ||
          englishUpperCharsOnlyRegex.hasMatch(char)) {
        if (enToARCharsMap.entries.any(
          (element) => element.key == char.toUpperCase(),
        )) {
          final oldChars = arabicChars.toString();
          arabicChars.clear();
          arabicChars.write(enToARCharsMap[char.toUpperCase()]);
          arabicChars.write(oldChars);
        }
      } else {
        arabicChars.write(char);
      }
    }
    return arabicChars.toString().replaceAll("null", "");
  }

  static Future<void> openUrl(
    Uri url, {
    LaunchMode mode = LaunchMode.platformDefault,
    Map<String, String> headers = const {},
  }) async {
    if (!(await canLaunchUrl(url))) {
      CustomLogger.instance.error("Could not launch $url");
      return;
    }

    try {
      await launchUrl(
        url,
        mode: mode,
        webViewConfiguration: WebViewConfiguration(headers: headers),
      );
    } catch (e) {
      CustomLogger.instance.error("Could not launch $url, error:$e.");
    }
  }

  static Future<bool?> showAlertDialog(
    BuildContext context, {
    required String confirmText,
    String? title,
    String? contentText,
    Function? onConfirm,
    Color? titleColor,
    bool enableCancel = false,
    Widget Function(BuildContext context)? builder,
  }) async {
    final theme = Theme.of(context);

    return showDialog<bool?>(
      context: context,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AlertDialog(
          shape: ContinuousRectangleBorder(borderRadius: AppUtil.borderRadius8),
          insetPadding: const EdgeInsets.symmetric(horizontal: 24.0),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 16.0,
          ),
          buttonPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          titlePadding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 16.0,
          ),
          title: Row(
            mainAxisAlignment: enableCancel
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              if (enableCancel)
                GlobalCard(
                  onTap: () => Navigator.pop(context),
                  color: Colors.transparent,
                  child: Icon(
                    CupertinoIcons.multiply_square,
                    color: theme.textSelectionTheme.cursorColor,
                    size: 26.0,
                  ),
                ),
              if (title != null)
                Text(
                  title,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: titleColor,
                  ),
                )
              else
                const Spacer(),
              if (enableCancel) 26.horizontalSpace,
            ],
          ),
          content: builder != null
              ? builder(context)
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    20.verticalSpace,
                    if (contentText != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          contentText,
                          style: theme.textTheme.headlineMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    30.verticalSpace,
                    AppButton(
                      context,
                      shrink: true,
                      title: confirmText,
                      onTap: () {
                        Navigator.pop(context, true);

                        if (onConfirm != null) {
                          onConfirm.call();
                        }
                      },
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  static Future<void> showAlertToast({
    String? title,
    required String content,
    bool isError = false,
    Color? backgroundColor,
    Duration duration = const Duration(seconds: 5),
    IconData? icon,
    Function()? onTap,
  }) async {
    if (content.isEmpty) return;
    final appContext = systemOwnerRouterNavigatorState.context;
    final theme = Theme.of(appContext);

    try {
      showToastWidget(
        GlobalCard(
          onTap: () {
            if (onTap == null) return;

            onTap.call();
            ToastManager().dismissAll(showAnim: false);
          },
          elevation: 0.0,
          color:
              backgroundColor ??
              (isError
                  ? theme.colorScheme.errorContainer
                  : ColorUtil.hyperLink),
          borderRadius: kCircularBorderRadius,
          margin: const EdgeInsets.all(20.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 12.0,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon ?? Icons.info_outline_rounded,
                  size: kIconSize,
                  color: isError ? Colors.white : theme.primaryColor,
                ),
                12.horizontalSpace,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isError || title != null) ...[
                      Text(
                        isError ? S.current.alert : title!,
                        style: theme.textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          letterSpacing: 0.35,
                        ),
                      ),
                      3.verticalSpace,
                    ],
                    Text(
                      content,
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        isIgnoring: false,
        context: appContext,
        duration: duration,
        dismissOtherToast: false,
        position: StyledToastPosition(
          align: isLtr ? Alignment.bottomRight : Alignment.bottomLeft,
          offset: 45.0,
        ),
      );
    } catch (e) {
      CustomLogger.instance.error("Error opening toast :$e");
    }
  }

  static ExtensionBasedFileType getFileType(String path) {
    final format = path.toLowerCase().split(".").last;

    if (format == "pdf") {
      return ExtensionBasedFileType.pdf;
    } else if (videoExtensions.contains(format)) {
      return ExtensionBasedFileType.video;
    } else if (audioExtensions.contains(format)) {
      return ExtensionBasedFileType.audio;
    } else if (imageExtensions.contains(format)) {
      return ExtensionBasedFileType.image;
    } else {
      return ExtensionBasedFileType.other;
    }
  }

  static String replaceArabicNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(farsi[i], english[i]);
    }
    return input;
  }

  static String addLineBreaks({required String text, int charsLength = 70}) {
    final buffer = StringBuffer();
    for (var i = 0; i < text.length; i += charsLength) {
      buffer.write(text.substring(i, math.min(i + charsLength, text.length)));
      if (i + charsLength < text.length) {
        buffer.writeln();
      }
    }
    return buffer.toString();
  }

  static String actualFormatDuration(DateTime start, DateTime end) {
    final duration = end.difference(start);
    final days = (duration.inDays).toString().padLeft(2, "0");
    final hours = (duration.inHours % 24).toString().padLeft(2, "0");
    return '$days${S.current.d}:$hours${S.current.h}';
  }

  static String actualFullFormatDuration(DateTime start, DateTime end) {
    final duration = end.difference(start);
    final days = duration.inDays.toString().padLeft(2, "0");
    final hours = (duration.inHours % 24).toString().padLeft(2, "0");
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, "0");
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, "0");
    return '$days${S.current.d}:$hours${S.current.h}:$minutes${S.current.m}:$seconds${S.current.s}';
  }

  static String workingFormatDuration(
    DateTime startDate,
    DateTime endDate,
    bool isFullFormat,
  ) {
    int workingSeconds = 0;

    while (startDate.isBefore(endDate)) {
      if (startDate.weekday != DateTime.friday) {
        final workStart = DateTime(
          startDate.year,
          startDate.month,
          startDate.day,
          8,
          0,
          0,
        );
        final workEnd = DateTime(
          startDate.year,
          startDate.month,
          startDate.day,
          20,
          0,
          0,
        );

        if (startDate.isBefore(workStart)) {
          startDate = workStart;
        }
        if (startDate.isBefore(workEnd) && startDate.isBefore(endDate)) {
          final effectiveEnd = endDate.isBefore(workEnd) ? endDate : workEnd;
          workingSeconds += effectiveEnd.difference(startDate).inSeconds;
        }
      }
      startDate = DateTime(
        startDate.year,
        startDate.month,
        startDate.day,
      ).add(const Duration(days: 1, hours: 8));
    }
    return _formatWorkingDuration(workingSeconds, isFullFormat);
  }

  static String _formatWorkingDuration(int durationSeconds, bool isFullFormat) {
    const int workingDaySeconds = 12 * 60 * 60; // 12 hours in seconds
    final days = (durationSeconds ~/ workingDaySeconds).toString().padLeft(
      2,
      "0",
    );
    final hours = ((durationSeconds % workingDaySeconds) ~/ 3600)
        .toString()
        .padLeft(2, "0"); // 1 hour = 3600 seconds
    final minutes = ((durationSeconds % 3600) ~/ 60).toString().padLeft(2, "0");
    final seconds = (durationSeconds % 60).toString().padLeft(2, "0");

    if (isFullFormat) {
      return '$days${S.current.d}:$hours${S.current.h}:$minutes${S.current.m}:$seconds${S.current.s}';
    }

    return '$days${S.current.d}:$hours${S.current.h}';
  }
}
