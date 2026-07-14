import 'package:flutter/widgets.dart';
import 'package:glider/l10n/gen/app_localizations.dart';

extension AppLocalizationsExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
