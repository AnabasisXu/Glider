import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glider/auth/cubit/auth_cubit.dart';
import 'package:glider/favorites/cubit/favorites_cubit.dart';
import 'package:glider/favorites/view/favorites_shell_page.dart';
import 'package:glider/l10n/gen/app_localizations.dart';
import 'package:glider/settings/cubit/settings_cubit.dart';
import 'package:mocktail/mocktail.dart';

class _MockFavoritesCubit extends MockCubit<FavoritesState>
    implements FavoritesCubit {}

class _MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

class _MockSettingsCubit extends MockCubit<SettingsState>
    implements SettingsCubit {}

void main() {
  late _MockFavoritesCubit favoritesCubit;
  late _MockAuthCubit authCubit;
  late _MockSettingsCubit settingsCubit;

  setUp(() {
    favoritesCubit = _MockFavoritesCubit();
    authCubit = _MockAuthCubit();
    settingsCubit = _MockSettingsCubit();

    // Empty, successful favorites so the body renders without needing item
    // tiles (and therefore without the item cubit factory being invoked).
    when(() => favoritesCubit.state).thenReturn(const FavoritesState());
    when(() => favoritesCubit.presentation)
        .thenAnswer((_) => const Stream.empty());
    when(() => favoritesCubit.load()).thenAnswer((_) async {});
    when(() => favoritesCubit.exportFavorites()).thenAnswer((_) async {});
    when(() => authCubit.state).thenReturn(const AuthState());
    when(() => settingsCubit.state).thenReturn(const SettingsState());
  });

  Future<void> pumpPage(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: FavoritesShellPage(
          favoritesCubit,
          // The item cubit factory is never called for an empty favorites
          // list, so a throwing stub proves that invariant if it regresses.
          (id) => throw StateError('item cubit factory should not be called'),
          authCubit,
          settingsCubit,
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('renders a download action in the favorites app bar',
      (tester) async {
    await pumpPage(tester);

    expect(find.byIcon(Icons.download_outlined), findsOneWidget);
  });

  testWidgets('tapping the download action triggers a favorites export',
      (tester) async {
    await pumpPage(tester);

    await tester.tap(find.byIcon(Icons.download_outlined));
    await tester.pump();

    verify(() => favoritesCubit.exportFavorites()).called(1);
  });
}
