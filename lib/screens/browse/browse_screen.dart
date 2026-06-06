import 'package:flutter/material.dart';

import '../../data/movies.dart';
import '../../models/movie.dart';
import '../movies/movie_detail_screen.dart';

/// Mức 3 – Lab 6: tìm kiếm, lọc genre, sort, layout responsive.
class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  final TextEditingController _searchController = TextEditingController();
  final Set<String> _selectedGenres = {};
  String _selectedSort = 'A-Z';

  static const _tabletBreakpoint = 800.0;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Movie> get _visibleMovies {
    final query = _searchController.text.toLowerCase().trim();

    var movies = allMovies.where((movie) {
      final matchesSearch =
          movie.title.toLowerCase().contains(query);
      final matchesGenre = _selectedGenres.isEmpty ||
          movie.genres.any(_selectedGenres.contains);
      return matchesSearch && matchesGenre;
    }).toList();

    switch (_selectedSort) {
      case 'Z-A':
        movies.sort((a, b) => b.title.compareTo(a.title));
      case 'Year':
        movies.sort((a, b) => b.year.compareTo(a.year));
      case 'Rating':
        movies.sort((a, b) => b.rating.compareTo(a.rating));
      case 'A-Z':
      default:
        movies.sort((a, b) => a.title.compareTo(b.title));
    }

    return movies;
  }

  void _toggleGenre(String genre) {
    setState(() {
      if (_selectedGenres.contains(genre)) {
        _selectedGenres.remove(genre);
      } else {
        _selectedGenres.add(genre);
      }
    });
  }

  void _clearFilters() {
    setState(() {
      _searchController.clear();
      _selectedGenres.clear();
      _selectedSort = 'A-Z';
    });
  }

  void _openDetail(Movie movie) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (_) => MovieDetailScreen(movie: movie),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final visibleMovies = _visibleMovies;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final useGrid = screenWidth >= _tabletBreakpoint;

    return Scaffold(
      appBar: AppBar(title: const Text('Find a Movie')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _searchController,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: 'Search by movie title...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text(
                    'Genres',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  if (_selectedGenres.isNotEmpty) ...[
                    const SizedBox(width: 8),
                    Chip(
                      label: Text('${_selectedGenres.length} selected'),
                      visualDensity: VisualDensity.compact,
                    ),
                  ],
                  const Spacer(),
                  TextButton(
                    onPressed: _clearFilters,
                    child: const Text('Clear filters'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: genreOptions.map((genre) {
                  final selected = _selectedGenres.contains(genre);
                  return FilterChip(
                    label: Text(genre),
                    selected: selected,
                    onSelected: (_) => _toggleGenre(genre),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text('Sort by:'),
                  const SizedBox(width: 8),
                  DropdownButton<String>(
                    value: _selectedSort,
                    items: sortOptions
                        .map(
                          (option) => DropdownMenuItem(
                            value: option,
                            child: Text(option),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) setState(() => _selectedSort = value);
                    },
                  ),
                  const Spacer(),
                  Text(
                    '${visibleMovies.length} movies',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
              if (useGrid)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'Tablet layout (${screenWidth.toInt()}px wide)',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ),
              const SizedBox(height: 12),
              Expanded(
                child: visibleMovies.isEmpty
                    ? const Center(
                        child: Text('No movies match your filters.'),
                      )
                    : useGrid
                        ? GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 0.72,
                            ),
                            itemCount: visibleMovies.length,
                            itemBuilder: (context, index) {
                              final movie = visibleMovies[index];
                              return _MovieGridCard(
                                movie: movie,
                                onTap: () => _openDetail(movie),
                              );
                            },
                          )
                        : ListView.builder(
                            itemCount: visibleMovies.length,
                            itemBuilder: (context, index) {
                              final movie = visibleMovies[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: _MovieListCard(
                                  movie: movie,
                                  onTap: () => _openDetail(movie),
                                ),
                              );
                            },
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MovieListCard extends StatelessWidget {
  const _MovieListCard({required this.movie, required this.onTap});

  final Movie movie;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  movie.posterUrl,
                  width: 64,
                  height: 96,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 64,
                    height: 96,
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.movie),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(child: _MovieInfo(movie: movie)),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

class _MovieGridCard extends StatelessWidget {
  const _MovieGridCard({required this.movie, required this.onTap});

  final Movie movie;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final posterHeight = constraints.maxWidth < 200 ? 140.0 : 180.0;

        return Card(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network(
                  movie.posterUrl,
                  height: posterHeight,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: posterHeight,
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.movie, size: 40),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: _MovieInfo(movie: movie),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _MovieInfo extends StatelessWidget {
  const _MovieInfo({required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movie.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              '${movie.year}',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const SizedBox(width: 8),
            Icon(Icons.star, size: 14, color: Colors.amber.shade700),
            const SizedBox(width: 2),
            Text(
              movie.rating.toString(),
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ],
        ),
      ],
    );
  }
}
