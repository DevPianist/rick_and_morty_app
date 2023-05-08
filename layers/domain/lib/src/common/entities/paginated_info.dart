/// {@template domain.paginated_info}
/// Paginated info entity.
/// {@endtemplate}
class PaginatedInfo {
  /// {@macro domain.paginated_info}
  const PaginatedInfo({
    required this.count,
    required this.pages,
    required this.nextPage,
    required this.prevPage,
  });

  /// `count` The length of the response.

  final int count;

  /// `pages` The amount of pages.
  final int pages;

  /// `nextPage` Number of the next page (if it exists).
  final int? nextPage;

  /// `prevPage` Number of the previous page (if it exists).
  final int? prevPage;
}
