import 'package:flutter/material.dart';
import 'package:krua_pos/models/product.dart';
import 'package:krua_pos/models/product_card_config.dart';

class DynamicProductCard extends StatelessWidget {
  final ProductCardLayoutConfig layoutConfig;
  final double width;
  final double height;

  const DynamicProductCard({
    Key? key,
    required this.layoutConfig,
    this.width = 200,
    this.height = 250,
  }) : super(key: key);

  // Helper method เพื่อสร้าง Widget ตามประเภทของ CardElementConfig
  Widget _buildElementWidget(CardElementConfig config) {
    // กำหนด TextStyle โดยใช้ค่าจาก config.style
    TextStyle textStyle = TextStyle(
      fontSize: config.properties.fontSize,
      color: config.properties.textColor,
      fontWeight: config.properties.fontWeight,
      decoration: config.properties.textDecoration,
    );

    // สร้าง Widget ที่มี padding และ background ถ้ามีการกำหนดใน style
    Widget wrapWithStyle(Widget child) {
      if (config.properties.padding != null || config.properties.backgroundColor != null || config.properties.borderRadius != null) {
        return Container(
          padding: EdgeInsets.all(config.properties.padding ?? 0),
          decoration: BoxDecoration(
            color: config.properties.backgroundColor,
            borderRadius: BorderRadius.circular(config.properties.borderRadius ?? 0),
          ),
          child: child,
        );
      }
      return child;
    }

    Widget elementContent;

    switch (config.type) {
      case CardElementType.image:
        elementContent = config.properties.isNotEmpty
          ? Image.network(config.properties, fit: BoxFit.cover)
          : const SizedBox.shrink();
        break;

      case CardElementType.text:
        elementContent = content.isNotEmpty
          ? elementContent = Text(
            content,
            style: textStyle,
            textAlign: config.properties.textAlign, // ใช้ค่าจาก config.style.textAlign
            overflow: TextOverflow.ellipsis,
            maxLines: config.properties.maxLines, // ใช้ค่าจาก config.style.maxLines ถ้ามี
          )
        : const SizedBox.shrink();
        break;
      case CardElementType.icon:
        elementContent = content.isNotEmpty
          ? Image.network(content, width: 24, height: 24)
          : const SizedBox.shrink();
        break;
      default:
        elementContent = const SizedBox.shrink();
    }
    return wrapWithStyle(elementContent); // ห่อด้วย style ที่กำหนด
  }

  // Helper method ในการห่อหุ้ม Widget ด้วย Positioned หรือ Align (เหมือนเดิม)
  Widget _wrapWithPosition(Widget child, CardPosition position) {
    const double margin = 8.0;

    switch (position) {
      case CardPosition.topLeft:
        return Positioned(top: margin, left: margin, child: child);
      case CardPosition.topRight:
        return Positioned(top: margin, right: margin, child: child);
      case CardPosition.bottomLeft:
        return Positioned(bottom: margin, left: margin, child: child);
      case CardPosition.bottomRight:
        return Positioned(bottom: margin, right: margin, child: child);
      case CardPosition.center:
        return Center(child: child);
      case CardPosition.mainContent:
        return Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.all(margin),
            child: Align(alignment: Alignment.center, child: child),
          ),
        );
      case CardPosition.overlayTopLeft:
        return Positioned(top: 0, left: 0, child: child);
      case CardPosition.overlayTopRight:
        return Positioned(top: 0, right: 0, child: child);
      case CardPosition.overlayBottomLeft:
        return Positioned(bottom: 0, left: 0, child: child);
      case CardPosition.overlayBottomRight:
        return Positioned(bottom: 0, right: 0, child: child);
      default:
        return Center(child: child);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    for (var config in layoutConfig.elements) {
      final elementWidget = _buildElementWidget(config);
      if (elementWidget != const SizedBox.shrink()) {
        children.add(_wrapWithPosition(elementWidget, config.properties.position));
      }
    }

    return GestureDetector(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: children,
          ),
        ),
      ),
    );
  }
}