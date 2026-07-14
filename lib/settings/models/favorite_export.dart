/// A single favorited item, reduced to the plain fields needed for export.
///
/// Deliberately free of Flutter and domain dependencies so the formatting
/// logic can be unit-tested with a plain `dart test`.
class FavoriteExportRow {
  const FavoriteExportRow({
    required this.id,
    this.title,
    this.url,
    this.score,
    this.author,
    this.commentCount,
    this.type,
  });

  final int id;
  final String? title;
  final String? url;
  final int? score;
  final String? author;
  final int? commentCount;
  final String? type;

  /// The Hacker News discussion link for this item.
  String get hackerNewsUrl => 'https://news.ycombinator.com/item?id=$id';
}

/// Column headers, in output order.
const List<String> favoriteExportTsvHeaders = [
  'id',
  'title',
  'url',
  'hn_url',
  'score',
  'author',
  'comments',
  'type',
];

/// Formats [rows] as a TSV document: one header line followed by one line per
/// row. Tab, newline and carriage-return characters inside any field are
/// replaced with spaces so they cannot break the tab-separated structure.
///
/// Numeric and text fields that are absent are rendered as empty cells rather
/// than a placeholder like `0`, so downstream tools can distinguish "no data"
/// from a genuine zero.
String formatFavoritesAsTsv(List<FavoriteExportRow> rows) {
  final buffer = StringBuffer()..writeln(favoriteExportTsvHeaders.join('\t'));

  for (final row in rows) {
    buffer.writeln(
      [
        row.id.toString(),
        _sanitize(row.title),
        _sanitize(row.url),
        row.hackerNewsUrl,
        row.score?.toString() ?? '',
        _sanitize(row.author),
        row.commentCount?.toString() ?? '',
        _sanitize(row.type),
      ].join('\t'),
    );
  }

  return buffer.toString();
}

/// Removes characters that would break the TSV layout, collapsing them to a
/// single space. Returns an empty string for a null value.
String _sanitize(String? value) {
  if (value == null || value.isEmpty) return '';
  return value.replaceAll(RegExp(r'[\t\r\n]'), ' ');
}
