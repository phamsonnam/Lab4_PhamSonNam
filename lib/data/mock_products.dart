import '../models/product.dart';

/// Danh mục sản phẩm dùng cho TabBar.
const productCategories = ['Điện tử', 'Thời trang', 'Gia dụng'];

/// Dữ liệu sản phẩm mẫu – thay API thật trong tương lai.
const mockProducts = <Product>[
  Product(
    id: '1',
    name: 'iPhone 15 Pro',
    price: 28990000,
    category: 'Điện tử',
    imageUrl: 'https://picsum.photos/seed/iphone/400/400',
    description: 'Điện thoại cao cấp với chip A17 Pro và camera 48MP.',
  ),
  Product(
    id: '2',
    name: 'MacBook Air M3',
    price: 27990000,
    category: 'Điện tử',
    imageUrl: 'https://picsum.photos/seed/macbook/400/400',
    description: 'Laptop mỏng nhẹ, hiệu năng mạnh cho học tập và làm việc.',
  ),
  Product(
    id: '3',
    name: 'Tai nghe Sony WH-1000XM5',
    price: 7490000,
    category: 'Điện tử',
    imageUrl: 'https://picsum.photos/seed/headphone/400/400',
    description: 'Tai nghe chống ồn chủ động, âm thanh sống động.',
  ),
  Product(
    id: '4',
    name: 'Áo thun basic',
    price: 199000,
    category: 'Thời trang',
    imageUrl: 'https://picsum.photos/seed/tshirt/400/400',
    description: 'Áo cotton 100%, form regular, nhiều màu.',
  ),
  Product(
    id: '5',
    name: 'Quần jean slim fit',
    price: 449000,
    category: 'Thời trang',
    imageUrl: 'https://picsum.photos/seed/jean/400/400',
    description: 'Quần jean co giãn nhẹ, phù hợp đi học và đi chơi.',
  ),
  Product(
    id: '6',
    name: 'Giày sneaker',
    price: 890000,
    category: 'Thời trang',
    imageUrl: 'https://picsum.photos/seed/sneaker/400/400',
    description: 'Giày thể thao nhẹ, đế cao su bám tốt.',
  ),
  Product(
    id: '7',
    name: 'Nồi cơm điện 1.8L',
    price: 1290000,
    category: 'Gia dụng',
    imageUrl: 'https://picsum.photos/seed/ricecooker/400/400',
    description: 'Nấu cơm nhanh, giữ ấm lâu, dễ vệ sinh.',
  ),
  Product(
    id: '8',
    name: 'Máy xay sinh tố',
    price: 990000,
    category: 'Gia dụng',
    imageUrl: 'https://picsum.photos/seed/blender/400/400',
    description: 'Xay nhuyễn trái cây, làm sinh tố mỗi sáng.',
  ),
  Product(
    id: '9',
    name: 'Bàn ủi hơi nước',
    price: 650000,
    category: 'Gia dụng',
    imageUrl: 'https://picsum.photos/seed/iron/400/400',
    description: 'Ủi phẳng nhanh, hơi nước mạnh, an toàn.',
  ),
  Product(
    id: '10',
    name: 'Loa Bluetooth JBL',
    price: 2190000,
    category: 'Điện tử',
    imageUrl: 'https://picsum.photos/seed/speaker/400/400',
    description: 'Loa portable chống nước IPX7, pin 12 giờ.',
  ),
];

Product? findProductById(String id) {
  for (final product in mockProducts) {
    if (product.id == id) return product;
  }
  return null;
}

List<Product> filterProductsByCategory(String? category) {
  if (category == null) return mockProducts;
  return mockProducts.where((p) => p.category == category).toList();
}
