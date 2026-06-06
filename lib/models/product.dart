/// Model sản phẩm dùng cho danh sách động.
class Product {
  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.description,
  });

  final String id;
  final String name;
  final int price;
  final String category;
  final String imageUrl;
  final String description;

  String get formattedPrice {
    final formatted = price.toString().replaceAllMapped(
          RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (match) => '${match[1]}.',
        );
    return '$formatted đ';
  }
}
