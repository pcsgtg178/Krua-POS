
import 'package:freezed_annotation/freezed_annotation.dart';

part 'receipt.g.dart';

@JsonSerializable()
class Receipt {
  const Receipt({
    required this.receiptId,
    required this.itemList,
  });

  factory Receipt.fromJson(Map<String, Object?> json) => _$ReceiptFromJson(json);

  final String receiptId;
  final List<String> itemList;

  static const empty = Receipt(
    receiptId: '',
    itemList: <String>[],
  );

  Receipt copyWith({
    String? receiptId,
    List<String>? itemList,
  }) {
    return Receipt(
      receiptId: receiptId ?? this.receiptId,
      itemList: itemList ?? this.itemList,
    );
  }

  Map<String, dynamic> toJson() => _$ReceiptToJson(this);
}