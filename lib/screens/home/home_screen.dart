import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Trang chủ – điểm vào app sau khi mở.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang chủ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.storefront,
              size: 72,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'Chào mừng đến cửa hàng!',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Khám phá sản phẩm mới, xem Lab 4 hoặc tùy chỉnh giao diện ở tab Cá nhân.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: () => context.go('/products'),
              icon: const Icon(Icons.shopping_bag),
              label: const Text('Xem sản phẩm'),
            ),
          ],
        ),
      ),
    );
  }
}
