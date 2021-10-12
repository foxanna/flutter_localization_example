import 'package:flutter/widgets.dart';
import 'package:flutter_localization_example/localization/translations/translations.i69n.dart';
import 'package:flutter_localization_example/localization/translations/translations_fr.i69n.dart';
import 'package:flutter_localization_example/localization/translations/translations_uk.i69n.dart';

const _supportedLocales = ['en', 'fr', 'uk'];

class ExampleLocalizations {
  const ExampleLocalizations(this.translations);

  final Translations translations;

  static final _translations = <String, Translations Function()>{
    'en': () => const Translations(),
    'fr': () => const Translations_fr(),
    'uk': () => const Translations_uk(),
  };

  static const LocalizationsDelegate<ExampleLocalizations> delegate =
      _ExampleLocalizationsDelegate();

  static final List<Locale> supportedLocales =
      _supportedLocales.map((x) => Locale(x)).toList();

  static Future<ExampleLocalizations> load(Locale locale) =>
      Future.value(ExampleLocalizations(_translations[locale.languageCode]!()));

  static Translations of(BuildContext context) =>
      Localizations.of<ExampleLocalizations>(context, ExampleLocalizations)!
          .translations;
}

class _ExampleLocalizationsDelegate
    extends LocalizationsDelegate<ExampleLocalizations> {
  const _ExampleLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      _supportedLocales.contains(locale.languageCode);

  @override
  Future<ExampleLocalizations> load(Locale locale) =>
      ExampleLocalizations.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<ExampleLocalizations> old) => false;
}
