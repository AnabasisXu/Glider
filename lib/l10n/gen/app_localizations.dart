import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Glider'**
  String get appName;

  /// No description provided for @empty.
  ///
  /// In en, this message translates to:
  /// **'\"It\'s quiet... too quiet\'\"'**
  String get empty;

  /// No description provided for @failure.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get failure;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get confirm;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @whatsNew.
  ///
  /// In en, this message translates to:
  /// **'What\'s new'**
  String get whatsNew;

  /// No description provided for @whatsNewDescription.
  ///
  /// In en, this message translates to:
  /// **'> “It’s important to remember that when you start from scratch there is *absolutely no reason* to believe that you are going to do a better job than you did the first time.” — *Joel Spolsky*\n\nWelcome to the new Glider for Hacker News!\n\nDefying rationality, this update is the result of a *Thing You Should Never Do* [0]: rewriting the code from scratch. Accompanying this change is a UI overhaul, based on the Material 3 design system.\n\nLogin and registration is now deferred to the Hacker News website for increased security and reliability. This unfortunately necessitates logging in again, once.\n\nOverall, most users should feel at home quickly, although not every feature survived the metamorphosis, for varying reasons. Please provide feature requests and bug reports through the issue tracker [1].\n---\n[0]: https://www.joelonsoftware.com/2000/04/06/things-you-should-never-do-part-i/\n\n[1]: https://github.com/Mosc/Glider/issues'**
  String get whatsNewDescription;

  /// No description provided for @explore.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get explore;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @themeMode.
  ///
  /// In en, this message translates to:
  /// **'Theme mode'**
  String get themeMode;

  /// No description provided for @dynamicTheme.
  ///
  /// In en, this message translates to:
  /// **'Dynamic theme'**
  String get dynamicTheme;

  /// No description provided for @dynamicThemeDescription.
  ///
  /// In en, this message translates to:
  /// **'Uses system color scheme'**
  String get dynamicThemeDescription;

  /// No description provided for @themeColor.
  ///
  /// In en, this message translates to:
  /// **'Theme color'**
  String get themeColor;

  /// No description provided for @themeVariant.
  ///
  /// In en, this message translates to:
  /// **'Theme variant'**
  String get themeVariant;

  /// No description provided for @pureBackground.
  ///
  /// In en, this message translates to:
  /// **'Pure background'**
  String get pureBackground;

  /// No description provided for @pureBackgroundDescription.
  ///
  /// In en, this message translates to:
  /// **'White on light theme, black on dark theme'**
  String get pureBackgroundDescription;

  /// No description provided for @font.
  ///
  /// In en, this message translates to:
  /// **'Font'**
  String get font;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @storyLines.
  ///
  /// In en, this message translates to:
  /// **'Story lines'**
  String get storyLines;

  /// No description provided for @variable.
  ///
  /// In en, this message translates to:
  /// **'Variable'**
  String get variable;

  /// No description provided for @largeStoryStyle.
  ///
  /// In en, this message translates to:
  /// **'Large stories'**
  String get largeStoryStyle;

  /// No description provided for @largeStoryStyleDescription.
  ///
  /// In en, this message translates to:
  /// **'Shows URL, larger title, larger favicon'**
  String get largeStoryStyleDescription;

  /// No description provided for @favicons.
  ///
  /// In en, this message translates to:
  /// **'Story favicons'**
  String get favicons;

  /// No description provided for @storyMetadata.
  ///
  /// In en, this message translates to:
  /// **'Story metadata'**
  String get storyMetadata;

  /// No description provided for @storyMetadataDescription.
  ///
  /// In en, this message translates to:
  /// **'Always shows on some pages'**
  String get storyMetadataDescription;

  /// No description provided for @actionButtons.
  ///
  /// In en, this message translates to:
  /// **'Action buttons'**
  String get actionButtons;

  /// No description provided for @actionButtonsDescription.
  ///
  /// In en, this message translates to:
  /// **'Makes some metadata interactive'**
  String get actionButtonsDescription;

  /// No description provided for @userAvatars.
  ///
  /// In en, this message translates to:
  /// **'User avatars'**
  String get userAvatars;

  /// No description provided for @behavior.
  ///
  /// In en, this message translates to:
  /// **'Behavior'**
  String get behavior;

  /// No description provided for @showJobs.
  ///
  /// In en, this message translates to:
  /// **'Show job stories'**
  String get showJobs;

  /// No description provided for @showJobsDescription.
  ///
  /// In en, this message translates to:
  /// **'Also shows jobs in dropdown menu'**
  String get showJobsDescription;

  /// No description provided for @threadNavigation.
  ///
  /// In en, this message translates to:
  /// **'Thread navigation'**
  String get threadNavigation;

  /// No description provided for @threadNavigationDescription.
  ///
  /// In en, this message translates to:
  /// **'Allows jumps between top-level comments'**
  String get threadNavigationDescription;

  /// No description provided for @downvoting.
  ///
  /// In en, this message translates to:
  /// **'Downvoting'**
  String get downvoting;

  /// No description provided for @downvotingDescription.
  ///
  /// In en, this message translates to:
  /// **'Requires an account with 501+ karma'**
  String get downvotingDescription;

  /// No description provided for @inAppBrowser.
  ///
  /// In en, this message translates to:
  /// **'Custom tabs'**
  String get inAppBrowser;

  /// No description provided for @inAppBrowserDescription.
  ///
  /// In en, this message translates to:
  /// **'Opens links in in-app browser if possible'**
  String get inAppBrowserDescription;

  /// No description provided for @navigationDrawer.
  ///
  /// In en, this message translates to:
  /// **'Navigation drawer'**
  String get navigationDrawer;

  /// No description provided for @navigationDrawerDescription.
  ///
  /// In en, this message translates to:
  /// **'Replaces navigation bar or rail'**
  String get navigationDrawerDescription;

  /// No description provided for @filters.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get filters;

  /// No description provided for @filtersDescription.
  ///
  /// In en, this message translates to:
  /// **'Hides stories based on words or domains'**
  String get filtersDescription;

  /// No description provided for @words.
  ///
  /// In en, this message translates to:
  /// **'Words'**
  String get words;

  /// No description provided for @wordsHint.
  ///
  /// In en, this message translates to:
  /// **'foobar'**
  String get wordsHint;

  /// No description provided for @domains.
  ///
  /// In en, this message translates to:
  /// **'Domains'**
  String get domains;

  /// No description provided for @domainsHelp.
  ///
  /// In en, this message translates to:
  /// **'example.com'**
  String get domainsHelp;

  /// No description provided for @data.
  ///
  /// In en, this message translates to:
  /// **'Data'**
  String get data;

  /// No description provided for @exportFavorites.
  ///
  /// In en, this message translates to:
  /// **'Export favorites'**
  String get exportFavorites;

  /// No description provided for @exportFavoritesDescription.
  ///
  /// In en, this message translates to:
  /// **'Shares favorites as TSV with titles, links and metadata'**
  String get exportFavoritesDescription;

  /// No description provided for @clearVisited.
  ///
  /// In en, this message translates to:
  /// **'Clear read statuses'**
  String get clearVisited;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @appVersion.
  ///
  /// In en, this message translates to:
  /// **'App version'**
  String get appVersion;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacyPolicy;

  /// No description provided for @privacyPolicyYc.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy (YC)'**
  String get privacyPolicyYc;

  /// No description provided for @license.
  ///
  /// In en, this message translates to:
  /// **'License'**
  String get license;

  /// No description provided for @sourceCode.
  ///
  /// In en, this message translates to:
  /// **'Source code'**
  String get sourceCode;

  /// No description provided for @issueTracker.
  ///
  /// In en, this message translates to:
  /// **'Issue tracker'**
  String get issueTracker;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get login;

  /// No description provided for @authDescription.
  ///
  /// In en, this message translates to:
  /// **'Log in on Hacker News below. The session cookie will be securely saved and used for requests that require authentication. This app will not have access to your password.'**
  String get authDescription;

  /// No description provided for @termsOfUseYc.
  ///
  /// In en, this message translates to:
  /// **'Terms of use (YC)'**
  String get termsOfUseYc;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logout;

  /// No description provided for @showMore.
  ///
  /// In en, this message translates to:
  /// **'Show more'**
  String get showMore;

  /// No description provided for @stories.
  ///
  /// In en, this message translates to:
  /// **'Frontpage'**
  String get stories;

  /// No description provided for @storyTypeTop.
  ///
  /// In en, this message translates to:
  /// **'Top stories'**
  String get storyTypeTop;

  /// No description provided for @storyTypeNew.
  ///
  /// In en, this message translates to:
  /// **'New stories'**
  String get storyTypeNew;

  /// No description provided for @storyTypeBest.
  ///
  /// In en, this message translates to:
  /// **'Best stories'**
  String get storyTypeBest;

  /// No description provided for @storyTypeAsk.
  ///
  /// In en, this message translates to:
  /// **'Ask HN'**
  String get storyTypeAsk;

  /// No description provided for @storyTypeShow.
  ///
  /// In en, this message translates to:
  /// **'Show HN'**
  String get storyTypeShow;

  /// No description provided for @storyTypeJob.
  ///
  /// In en, this message translates to:
  /// **'Jobs'**
  String get storyTypeJob;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @catchUp.
  ///
  /// In en, this message translates to:
  /// **'Catch up'**
  String get catchUp;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @inbox.
  ///
  /// In en, this message translates to:
  /// **'Inbox'**
  String get inbox;

  /// No description provided for @upvote.
  ///
  /// In en, this message translates to:
  /// **'Upvote'**
  String get upvote;

  /// No description provided for @downvote.
  ///
  /// In en, this message translates to:
  /// **'Downvote'**
  String get downvote;

  /// No description provided for @unvote.
  ///
  /// In en, this message translates to:
  /// **'Unvote'**
  String get unvote;

  /// No description provided for @favorite.
  ///
  /// In en, this message translates to:
  /// **'Favorite'**
  String get favorite;

  /// No description provided for @unfavorite.
  ///
  /// In en, this message translates to:
  /// **'Unfavorite'**
  String get unfavorite;

  /// No description provided for @visit.
  ///
  /// In en, this message translates to:
  /// **'Mark read'**
  String get visit;

  /// No description provided for @unvisit.
  ///
  /// In en, this message translates to:
  /// **'Mark unread'**
  String get unvisit;

  /// No description provided for @flag.
  ///
  /// In en, this message translates to:
  /// **'Flag'**
  String get flag;

  /// No description provided for @unflag.
  ///
  /// In en, this message translates to:
  /// **'Unflag'**
  String get unflag;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @reply.
  ///
  /// In en, this message translates to:
  /// **'Reply'**
  String get reply;

  /// No description provided for @select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// No description provided for @copy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copy;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @text.
  ///
  /// In en, this message translates to:
  /// **'Text'**
  String get text;

  /// No description provided for @link.
  ///
  /// In en, this message translates to:
  /// **'Link'**
  String get link;

  /// No description provided for @itemLink.
  ///
  /// In en, this message translates to:
  /// **'Discussion link'**
  String get itemLink;

  /// No description provided for @synchronize.
  ///
  /// In en, this message translates to:
  /// **'Synchronize'**
  String get synchronize;

  /// No description provided for @synchronizing.
  ///
  /// In en, this message translates to:
  /// **'Synchronizing...'**
  String get synchronizing;

  /// No description provided for @synchronizeDescription.
  ///
  /// In en, this message translates to:
  /// **'Interactions performed from within Glider are pushed to your account, but it is not aware of changes made through other channels, such as the website itself.\n\n\"Synchronize\" manually pulls the votes, favorites and flags from your account and updates the app accordingly.\n\nNote that any local-only favorites created before logging in will be overwritten.'**
  String get synchronizeDescription;

  /// No description provided for @block.
  ///
  /// In en, this message translates to:
  /// **'Block'**
  String get block;

  /// No description provided for @unblock.
  ///
  /// In en, this message translates to:
  /// **'Unblock'**
  String get unblock;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @userLink.
  ///
  /// In en, this message translates to:
  /// **'User link'**
  String get userLink;

  /// No description provided for @userUnavailable.
  ///
  /// In en, this message translates to:
  /// **'User information is not available yet'**
  String get userUnavailable;

  /// No description provided for @autofillTitle.
  ///
  /// In en, this message translates to:
  /// **'Autofill title'**
  String get autofillTitle;

  /// No description provided for @emptyError.
  ///
  /// In en, this message translates to:
  /// **'This field cannot be empty.'**
  String get emptyError;

  /// No description provided for @bothEmptyError.
  ///
  /// In en, this message translates to:
  /// **'This field and {otherField} cannot both be empty.'**
  String bothEmptyError(String otherField);

  /// No description provided for @tooLongError.
  ///
  /// In en, this message translates to:
  /// **'Value must have a length less than or equal to {maxLength}'**
  String tooLongError(int maxLength);

  /// No description provided for @invalidUrlError.
  ///
  /// In en, this message translates to:
  /// **'This field requires a valid URL address.'**
  String get invalidUrlError;

  /// No description provided for @blocked.
  ///
  /// In en, this message translates to:
  /// **'[blocked]'**
  String get blocked;

  /// No description provided for @deleted.
  ///
  /// In en, this message translates to:
  /// **'[deleted]'**
  String get deleted;

  /// No description provided for @fromYear.
  ///
  /// In en, this message translates to:
  /// **'from {year}'**
  String fromYear(String year);

  /// No description provided for @sinceDate.
  ///
  /// In en, this message translates to:
  /// **'since {date}'**
  String sinceDate(DateTime date);

  /// No description provided for @loadParent.
  ///
  /// In en, this message translates to:
  /// **'Load parent'**
  String get loadParent;

  /// No description provided for @goToParent.
  ///
  /// In en, this message translates to:
  /// **'Go to parent'**
  String get goToParent;

  /// No description provided for @previousRootChild.
  ///
  /// In en, this message translates to:
  /// **'Previous top-level comment'**
  String get previousRootChild;

  /// No description provided for @nextRootChild.
  ///
  /// In en, this message translates to:
  /// **'Next top-level comment'**
  String get nextRootChild;

  /// No description provided for @similarDiscussions.
  ///
  /// In en, this message translates to:
  /// **'Similar discussions'**
  String get similarDiscussions;

  /// No description provided for @newDescendants.
  ///
  /// In en, this message translates to:
  /// **'{count} new {count, plural, one{comment} other{comments}}'**
  String newDescendants(int count);

  /// No description provided for @preview.
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get preview;

  /// No description provided for @quoteParent.
  ///
  /// In en, this message translates to:
  /// **'Quote parent'**
  String get quoteParent;

  /// No description provided for @dateRangeCustom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get dateRangeCustom;

  /// No description provided for @dateRangeCustomSingle.
  ///
  /// In en, this message translates to:
  /// **'{date}'**
  String dateRangeCustomSingle(DateTime date);

  /// No description provided for @dateRangeCustomMulti.
  ///
  /// In en, this message translates to:
  /// **'{startDate} to {endDate}'**
  String dateRangeCustomMulti(DateTime startDate, DateTime endDate);

  /// No description provided for @dateRangePastDay.
  ///
  /// In en, this message translates to:
  /// **'Past day'**
  String get dateRangePastDay;

  /// No description provided for @dateRangePast3Days.
  ///
  /// In en, this message translates to:
  /// **'Past 3 days'**
  String get dateRangePast3Days;

  /// No description provided for @dateRangePastWeek.
  ///
  /// In en, this message translates to:
  /// **'Past week'**
  String get dateRangePastWeek;

  /// No description provided for @dateRangePastMonth.
  ///
  /// In en, this message translates to:
  /// **'Past month'**
  String get dateRangePastMonth;

  /// No description provided for @dateRangePastYear.
  ///
  /// In en, this message translates to:
  /// **'Past year'**
  String get dateRangePastYear;

  /// No description provided for @founder.
  ///
  /// In en, this message translates to:
  /// **'founder'**
  String get founder;

  /// No description provided for @ceo.
  ///
  /// In en, this message translates to:
  /// **'ceo'**
  String get ceo;

  /// No description provided for @moderator.
  ///
  /// In en, this message translates to:
  /// **'mod'**
  String get moderator;

  /// No description provided for @exModerator.
  ///
  /// In en, this message translates to:
  /// **'ex-mod'**
  String get exModerator;

  /// No description provided for @bot.
  ///
  /// In en, this message translates to:
  /// **'bot'**
  String get bot;

  /// No description provided for @purrfect.
  ///
  /// In en, this message translates to:
  /// **'purrfect'**
  String get purrfect;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
