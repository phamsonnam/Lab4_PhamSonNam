import 'package:flutter/material.dart';

import '../../data/mock_products.dart';
import 'product_list_tab.dart';

/// Màn sản phẩm với [TabBar] lọc theo danh mục.
class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: productCategories.length + 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sản phẩm'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Tất cả'),
              Tab(text: 'Điện tử'),
              Tab(text: 'Thời trang'),
              Tab(text: 'Gia dụng'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ProductListTab(),
            ProductListTab(category: 'Điện tử'),
            ProductListTab(category: 'Thời trang'),
            ProductListTab(category: 'Gia dụng'),
          ],
        ),
      ),
    );
  }
}
