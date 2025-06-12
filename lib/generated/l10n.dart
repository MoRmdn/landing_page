// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `d`
  String get d {
    return Intl.message('d', name: 'd', desc: '', args: []);
  }

  /// `day`
  String get day {
    return Intl.message('day', name: 'day', desc: '', args: []);
  }

  /// `h`
  String get h {
    return Intl.message('h', name: 'h', desc: '', args: []);
  }

  /// `hour`
  String get hour {
    return Intl.message('hour', name: 'hour', desc: '', args: []);
  }

  /// `m`
  String get m {
    return Intl.message('m', name: 'm', desc: '', args: []);
  }

  /// `minute`
  String get minute {
    return Intl.message('minute', name: 'minute', desc: '', args: []);
  }

  /// `s`
  String get s {
    return Intl.message('s', name: 's', desc: '', args: []);
  }

  /// `second`
  String get second {
    return Intl.message('second', name: 'second', desc: '', args: []);
  }

  /// `Choose from gallery`
  String get chooseFromGallery {
    return Intl.message(
      'Choose from gallery',
      name: 'chooseFromGallery',
      desc: '',
      args: [],
    );
  }

  /// `Record video`
  String get recordVideo {
    return Intl.message(
      'Record video',
      name: 'recordVideo',
      desc: '',
      args: [],
    );
  }

  /// `Record audio`
  String get recordAudio {
    return Intl.message(
      'Record audio',
      name: 'recordAudio',
      desc: '',
      args: [],
    );
  }

  /// `Record photo`
  String get recordPhoto {
    return Intl.message(
      'Record photo',
      name: 'recordPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Record document`
  String get recordDocument {
    return Intl.message(
      'Record document',
      name: 'recordDocument',
      desc: '',
      args: [],
    );
  }

  /// `Record location`
  String get recordLocation {
    return Intl.message(
      'Record location',
      name: 'recordLocation',
      desc: '',
      args: [],
    );
  }

  /// `Record contact`
  String get recordContact {
    return Intl.message(
      'Record contact',
      name: 'recordContact',
      desc: '',
      args: [],
    );
  }

  /// `Record event`
  String get recordEvent {
    return Intl.message(
      'Record event',
      name: 'recordEvent',
      desc: '',
      args: [],
    );
  }

  /// `Record note`
  String get recordNote {
    return Intl.message('Record note', name: 'recordNote', desc: '', args: []);
  }

  /// `Take photo`
  String get takePhoto {
    return Intl.message('Take photo', name: 'takePhoto', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Select`
  String get select {
    return Intl.message('Select', name: 'select', desc: '', args: []);
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Share`
  String get share {
    return Intl.message('Share', name: 'share', desc: '', args: []);
  }

  /// `Copy`
  String get copy {
    return Intl.message('Copy', name: 'copy', desc: '', args: []);
  }

  /// `Paste`
  String get paste {
    return Intl.message('Paste', name: 'paste', desc: '', args: []);
  }

  /// `Page not found`
  String get pageNotFoundMsg {
    return Intl.message(
      'Page not found',
      name: 'pageNotFoundMsg',
      desc: '',
      args: [],
    );
  }

  /// `Page not found`
  String get pageNotFound {
    return Intl.message(
      'Page not found',
      name: 'pageNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Show more`
  String get showMore {
    return Intl.message('Show more', name: 'showMore', desc: '', args: []);
  }

  /// `Show less`
  String get showLess {
    return Intl.message('Show less', name: 'showLess', desc: '', args: []);
  }

  /// `Alert`
  String get alert {
    return Intl.message('Alert', name: 'alert', desc: '', args: []);
  }

  /// `OK`
  String get ok {
    return Intl.message('OK', name: 'ok', desc: '', args: []);
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Warning`
  String get warning {
    return Intl.message('Warning', name: 'warning', desc: '', args: []);
  }

  /// `Info`
  String get info {
    return Intl.message('Info', name: 'info', desc: '', args: []);
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `Bad request`
  String get badRequestException {
    return Intl.message(
      'Bad request',
      name: 'badRequestException',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorized`
  String get unAuthorized {
    return Intl.message(
      'Unauthorized',
      name: 'unAuthorized',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get unKnown {
    return Intl.message('Unknown', name: 'unKnown', desc: '', args: []);
  }

  /// `Cancel`
  String get cancelException {
    return Intl.message('Cancel', name: 'cancelException', desc: '', args: []);
  }

  /// `Cache`
  String get cacheException {
    return Intl.message('Cache', name: 'cacheException', desc: '', args: []);
  }

  /// `Data not completed`
  String get dataNotCompleted {
    return Intl.message(
      'Data not completed',
      name: 'dataNotCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Format`
  String get formatException {
    return Intl.message('Format', name: 'formatException', desc: '', args: []);
  }

  /// `Socket`
  String get socketException {
    return Intl.message('Socket', name: 'socketException', desc: '', args: []);
  }

  /// `HTTP`
  String get httpException {
    return Intl.message('HTTP', name: 'httpException', desc: '', args: []);
  }

  /// `No connection`
  String get noConnection {
    return Intl.message(
      'No connection',
      name: 'noConnection',
      desc: '',
      args: [],
    );
  }

  /// `No internet`
  String get noInternet {
    return Intl.message('No internet', name: 'noInternet', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
