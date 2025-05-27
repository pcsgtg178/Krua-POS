import 'package:flutter/material.dart';

// Enum สำหรับตำแหน่งต่างๆ ใน Card (เหมือนเดิม)
enum CardPosition {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
  center,
  // เพิ่มตำแหน่งที่ยืดหยุ่น เช่น mainContent (ส่วนกลาง), overlayTopLeft (ทับซ้อน)
  mainContent,
  overlayTopLeft,
  overlayTopRight,
  overlayBottomLeft,
  overlayBottomRight,
}

// Enum สำหรับประเภทของข้อมูล/Widget ที่ต้องการแสดง (เหมือนเดิม)
enum CardElementType {
  image,
  text,
  icon
}

// Class สำหรับกำหนด Style/Parameters ของ Element
// ช่วยให้ User กำหนด Font Size, Color, etc. ได้
class ElementProperties {
  final double? fontSize;
  final Color? textColor;
  final Color? backgroundColor;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  final double? padding;
  final double? borderRadius;
  final CardPosition position;
  final int maxLines; // จำนวนบรรทัดสูงสุดสำหรับ Text (ถ้าเป็น Text Element)

  const ElementProperties ({
    this.fontSize,
    this.textColor,
    this.backgroundColor,
    this.fontWeight,
    this.textDecoration,
    this.textAlign,
    this.padding,
    this.borderRadius,
    this.position = CardPosition.center,
    this.maxLines = 1,
  });

  // Factory constructor สำหรับการสร้างจาก Map (จาก JSON)
  factory ElementProperties .fromJson(Map<String, dynamic> json) {
    return ElementProperties (
      fontSize: (json['fontSize'] as num?)?.toDouble(),
      textColor: json['textColor'] != null ? Color(json['textColor'] as int) : null,
      backgroundColor: json['backgroundColor'] != null ? Color(json['backgroundColor'] as int) : null,
      fontWeight: json['fontWeight'] != null ? FontWeight.values.firstWhere(
        (e) => e.toString() == 'FontWeight.${json['fontWeight']}',
        orElse: () => FontWeight.normal,
      ) : null,
      textDecoration: json['textDecoration'] != null
          ? {
              'none': TextDecoration.none,
              'underline': TextDecoration.underline,
              'overline': TextDecoration.overline,
              'lineThrough': TextDecoration.lineThrough,
            }[json['textDecoration']]
          : null,
      // แก้ไข: TextAlign.values ไม่มี (ควรใช้ .values หรือ map จาก String)
      textAlign: json['textAlign'] != null
          ? TextAlign.values.firstWhere( // ใช้ .values ได้ถูกต้อง
              (e) => e.toString().split('.').last == json['textAlign'],
              orElse: () => TextAlign.start, // Default fallback ถ้าไม่มีค่าที่ตรงกัน
            )
          : null, // สามารถเป็น null ได้ถ้าต้องการให้ default เป็นของ Text widget
      padding: (json['padding'] as num?)?.toDouble(),
      borderRadius: (json['borderRadius'] as num?)?.toDouble(),
      position: CardPosition.values.firstWhere(
        (e) => e.toString() == 'CardPosition.${json['position']}',
        orElse: () => CardPosition.center, // Default fallback ถ้าไม่มีค่าที่ตรงกัน
      ),
      maxLines: (json['maxLines'] as num?)?.toInt() ?? 1,
    );
  }

  // แปลงเป็น Map สำหรับการเก็บเป็น JSON
  Map<String, dynamic> toJson() {
    return {
      if (fontSize != null) 'fontSize': fontSize,
      if (textColor != null) 'textColor': textColor!.value, // เก็บเป็น int
      if (backgroundColor != null) 'backgroundColor': backgroundColor!.value,
      if (fontWeight != null) 'fontWeight': fontWeight!.toString().split('.').last,
      if (textDecoration != null) 'textDecoration': textDecoration!.toString().split('.').last,
      if (textAlign != null) 'textAlign': textAlign!.toString().split('.').last,
      if (padding != null) 'padding': padding,
      'position': position.toString().split('.').last,
      'maxLines': maxLines,
    };
  }
}


// Class ที่บอกว่า Product Card ควรแสดง Element ใดบ้าง และแต่ละ Element มี Style อย่างไร
class CardElementConfig {
  final String id; // Unique ID สำหรับแต่ละ Element เพื่อให้ Admin UI อ้างถึงได้
  final CardElementType type;
  final ElementProperties properties; // Style ที่ User กำหนด

  const CardElementConfig({
    required this.id,
    required this.type,
    this.properties = const ElementProperties (), // Default style
  });

  // Factory constructor สำหรับการสร้างจาก Map (จาก JSON)
  factory CardElementConfig.fromJson(Map<String, dynamic> json) {
    return CardElementConfig(
      id: json['id'] as String,
      type: CardElementType.values.firstWhere((e) => e.toString() == 'CardElementType.${json['type']}'),
      properties: json['properties'] != null ? ElementProperties .fromJson(json['properties'] as Map<String, dynamic>) : const ElementProperties (),
    );
  }

  // แปลงเป็น Map สำหรับการเก็บเป็น JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.toString().split('.').last,
      'properties': properties.toJson(),
    };
  }
}

// Class สำหรับ Product Card Layout Configuration โดยรวม
// User จะสร้างและบันทึกสิ่งนี้สำหรับแต่ละ "Promotion Type"
class ProductCardLayoutConfig {
  final String layoutId; // ID ของ Layout นี้ เช่น 'default_layout', 'promotion_a_layout'
  final String layoutName; // ชื่อที่แสดงใน Admin UI เช่น "Default Product View", "โปรโมชั่นลดราคา"
  final String applicablePromotionType; // ระบุว่า Layout นี้ใช้กับโปรโมชั่นประเภทใด (e.g., 'Discount', 'BuyOneGetOne')
  final List<CardElementConfig> elements; // รายการ Element ที่ User จัดวาง

  const ProductCardLayoutConfig({
    required this.layoutId,
    required this.layoutName,
    required this.applicablePromotionType,
    required this.elements,
  });

  // Factory constructor สำหรับการสร้างจาก Map (จาก JSON)
  factory ProductCardLayoutConfig.fromJson(Map<String, dynamic> json) {
    return ProductCardLayoutConfig(
      layoutId: json['layoutId'] as String,
      layoutName: json['layoutName'] as String,
      applicablePromotionType: json['applicablePromotionType'] as String,
      elements: (json['elements'] as List<dynamic>)
          .map((e) => CardElementConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  // แปลงเป็น Map สำหรับการเก็บเป็น JSON
  Map<String, dynamic> toJson() {
    return {
      'layoutId': layoutId,
      'layoutName': layoutName,
      'applicablePromotionType': applicablePromotionType,
      'elements': elements.map((e) => e.toJson()).toList(),
    };
  }
}