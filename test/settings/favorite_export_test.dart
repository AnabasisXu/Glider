import 'package:glider/settings/models/favorite_export.dart';
import 'package:flutter_test/flutter_test.dart';

/// Splits [output] into its lines, dropping only the trailing empty string
/// that follows the final newline. Unlike `trimRight`, this preserves empty
/// trailing columns (which are tab characters) so column counts stay exact.
List<String> _lines(String output) => output.split('\n')..removeLast();

void main() {
  group('formatFavoritesAsTsv', () {
    test('emits only the header row when there are no favorites', () {
      final output = formatFavoritesAsTsv([]);

      expect(output, 'id\ttitle\turl\thn_url\tscore\tauthor\tcomments\ttype\n');
    });

    test('renders a fully populated row with all columns', () {
      final output = formatFavoritesAsTsv([
        const FavoriteExportRow(
          id: 42103940,
          title: 'Show HN: Origami',
          url: 'https://origami.example.se/',
          score: 72,
          author: 'felixlindgren',
          commentCount: 91,
          type: 'story',
        ),
      ]);

      final lines = _lines(output);
      expect(lines, hasLength(2));
      expect(
        lines[1],
        '42103940\tShow HN: Origami\thttps://origami.example.se/\t'
        'https://news.ycombinator.com/item?id=42103940\t72\t'
        'felixlindgren\t91\tstory',
      );
    });

    test('derives the Hacker News URL from the id', () {
      final output = formatFavoritesAsTsv([
        const FavoriteExportRow(id: 1234),
      ]);

      expect(
        output,
        contains('https://news.ycombinator.com/item?id=1234'),
      );
    });

    test('renders absent numeric and text fields as empty cells', () {
      final output = formatFavoritesAsTsv([
        const FavoriteExportRow(id: 7),
      ]);

      final columns = _lines(output)[1].split('\t');
      expect(columns, [
        '7', // id
        '', // title
        '', // url
        'https://news.ycombinator.com/item?id=7', // hn_url
        '', // score
        '', // author
        '', // comments
        '', // type
      ]);
    });

    test('preserves a genuine zero score distinctly from a missing one', () {
      final output = formatFavoritesAsTsv([
        const FavoriteExportRow(id: 1, score: 0, commentCount: 0),
      ]);

      final columns = _lines(output)[1].split('\t');
      expect(columns[4], '0'); // score
      expect(columns[6], '0'); // comments
    });

    test('replaces tabs and newlines in a title so columns stay aligned', () {
      final output = formatFavoritesAsTsv([
        const FavoriteExportRow(
          id: 9,
          title: 'Ask HN:\tmulti\nline\r\ntitle',
          author: 'pg',
        ),
      ]);

      final line = _lines(output)[1];
      // Exactly the 8 columns, none split by the injected control characters.
      expect(line.split('\t'), hasLength(8));
      expect(line, contains('Ask HN: multi line  title'));
    });

    test('emits one data line per favorite in order', () {
      final output = formatFavoritesAsTsv([
        const FavoriteExportRow(id: 1, title: 'first'),
        const FavoriteExportRow(id: 2, title: 'second'),
        const FavoriteExportRow(id: 3, title: 'third'),
      ]);

      final lines = _lines(output);
      expect(lines, hasLength(4)); // header + 3
      expect(lines[1], startsWith('1\tfirst\t'));
      expect(lines[2], startsWith('2\tsecond\t'));
      expect(lines[3], startsWith('3\tthird\t'));
    });
  });
}
