// lib/models/product_data.dart
class ProductData {
  final String id;
  final String imageUrl;
  final String nameTh;
  final String nameEn;
  final double originalPrice;
  final double? promotionPrice;
  final String? promotionType; // 'Discount', 'StepPrice', 'BuyOneGetOne' etc.
  final String? promotionText; // "ลด 50%"
  final List<Map<String, dynamic>>? stepPrices; // [{'qty': 1, 'price': 100}]
  final String? customIconUrl; // สำหรับไอคอนพิเศษ

  const ProductData({
    required this.id,
    required this.imageUrl,
    required this.nameTh,
    required this.nameEn,
    required this.originalPrice,
    this.promotionPrice,
    this.promotionType,
    this.promotionText,
    this.stepPrices,
    this.customIconUrl,
  });

  // สร้างจาก Map (สมมติมาจาก API)
  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      id: json['id'] as String,
      imageUrl: json['imageUrl'] as String,
      nameTh: json['nameTh'] as String,
      nameEn: json['nameEn'] as String,
      originalPrice: (json['originalPrice'] as num).toDouble(),
      promotionPrice: (json['promotionPrice'] as num?)?.toDouble(),
      promotionType: json['promotionType'] as String?,
      promotionText: json['promotionText'] as String?,
      stepPrices: (json['stepPrices'] as List<dynamic>?)?.cast<Map<String, dynamic>>(),
      customIconUrl: json['customIconUrl'] as String?,
    );
  }
}