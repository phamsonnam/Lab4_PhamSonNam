import '../models/movie.dart';

/// Dữ liệu phim mẫu – một nguồn dùng cho cả danh sách và khám phá.
const allMovies = <Movie>[
  Movie(
    id: 'dune2',
    title: 'Dune: Part Two',
    year: 2024,
    posterUrl: 'https://picsum.photos/seed/dune2/600/900',
    overview:
        'Paul Atreides unites with Chani and the Fremen while seeking revenge against the conspirators who destroyed his family.',
    genres: ['Sci-Fi', 'Adventure', 'Drama'],
    rating: 8.6,
    trailers: [
      Trailer(title: 'Official Trailer #1'),
      Trailer(title: 'IMAX Sneak Peek'),
    ],
  ),
  Movie(
    id: 'deadpool3',
    title: 'Deadpool & Wolverine',
    year: 2024,
    posterUrl: 'https://picsum.photos/seed/deadpool3/600/900',
    overview:
        'The multiverse gets messy when Wade Wilson teams up with Wolverine for a not-so-family-friendly mission.',
    genres: ['Action', 'Comedy'],
    rating: 8.3,
    trailers: [
      Trailer(title: 'Red Band Trailer'),
      Trailer(title: 'Behind the Scenes'),
    ],
  ),
  Movie(
    id: 'inception',
    title: 'Inception',
    year: 2010,
    posterUrl: 'https://picsum.photos/seed/inception/600/900',
    overview:
        'A thief who steals secrets through dreams is offered a chance to plant an idea instead.',
    genres: ['Sci-Fi', 'Action', 'Thriller'],
    rating: 8.8,
    trailers: [
      Trailer(title: 'Main Trailer'),
      Trailer(title: 'Dream Featurette'),
    ],
  ),
  Movie(
    id: 'darkknight',
    title: 'The Dark Knight',
    year: 2008,
    posterUrl: 'https://picsum.photos/seed/darkknight/600/900',
    overview:
        'Batman faces the Joker, a criminal mastermind who plunges Gotham into chaos.',
    genres: ['Action', 'Drama', 'Crime'],
    rating: 9.0,
    trailers: [
      Trailer(title: 'Theatrical Trailer'),
      Trailer(title: 'Prologue Preview'),
    ],
  ),
  Movie(
    id: 'lalaland',
    title: 'La La Land',
    year: 2016,
    posterUrl: 'https://picsum.photos/seed/lalaland/600/900',
    overview:
        'A jazz pianist and an aspiring actress fall in love while pursuing their dreams in Los Angeles.',
    genres: ['Drama', 'Comedy', 'Romance'],
    rating: 8.0,
    trailers: [
      Trailer(title: 'Official Trailer'),
      Trailer(title: 'Opening Scene'),
    ],
  ),
  Movie(
    id: 'interstellar',
    title: 'Interstellar',
    year: 2014,
    posterUrl: 'https://picsum.photos/seed/interstellar/600/900',
    overview:
        'A team of explorers travel through a wormhole in space in an attempt to ensure humanity survival.',
    genres: ['Sci-Fi', 'Drama', 'Adventure'],
    rating: 8.7,
    trailers: [
      Trailer(title: 'Main Trailer'),
      Trailer(title: 'Teaser Trailer'),
    ],
  ),
];

const genreOptions = [
  'Action',
  'Adventure',
  'Comedy',
  'Crime',
  'Drama',
  'Romance',
  'Sci-Fi',
  'Thriller',
];

const sortOptions = ['A-Z', 'Z-A', 'Year', 'Rating'];

Movie? findMovieById(String id) {
  for (final movie in allMovies) {
    if (movie.id == id) return movie;
  }
  return null;
}
