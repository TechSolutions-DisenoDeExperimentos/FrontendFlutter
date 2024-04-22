class Movie{
  final int id;
  final String title;
  final int year;
  final String synopsis;
  final String posterPath;
  final List<String> genreIds;

  Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.synopsis,
    required this.posterPath,
    required this.genreIds,
  });

  toList() {}
}