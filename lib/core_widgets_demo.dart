import 'package:flutter/material.dart';

/// Exercise 1 – demonstrates [Text], [Icon], [Image.network], [Card], [ListTile].
class CoreWidgetsDemo extends StatelessWidget {
  const CoreWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 1 – Core Widgets'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Headline Text widget
            Text(
              'Welcome to Flutter UI',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),

            // Material Icon – centered for visual balance
            const Center(
              child: Icon(
                Icons.movie,
                size: 72,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),

            // Network image (requires internet at runtime)
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMuRviGmuOIjiaBd9elsOJ9lthIA9hKV6JGQ&s',
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return const SizedBox(
                    height: 180,
                    child: Center(child: CircularProgressIndicator()),
                  );
                },
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 180,
                  color: Colors.grey.shade300,
                  alignment: Alignment.center,
                  child: const Text('Image failed to load'),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Card wraps a ListTile for grouped content
            Card(
              color: Colors.grey.shade100,
              child: const ListTile(
                leading: Icon(Icons.star, color: Colors.black54),
                title: Text('Movie Item'),
                subtitle: Text('This is a sample ListTile inside a Card.'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
