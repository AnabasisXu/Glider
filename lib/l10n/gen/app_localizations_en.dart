import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Glider';

  @override
  String get empty => '\"It\'s quiet... too quiet\'\"';

  @override
  String get failure => 'Something went wrong';

  @override
  String get confirm => 'Are you sure?';

  @override
  String get retry => 'Retry';

  @override
  String get search => 'Search';

  @override
  String get clear => 'Clear';

  @override
  String get whatsNew => 'What\'s new';

  @override
  String get whatsNewDescription => '> “It’s important to remember that when you start from scratch there is *absolutely no reason* to believe that you are going to do a better job than you did the first time.” — *Joel Spolsky*\n\nWelcome to the new Glider for Hacker News!\n\nDefying rationality, this update is the result of a *Thing You Should Never Do* [0]: rewriting the code from scratch. Accompanying this change is a UI overhaul, based on the Material 3 design system.\n\nLogin and registration is now deferred to the Hacker News website for increased security and reliability. This unfortunately necessitates logging in again, once.\n\nOverall, most users should feel at home quickly, although not every feature survived the metamorphosis, for varying reasons. Please provide feature requests and bug reports through the issue tracker [1].\n---\n[0]: https://www.joelonsoftware.com/2000/04/06/things-you-should-never-do-part-i/\n\n[1]: https://github.com/Mosc/Glider/issues';

  @override
  String get explore => 'Explore';

  @override
  String get settings => 'Settings';

  @override
  String get theme => 'Theme';

  @override
  String get themeMode => 'Theme mode';

  @override
  String get dynamicTheme => 'Dynamic theme';

  @override
  String get dynamicThemeDescription => 'Uses system color scheme';

  @override
  String get themeColor => 'Theme color';

  @override
  String get themeVariant => 'Theme variant';

  @override
  String get pureBackground => 'Pure background';

  @override
  String get pureBackgroundDescription => 'White on light theme, black on dark theme';

  @override
  String get font => 'Font';

  @override
  String get appearance => 'Appearance';

  @override
  String get storyLines => 'Story lines';

  @override
  String get variable => 'Variable';

  @override
  String get largeStoryStyle => 'Large stories';

  @override
  String get largeStoryStyleDescription => 'Shows URL, larger title, larger favicon';

  @override
  String get favicons => 'Story favicons';

  @override
  String get storyMetadata => 'Story metadata';

  @override
  String get storyMetadataDescription => 'Always shows on some pages';

  @override
  String get actionButtons => 'Action buttons';

  @override
  String get actionButtonsDescription => 'Makes some metadata interactive';

  @override
  String get userAvatars => 'User avatars';

  @override
  String get behavior => 'Behavior';

  @override
  String get showJobs => 'Show job stories';

  @override
  String get showJobsDescription => 'Also shows jobs in dropdown menu';

  @override
  String get threadNavigation => 'Thread navigation';

  @override
  String get threadNavigationDescription => 'Allows jumps between top-level comments';

  @override
  String get downvoting => 'Downvoting';

  @override
  String get downvotingDescription => 'Requires an account with 501+ karma';

  @override
  String get inAppBrowser => 'Custom tabs';

  @override
  String get inAppBrowserDescription => 'Opens links in in-app browser if possible';

  @override
  String get navigationDrawer => 'Navigation drawer';

  @override
  String get navigationDrawerDescription => 'Replaces navigation bar or rail';

  @override
  String get filters => 'Filters';

  @override
  String get filtersDescription => 'Hides stories based on words or domains';

  @override
  String get words => 'Words';

  @override
  String get wordsHint => 'foobar';

  @override
  String get domains => 'Domains';

  @override
  String get domainsHelp => 'example.com';

  @override
  String get data => 'Data';

  @override
  String get exportFavorites => 'Export favorites';

  @override
  String exportFavoritesSuccess(String path) {
    return 'Exported to $path';
  }

  @override
  String get clearVisited => 'Clear read statuses';

  @override
  String get about => 'About';

  @override
  String get appVersion => 'App version';

  @override
  String get privacyPolicy => 'Privacy policy';

  @override
  String get privacyPolicyYc => 'Privacy policy (YC)';

  @override
  String get license => 'License';

  @override
  String get sourceCode => 'Source code';

  @override
  String get issueTracker => 'Issue tracker';

  @override
  String get account => 'Account';

  @override
  String get login => 'Log in';

  @override
  String get authDescription => 'Log in on Hacker News below. The session cookie will be securely saved and used for requests that require authentication. This app will not have access to your password.';

  @override
  String get termsOfUseYc => 'Terms of use (YC)';

  @override
  String get logout => 'Log out';

  @override
  String get showMore => 'Show more';

  @override
  String get stories => 'Frontpage';

  @override
  String get storyTypeTop => 'Top stories';

  @override
  String get storyTypeNew => 'New stories';

  @override
  String get storyTypeBest => 'Best stories';

  @override
  String get storyTypeAsk => 'Ask HN';

  @override
  String get storyTypeShow => 'Show HN';

  @override
  String get storyTypeJob => 'Jobs';

  @override
  String get submit => 'Submit';

  @override
  String get catchUp => 'Catch up';

  @override
  String get favorites => 'Favorites';

  @override
  String get inbox => 'Inbox';

  @override
  String get upvote => 'Upvote';

  @override
  String get downvote => 'Downvote';

  @override
  String get unvote => 'Unvote';

  @override
  String get favorite => 'Favorite';

  @override
  String get unfavorite => 'Unfavorite';

  @override
  String get visit => 'Mark read';

  @override
  String get unvisit => 'Mark unread';

  @override
  String get flag => 'Flag';

  @override
  String get unflag => 'Unflag';

  @override
  String get edit => 'Edit';

  @override
  String get delete => 'Delete';

  @override
  String get reply => 'Reply';

  @override
  String get select => 'Select';

  @override
  String get copy => 'Copy';

  @override
  String get share => 'Share';

  @override
  String get title => 'Title';

  @override
  String get text => 'Text';

  @override
  String get link => 'Link';

  @override
  String get itemLink => 'Discussion link';

  @override
  String get synchronize => 'Synchronize';

  @override
  String get synchronizing => 'Synchronizing...';

  @override
  String get synchronizeDescription => 'Interactions performed from within Glider are pushed to your account, but it is not aware of changes made through other channels, such as the website itself.\n\n\"Synchronize\" manually pulls the votes, favorites and flags from your account and updates the app accordingly.\n\nNote that any local-only favorites created before logging in will be overwritten.';

  @override
  String get block => 'Block';

  @override
  String get unblock => 'Unblock';

  @override
  String get username => 'Username';

  @override
  String get userLink => 'User link';

  @override
  String get userUnavailable => 'User information is not available yet';

  @override
  String get autofillTitle => 'Autofill title';

  @override
  String get emptyError => 'This field cannot be empty.';

  @override
  String bothEmptyError(String otherField) {
    return 'This field and $otherField cannot both be empty.';
  }

  @override
  String tooLongError(int maxLength) {
    return 'Value must have a length less than or equal to $maxLength';
  }

  @override
  String get invalidUrlError => 'This field requires a valid URL address.';

  @override
  String get blocked => '[blocked]';

  @override
  String get deleted => '[deleted]';

  @override
  String fromYear(String year) {
    return 'from $year';
  }

  @override
  String sinceDate(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMMMMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'since $dateString';
  }

  @override
  String get loadParent => 'Load parent';

  @override
  String get goToParent => 'Go to parent';

  @override
  String get previousRootChild => 'Previous top-level comment';

  @override
  String get nextRootChild => 'Next top-level comment';

  @override
  String get similarDiscussions => 'Similar discussions';

  @override
  String newDescendants(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'comments',
      one: 'comment',
    );
    return '$count new $_temp0';
  }

  @override
  String get preview => 'Preview';

  @override
  String get quoteParent => 'Quote parent';

  @override
  String get dateRangeCustom => 'Custom';

  @override
  String dateRangeCustomSingle(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMMMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$dateString';
  }

  @override
  String dateRangeCustomMulti(DateTime startDate, DateTime endDate) {
    final intl.DateFormat startDateDateFormat = intl.DateFormat.yMMMd(localeName);
    final String startDateString = startDateDateFormat.format(startDate);
    final intl.DateFormat endDateDateFormat = intl.DateFormat.yMMMd(localeName);
    final String endDateString = endDateDateFormat.format(endDate);

    return '$startDateString to $endDateString';
  }

  @override
  String get dateRangePastDay => 'Past day';

  @override
  String get dateRangePast3Days => 'Past 3 days';

  @override
  String get dateRangePastWeek => 'Past week';

  @override
  String get dateRangePastMonth => 'Past month';

  @override
  String get dateRangePastYear => 'Past year';

  @override
  String get founder => 'founder';

  @override
  String get ceo => 'ceo';

  @override
  String get moderator => 'mod';

  @override
  String get exModerator => 'ex-mod';

  @override
  String get bot => 'bot';

  @override
  String get purrfect => 'purrfect';
}
