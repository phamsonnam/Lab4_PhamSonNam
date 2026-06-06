import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Menu Lab 4 – điều hướng các bài tập bằng [GoRouter].
class LabMenuScreen extends StatelessWidget {
  const LabMenuScreen({super.key});

  static const _menuBackground = Color(0xFFE8E6F0);

  static const _items = <_LabEntry>[
    _LabEntry('Exercise 1 – Core Widgets Demo', '/lab/ex1'),
    _LabEntry('Exercise 2 – Input Controls Demo', '/lab/ex2'),
    _LabEntry('Exercise 3 – Layout Demo', '/lab/ex3'),
    _LabEntry('Exercise 4 – App Structure & Theme', '/lab/ex4'),
    _LabEntry('Exercise 5 – Common UI Fixes', '/lab/ex5'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _menuBackground,
      appBar: AppBar(
        title: const Text('Lab 4 – Flutter UI Fundamentals'),
        backgroundColor: _menuBackground,
        elevation: 0,
        foregroundColor: Colors.black87,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _items.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final entry = _items[index];
          return Card(
            child: ListTile(
              title: Text(entry.title),
              trailing: const Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () => context.push(entry.route),
            ),
          );
        },
      ),
    );
  }
}

class _LabEntry {
  const _LabEntry(this.title, this.route);

  final String title;
  final String route;
}
