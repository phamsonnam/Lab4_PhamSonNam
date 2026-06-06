/// Model phim dùng chung cho toàn project (Lab 5 + Lab 6).
class Movie {
  const Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.posterUrl,
    required this.overview,
    required this.genres,
    required this.rating,
    required this.trailers,
  });

  final String id;
  final String title;
  final int year;
  final String posterUrl;
  final String overview;
  final List<String> genres;
  final double rating;
  final List<Trailer> trailers;

  String get genresLabel => genres.join(' • ');
}

class Trailer {
  const Trailer({required this.title});

  final String title;
}
