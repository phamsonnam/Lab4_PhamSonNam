import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Mức 1 – Lab 4: các bài UI fundamentals (widget, input, layout, theme, fixes).
class FundamentalsScreen extends StatelessWidget {
  const FundamentalsScreen({super.key});

  static const _items = <_Entry>[
    _Entry('Core Widgets', 'Text, Image, Icon, Card, ListTile', '/fundamentals/ex1'),
    _Entry('Input Controls', 'Slider, Switch, Radio, DatePicker', '/fundamentals/ex2'),
    _Entry('Layout Basics', 'Column, Row, Padding, ListView', '/fundamentals/ex3'),
    _Entry('App Structure & Theme', 'Scaffold, AppBar, FAB, Dark mode', '/fundamentals/ex4'),
    _Entry('Common UI Fixes', 'Expanded, setState, DatePicker context', '/fundamentals/ex5'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Fundamentals'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _items.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final entry = _items[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text(entry.title),
              subtitle: Text(entry.subtitle),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.push(entry.route),
            ),
          );
        },
      ),
    );
  }
}

class _Entry {
  const _Entry(this.title, this.subtitle, this.route);

  final String title;
  final String subtitle;
  final String route;
}
