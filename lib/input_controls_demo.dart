import 'package:flutter/material.dart';

/// Exercise 2 – [Slider], [Switch], [RadioListTile], and [showDatePicker].
class InputControlsDemo extends StatefulWidget {
  const InputControlsDemo({super.key});

  @override
  State<InputControlsDemo> createState() => _InputControlsDemoState();
}

class _InputControlsDemoState extends State<InputControlsDemo> {
  double _rating = 50;
  bool _isActive = false;
  String? _selectedGenre;
  DateTime? _selectedDate;

  Future<void> _openDatePicker() async {
    // DatePicker must be called with a valid BuildContext from the widget tree.
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateLabel = _selectedDate == null
        ? 'No date selected'
        : 'Selected: ${_selectedDate!.toLocal().toString().split(' ')[0]}';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 2 – Input Controls'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle('Rating (Slider)'),
            Slider(
              value: _rating,
              min: 0,
              max: 100,
              divisions: 100,
              label: _rating.round().toString(),
              onChanged: (value) {
                // setState notifies Flutter to rebuild with new values.
                setState(() => _rating = value);
              },
            ),
            Text('Current value: ${_rating.round()}'),
            const SizedBox(height: 24),

            _sectionTitle('Active (Switch)'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Is movie active?'),
                Switch(
                  value: _isActive,
                  onChanged: (value) {
                    setState(() => _isActive = value);
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),

            _sectionTitle('Genre (RadioListTile)'),
            RadioListTile<String>(
              title: const Text('Action'),
              value: 'Action',
              groupValue: _selectedGenre,
              onChanged: (value) => setState(() => _selectedGenre = value),
            ),
            RadioListTile<String>(
              title: const Text('Comedy'),
              value: 'Comedy',
              groupValue: _selectedGenre,
              onChanged: (value) => setState(() => _selectedGenre = value),
            ),
            Text('Selected genre: ${_selectedGenre ?? 'None'}'),
            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: FilledButton.tonal(
                onPressed: _openDatePicker,
                child: const Text('Open Date Picker'),
              ),
            ),
            const SizedBox(height: 8),
            Text(dateLabel),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
