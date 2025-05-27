// lib/screens/product_list_screen.dart

import 'package:flutter/material.dart';
import 'package:krua_pos/models/product.dart';
import 'package:krua_pos/models/product_card_config.dart';
import 'package:krua_pos/widgets/dynamic_product_card.dart';
import 'dart:convert'; // สำหรับ jsonDecode

// สมมติว่านี่คือข้อมูล Configuration ที่โหลดมาจาก Database (หรือไฟล์ JSON)
// ในความเป็นจริง คุณจะต้องมี service สำหรับโหลดข้อมูลนี้
const String _mockConfigJson = '''
[
  {
    "layoutId": "normal_product_layout",
    "layoutName": "Default Product View",
    "applicablePromotionType": "Normal",
    "elements": [
      {
        "id": "prod_image",
        "type": "image",
        "position": "mainContent",
        "style": {}
      },
      {
        "id": "prod_name_th",
        "type": "productNameTh",
        "position": "bottomLeft",
        "style": {
          "fontSize": 14.0,
          "textColor": 4278190080,
          "fontWeight": "bold"
        }
      },
      {
        "id": "prod_price",
        "type": "price",
        "position": "bottomRight",
        "style": {
          "fontSize": 16.0,
          "textColor": 4278190080
        }
      }
    ]
  },
  {
    "layoutId": "discount_product_layout",
    "layoutName": "Discount Product View",
    "applicablePromotionType": "Discount",
    "elements": [
      {
        "id": "prod_image",
        "type": "image",
        "position": "mainContent",
        "style": {}
      },
      {
        "id": "prod_name_th",
        "type": "productNameTh",
        "position": "bottomLeft",
        "style": {
          "fontSize": 14.0,
          "textColor": 4278190080,
          "fontWeight": "bold"
        }
      },
      {
        "id": "promo_price",
        "type": "promotionPrice",
        "position": "topRight",
        "style": {
          "fontSize": 18.0,
          "textColor": 4278255360,
          "fontWeight": "bold"
        }
      },
      {
        "id": "promo_badge",
        "type": "promotionBadge",
        "position": "topLeft",
        "style": {
          "backgroundColor": 4294901760,
          "textColor": 4294967295,
          "fontSize": 12.0,
          "padding": 4.0,
          "borderRadius": 4.0
        }
      }
    ]
  },
  {
    "layoutId": "step_price_product_layout",
    "layoutName": "Step Price Product View",
    "applicablePromotionType": "StepPrice",
    "elements": [
      {
        "id": "prod_image",
        "type": "image",
        "position": "mainContent",
        "style": {}
      },
      {
        "id": "prod_name_th",
        "type": "productNameTh",
        "position": "bottomLeft",
        "style": {
          "fontSize": 13.0,
          "textColor": 4278190080,
          "fontWeight": "bold"
        }
      },
      {
        "id": "step_price",
        "type": "stepPrice",
        "position": "bottomRight",
        "style": {
          "fontSize": 10.0,
          "textColor": 4279097960
        }
      },
      {
        "id": "custom_icon",
        "type": "customIcon",
        "position": "topRight",
        "style": {}
      }
    ]
  }
]
''';


class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<ProductCardLayoutConfig> _allLayoutConfigs = [];
  List<ProductData> _products = [];

  @override
  void initState() {
    super.initState();
    _loadConfigurationsAndProducts();
  }

  void _loadConfigurationsAndProducts() {
    // โหลด Configuration จาก JSON string (ในความเป็นจริงจะโหลดจาก API/DB)
    final List<dynamic> configJsonList = jsonDecode(_mockConfigJson);
    _allLayoutConfigs = configJsonList
        .map((json) => ProductCardLayoutConfig.fromJson(json as Map<String, dynamic>))
        .toList();

    // สร้างข้อมูลสินค้า Mock (ในความเป็นจริงจะโหลดจาก API)
    _products = [
      ProductData(
        id: 'P001',
        imageUrl: 'https://via.placeholder.com/150/FF0000/FFFFFF?text=Product+A',
        nameTh: 'สินค้า A (ปกติ)',
        nameEn: 'Product A (Normal)',
        originalPrice: 150.00,
        promotionType: 'Normal', // กำหนด type เพื่อเลือก layout
      ),
      ProductData(
        id: 'P002',
        imageUrl: 'https://via.placeholder.com/150/0000FF/FFFFFF?text=Product+B',
        nameTh: 'สินค้า B (ลดราคา)',
        nameEn: 'Product B (Discounted)',
        originalPrice: 199.00,
        promotionPrice: 99.00,
        promotionType: 'Discount',
        promotionText: 'ลด 50%',
      ),
      ProductData(
        id: 'P003',
        imageUrl: 'https://via.placeholder.com/150/FFFF00/000000?text=Product+C',
        nameTh: 'สินค้า C (ราคาขั้นบันได)',
        nameEn: 'Product C (Step Price)',
        originalPrice: 120.00,
        promotionType: 'StepPrice',
        stepPrices: [
          {'qty': 1, 'price': 120.0},
          {'qty': 3, 'price': 100.0},
          {'qty': 5, 'price': 80.0},
        ],
        customIconUrl: 'https://pics.freeicons.io/uploads/icons/png/15729792081530932591-24.png' // ตัวอย่างไอคอน
      ),
      ProductData(
        id: 'P004',
        imageUrl: 'https://via.placeholder.com/150/00FF00/000000?text=Product+D',
        nameTh: 'สินค้า D (ไม่มีโปรโมชั่น)',
        nameEn: 'Product D (No Promo)',
        originalPrice: 75.00,
        promotionType: 'Normal',
      ),
      // สินค้าที่ไม่มี config ตรงกัน จะใช้ default
      ProductData(
        id: 'P005',
        imageUrl: 'https://via.placeholder.com/150/FF00FF/FFFFFF?text=Product+E',
        nameTh: 'สินค้า E (โปรโมชั่นไม่รู้จัก)',
        nameEn: 'Product E (Unknown Promo)',
        originalPrice: 250.00,
        promotionPrice: 200.00,
        promotionType: 'UnknownPromoType', // จะใช้ default layout
      ),
    ];
    setState(() {}); // แจ้งให้ Widget rebuild หลังจากโหลดข้อมูล
  }

  // ฟังก์ชันสำหรับเลือก Layout Config ที่ถูกต้องสำหรับสินค้าแต่ละชิ้น
  ProductCardLayoutConfig _getLayoutConfigForProduct(ProductData product) {
    // พยายามหา layout ที่ตรงกับ promotionType ของสินค้า
    final config = _allLayoutConfigs.firstWhere(
      (layout) => layout.applicablePromotionType == product.promotionType,
      orElse: () {
        // หากไม่พบ ให้ใช้ layout สำหรับ 'Normal' หรือ layout เริ่มต้น (ถ้ามี)
        return _allLayoutConfigs.firstWhere(
          (layout) => layout.applicablePromotionType == 'Normal',
          orElse: () => const ProductCardLayoutConfig( // Default fallback config
            layoutId: 'fallback',
            layoutName: 'Fallback Layout',
            applicablePromotionType: 'Fallback',
            elements: [
              CardElementConfig(id: 'img', type: CardElementType.image, position: CardPosition.mainContent),
              CardElementConfig(id: 'name', type: CardElementType.text, position: CardPosition.bottomLeft, style: ElementStyle(fontSize: 14.0)),
              CardElementConfig(id: 'price', type: CardElementType.text, position: CardPosition.bottomRight, style: ElementStyle(fontSize: 16.0)),
            ],
          ),
        );
      },
    );
    return config;
  }

  @override
  Widget build(BuildContext context) {
    if (_allLayoutConfigs.isEmpty || _products.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Dynamic Product Cards from Config')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 16.0,
          runSpacing: 16.0,
          children: _products.map((product) {
            final layoutConfig = _getLayoutConfigForProduct(product);
            return DynamicProductCard(
              product: product,
              layoutConfig: layoutConfig,
              onTap: () {
                // Implement navigation or other actions
                print('Tapped on ${product.nameTh} with layout: ${layoutConfig.layoutName}');
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}