class Movie{
  final int id;
  final String title;
  final int year;
  //final DateTime releaseDate;
  final String synopsis;
  final String posterSrc;
  final List<String> genreIds;
  final String trailerSrc;
  final int duration;

  Movie({
    required this.id,
    required this.title,
    required this.year,
    //required this.releaseDate,
    required this.synopsis,
    required this.posterSrc,
    required this.genreIds,
    required this.trailerSrc,
    required this.duration
  });

  toList() {}
}