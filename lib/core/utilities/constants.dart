import 'package:flutter/cupertino.dart';
import '/core/utilities/extensions.dart';

const kAnimationDuration = Duration(milliseconds: 500);
const kAppBarHeight = 60.0;

const double kIconSize = 24.0;
const double kRadiusValue = 16.0;
Radius kRadius = kRadiusValue.circularRadius;
BorderRadius kCircularBorderRadius = kRadiusValue.circularBorderRadius;

BorderRadius kCircularBorderRadiusAddedPadding(double paddingValue) =>
    BorderRadius.circular(kRadiusValue + paddingValue);

BorderRadius kCircularBorderRadiusMinusPadding(double paddingValue) =>
    BorderRadius.circular((kRadiusValue - paddingValue).abs());

const EdgeInsets kPadding = EdgeInsets.all(8.0);
const EdgeInsets kShrinkButtonPadding = EdgeInsets.all(20.0);
const EdgeInsets kVerticalPadding = EdgeInsets.symmetric(vertical: 12.0);
const EdgeInsets kHorizontalPadding = EdgeInsets.symmetric(horizontal: 16.0);

const List<String> docExtensions = [
  "pdf",
  "doc",
  "docx",
  "xls",
  "xlsx",
  "ppt",
  "pptx",
  "txt",
  "csv",
];

const List<String> videoExtensions = [
  "mp4",
  "mov",
  "wmv",
  "avi",
  "mpeg",
  "webm",
  "mkv",
  "flv",
  "f4v",
  "swf",
  "avchd",
  "3gp",
  "aac",
  "amr",
  "mid",
];

const List<String> audioExtensions = [
  "m4a",
  "flac",
  "alac",
  "aiff",
  "ogg",
  "hls",
  "mp3",
  "wav",
  "wma",
  "aac",
  "amr",
];

const List<String> imageExtensions = [
  'jpg',
  'jpeg',
  'png',
  "tiff",
  "tif",
  "gif",
  "webp",
  "bmp",
  "svg",
  "heic",
  "heif",
  "raw",
];

const List<String> allSafeFileExtensions = [
  ...imageExtensions,
  ...docExtensions,
  ...videoExtensions,
  ...audioExtensions,
];

const List<String> harmfulFileExtensions = [
  "exe",
  "msi",
  "bat",
  "cmd",
  "sh",
  "bin",
  "run",
  "com",
  "jar",
  "php",
  "asp",
  "aspx",
  "jsp",
  "py",
  "pl",
  "rb",
  "cgi",
  "sql",
  "js",
  "vb",
  "cs",
  "java",
  "ts",
  "html",
  "htm",
  "xhtml",
  "xml",
  "json",
  "css",
  "zip",
  "rar",
  "7z",
  "tar",
  "gz",
  "iso",
  "dll",
  "sys",
  "ini",
  "dat",
  "reg",
  "scr",
];
