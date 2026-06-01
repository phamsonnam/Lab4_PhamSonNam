import 'package:flutter/material.dart';

/// Exercise 5 – common UI mistakes and how to fix them.
///
/// Submission notes – fixes explained:
///
/// 1. **ListView inside Column** → Wrap the ListView with [Expanded] (see below).
///    Without Expanded, Column gives unbounded height and Flutter throws a
///    viewport error.
///
/// 2. **Overflow on small screens** → Wrap a tall [Column] in
///    [SingleChildScrollView] so content can scroll instead of overflowing.
///
/// 3. **UI not updating** → Call [setState] in a [StatefulWidget] whenever
///    state fields change (see [InputControlsDemo] for live examples).
///
/// 4. **DatePicker context error** → Call [showDatePicker] from an `onPressed`
///    or button handler using the State's `context`, not from [initState] or
///    after the widget is disposed (see [InputControlsDemo]._openDatePicker).
class CommonUiFixesDemo extends StatelessWidget {
  const CommonUiFixesDemo({super.key});

  static const _movies = ['Movie A', 'Movie B', 'Movie C', 'Movie D'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 5 – Common UI Fixes'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Correct ListView inside Column using Expanded',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),

          // FIX: Expanded constrains ListView height inside Column.
          Expanded(
            child: ListView.builder(
              itemCount: _movies.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.movie),
                  title: Text(_movies[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
